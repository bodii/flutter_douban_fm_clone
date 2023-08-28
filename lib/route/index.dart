import 'package:flutter_douban_fm_clone/common/controllers/login.dart';
import 'package:flutter_douban_fm_clone/database/user/login_account_db.dart';
import 'package:flutter_douban_fm_clone/models/user_model.dart';
import 'package:flutter_douban_fm_clone/pages/discovery/views/discovery_detail_page.dart';
import 'package:flutter_douban_fm_clone/pages/discovery/views/discovery_page.dart';
import 'package:flutter_douban_fm_clone/pages/error/views/error_page.dart';
import 'package:flutter_douban_fm_clone/pages/home/views/home_page.dart';
import 'package:flutter_douban_fm_clone/pages/play/views/music_play_page.dart';
import 'package:flutter_douban_fm_clone/pages/megacycle/views/megacycle_play_page.dart';
import 'package:flutter_douban_fm_clone/pages/my/collect/views/collect_index_page.dart';
import 'package:flutter_douban_fm_clone/pages/my/history/history_page.dart';
import 'package:flutter_douban_fm_clone/pages/my/local_download/local_download_page.dart';
import 'package:flutter_douban_fm_clone/pages/my/my_page.dart';
import 'package:flutter_douban_fm_clone/pages/my/settings/settings_pages.dart';
import 'package:flutter_douban_fm_clone/pages/my/song_list/views/my_song_list_batch_operation_page.dart';
import 'package:flutter_douban_fm_clone/pages/album/views/best_album_song_list_page.dart';
import 'package:flutter_douban_fm_clone/pages/my/song_list/views/my_song_list_page.dart';
import 'package:flutter_douban_fm_clone/pages/user/info/views/modify_user_info.dart';
import 'package:flutter_douban_fm_clone/pages/user/login/views/forgot_password_page.dart';
import 'package:flutter_douban_fm_clone/pages/user/login/views/no_sign_in_page.dart';
import 'package:flutter_douban_fm_clone/pages/artist/views/artist_home_page.dart';
import 'package:flutter_douban_fm_clone/pages/user/login/views/protection_policy_page.dart';
import 'package:flutter_douban_fm_clone/pages/user/login/views/sign_in_page.dart';
import 'package:flutter_douban_fm_clone/pages/user/login/views/sign_in_prompt_page.dart';
import 'package:flutter_douban_fm_clone/pages/user/login/views/sign_up_page.dart';
import 'package:flutter_douban_fm_clone/pages/user/login/views/usage_agreement_page.dart';
import 'package:flutter_douban_fm_clone/pages/welcome/views/index.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static final GoRouter routes = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const WelcomeIndexPage(),
      ),
      GoRoute(
        path: '/user/sign_in',
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: '/user/sign_in/no',
        builder: (context, state) => const NoSignInPage(),
      ),
      GoRoute(
        path: '/user/sign_in/prompt',
        builder: (context, state) => const SignInPromptPage(),
      ),
      GoRoute(
        path: '/user/sign_up',
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: '/user/forgot_password',
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: '/user/usage_agreement',
        builder: (context, state) => const UsageAgreementPage(),
      ),
      GoRoute(
        path: '/user/protection_policy',
        builder: (context, state) => const ProtectionPolicyPage(),
      ),
      GoRoute(
        path: '/user/info/modify',
        builder: (context, state) => const UserInfoModify(),
      ),
      GoRoute(
        path: '/home/index/:index',
        builder: (context, state) => HomePage(
          index: state.pathParameters['index'] ?? '0',
        ),
      ),
      GoRoute(
        path: '/best/album/songList',
        builder: (context, state) => const BestAlbumSongListPage(),
      ),
      GoRoute(
        path: '/artist/home',
        builder: (context, state) => const ArtistHomePage(),
      ),
      GoRoute(
        path: '/home/index/discovery/home',
        builder: (context, state) => const DiscoveryPage(),
      ),
      GoRoute(
        path: '/home/index/discovery/detail/:playListId',
        builder: (context, state) => DiscoveryDetailPage(
          playListId: state.pathParameters['playListId'] ?? '1',
        ),
      ),
      GoRoute(
        path: '/megacycle/playList/:playListId',
        builder: (context, state) => MegacyclePlayPage(
          playListId: state.pathParameters['playListId'] ?? '1',
        ),
      ),
      GoRoute(
        path: '/play/music/:musicId',
        builder: (context, state) => MusicPlayPage(
          musicId: state.pathParameters['musicId'] ?? '1',
        ),
      ),
      GoRoute(
        path: '/my',
        builder: (context, state) => const MyPage(),
        routes: [
          GoRoute(
            path: 'collect/index/:index',
            builder: (context, state) => CollectIndexPage(
              index: state.pathParameters['index'] ?? '0',
            ),
          ),
          GoRoute(
            path: 'local/download',
            builder: (context, state) => const LocalDownloadPage(),
          ),
          GoRoute(
            path: 'history',
            builder: (context, state) => const HistoryPage(),
          ),
          GoRoute(
            path: 'settings',
            builder: (context, state) => const SettingsPage(),
          ),
          GoRoute(
            path: 'songList/:mySongListName',
            builder: (context, state) => MySongListPage(
              songListName: state.pathParameters['mySongListName'] ?? '',
            ),
          ),
          GoRoute(
            path: 'songListOperation/BatchOperation',
            builder: (context, state) => const MySongListBatchOperationPage(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => ErrorPage(state.error!),
    debugLogDiagnostics: true,
  );
}
