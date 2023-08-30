import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:android_path_provider/android_path_provider.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

@pragma('vm:entry-point')
enum DownloadStatus {
  /// Status of the task is either unknown or corrupted.
  undefined,

  /// The task is scheduled, but is not running yet.
  enqueued,

  /// The task is in progress.
  running,

  /// The task has completed successfully.
  complete,

  /// The task has failed.
  failed,

  /// The task was canceled and cannot be resumed.
  canceled,

  /// The task was paused and can be resumed
  paused;

  /// Creates a new [DownloadStatus] from an [int].
  factory DownloadStatus.fromInt(int value) {
    switch (value) {
      case 0:
        return DownloadStatus.undefined;
      case 1:
        return DownloadStatus.enqueued;
      case 2:
        return DownloadStatus.running;
      case 3:
        return DownloadStatus.complete;
      case 4:
        return DownloadStatus.failed;
      case 5:
        return DownloadStatus.canceled;
      case 6:
        return DownloadStatus.paused;
      default:
        throw ArgumentError('Invalid value: $value');
    }
  }
}

class FileDownlaod with WidgetsBindingObserver {
  FileDownlaod({required this.downloadUrl, required this.saveFileName});

  final String saveFileName;
  final String downloadUrl;

  late TaskInfo _task;
  // late ItemHolder _item;
  // late bool _showContent;
  late bool _permissionReady;
  late bool _saveInPublicStorage;
  late String _localPath;
  final ReceivePort _port = ReceivePort('test_download');

  T? _ambiguate<T>(T? value) => value;

  Future<void> init() async {
    _ambiguate(WidgetsBinding.instance)!.addObserver(this);
    _bindBackgroundIsolate();

    FlutterDownloader.registerCallback(downloadCallback, step: 1);

    _permissionReady = false;
    _saveInPublicStorage = false;

    await _prepare();
  }

  void cancel() {
    _unbindBackgroundIsolate();
  }

  Future<void> _prepare() async {
    final tasks = await FlutterDownloader.loadTasks();
    print(tasks);

    if (tasks == null) {
      print('No tasks were retrieved from the database.');
      return;
    }

    _task = TaskInfo(name: saveFileName, link: downloadUrl);
    print(_task);
    print(
      'Callback on UI isolate: '
      'task (${_task.taskId}) is in status (${_task.status}) and process (${_task.progress})',
    );
    // _item = ItemHolder(name: 'Musics', task: _task);

    _permissionReady = await _checkPermission();
    if (_permissionReady) {
      await _prepareSaveDir();
    }

    // _showContent = true;
  }

  Future<bool> _checkPermission() async {
    if (Platform.isIOS) {
      return true;
    }

    if (Platform.isAndroid) {
      final info = await DeviceInfoPlugin().androidInfo;
      if (info.version.sdkInt > 28) {
        return true;
      }

      final status = await Permission.storage.status;
      if (status == PermissionStatus.granted) {
        return true;
      }

      final result = await Permission.storage.request();
      return result == PermissionStatus.granted;
    }

    throw StateError('unknown platform');
  }

  Future<void> _prepareSaveDir() async {
    _localPath = (await _getSavedDir())!;
    print('save local path: $_localPath');
    final savedDir = Directory(_localPath);
    if (!savedDir.existsSync()) {
      await savedDir.create();
    }
  }

  Future<String?> _getSavedDir() async {
    String? externalStorageDirPath;

    if (Platform.isAndroid) {
      try {
        // externalStorageDirPath = await AndroidPathProvider.downloadsPath;
        externalStorageDirPath = await AndroidPathProvider.musicPath;
      } catch (err, st) {
        print('failed to get downloads path: $err, $st');

        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    }
    return externalStorageDirPath;
  }

  void _bindBackgroundIsolate() {
    print('bindBackgroundIsolate: in');
    final isSuccess = IsolateNameServer.registerPortWithName(
      _port.sendPort,
      'downloader_send_port',
    );
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }

    log('bindBackgroundIsolate: start port.listen');
    _port.listen((dynamic data) {
      log('bindBackgroundIsolate: port data content:');
      print(data);
      final taskId = (data as List<dynamic>)[0] as String;
      final status = DownloadTaskStatus.fromInt(data[1] as int);
      final progress = data[2] as int;

      log(
        'Callback on UI isolate: '
        'task ($taskId) is in status ($status) and process ($progress)',
      );

      _task
        ..taskId = taskId
        ..status = status
        ..progress = progress;
    });
  }

  void _unbindBackgroundIsolate() {
    log('remove old port');
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  @pragma('vm:entry-point')
  static void downloadCallback(
    String id,
    int status,
    int progress,
  ) {
    print(
      'Callback on background isolate: '
      'task ($id) is in status ($status) and process ($progress)',
    );

    IsolateNameServer.lookupPortByName('downloader_send_port')
        ?.send([id, status, progress]);
  }

  Future<void> retryRequestPermission() async {
    final hasGranted = await _checkPermission();

    if (hasGranted) {
      await _prepareSaveDir();
    }

    _permissionReady = hasGranted;
  }

  Future<void> request() async {
    _task.taskId = await FlutterDownloader.enqueue(
      url: _task.link!,
      // headers: {'auth': 'test_for_sql_encoding'},
      showNotification: true,
      savedDir: _localPath,
      saveInPublicStorage: _saveInPublicStorage,
      openFileFromNotification: true,
    );
    log('taskid: ${_task.taskId}', name: 'download');
    log('task status: ${_task.status}', name: 'download');
    log('task name: ${_task.name}', name: 'download');
  }

  Future<void> pause() async {
    await FlutterDownloader.pause(taskId: _task.taskId!);
  }

  Future<void> resume() async {
    final newTaskId = await FlutterDownloader.resume(taskId: _task.taskId!);
    _task.taskId = newTaskId;
  }

  Future<void> retry() async {
    final newTaskId = await FlutterDownloader.retry(taskId: _task.taskId!);
    _task.taskId = newTaskId;
  }

  Future<bool> open() async {
    final taskId = _task.taskId;
    if (taskId == null) {
      return false;
    }

    return FlutterDownloader.open(taskId: taskId);
  }

  Future<void> delete() async {
    await FlutterDownloader.remove(
      taskId: _task.taskId!,
      shouldDeleteContent: true,
    );
    // await _prepare();
  }
}

class ItemHolder {
  ItemHolder({this.name, this.task});

  final String? name;
  final TaskInfo? task;
}

class TaskInfo {
  TaskInfo({this.name, this.link});

  final String? name;
  final String? link;

  String? taskId;
  int? progress = 0;
  DownloadTaskStatus? status = DownloadTaskStatus.undefined;
}
