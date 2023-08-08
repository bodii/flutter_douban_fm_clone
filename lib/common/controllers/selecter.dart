import 'package:flutter/material.dart';

class BatchSelector extends ChangeNotifier {
  bool _selected = false;
  bool get isSelected => _selected;
  void toggle(AllSelector allSelector) {
    _selected = !_selected;
    notifyListeners();

    allSelector.sync();

    debugPrint('all: ${allSelector.isAllSelected}');
  }

  void setSelected() {
    if (!_selected) {
      _selected = true;
      notifyListeners();
    }
  }

  void setNotSelect() {
    if (_selected) {
      _selected = false;
      notifyListeners();
    }
  }
}

class AllSelector extends ChangeNotifier {
  addAll(List<BatchSelector> selecterList) {
    _selecterList = selecterList;
  }

  add(BatchSelector selecter) {
    _selecterList.add(selecter);
  }

  List<BatchSelector> _selecterList = [];

  bool _allSelected = false;

  bool get isAllSelected => _allSelected;

  set setVal(bool v) {
    _allSelected = v;
  }

  bool getAllSelectState() {
    for (BatchSelector selector in _selecterList) {
      if (!selector.isSelected) {
        return false;
      }
    }

    return true;
  }

  void sync() {
    bool currentState = getAllSelectState();
    if (currentState != _allSelected) {
      _allSelected = currentState;
      notifyListeners();
    }
  }

  void toggle() {
    if (_allSelected) {
      setNotSelect();
    } else {
      setSelected();
    }
  }

  void setSelected() {
    for (BatchSelector selector in _selecterList) {
      if (!selector.isSelected) {
        selector.setSelected();
      }
    }

    _allSelected = true;
    notifyListeners();
  }

  void setNotSelect() {
    for (BatchSelector selector in _selecterList) {
      if (selector.isSelected) {
        selector.setNotSelect();
      }
    }

    _allSelected = false;
    notifyListeners();
  }
}
