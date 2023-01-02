// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculator_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CalculatorViewModel on _CalculatorViewModel, Store {
  late final _$connectivityStreamAtom =
      Atom(name: '_CalculatorViewModel.connectivityStream', context: context);

  @override
  ObservableStream<ConnectivityResult> get connectivityStream {
    _$connectivityStreamAtom.reportRead();
    return super.connectivityStream;
  }

  @override
  set connectivityStream(ObservableStream<ConnectivityResult> value) {
    _$connectivityStreamAtom.reportWrite(value, super.connectivityStream, () {
      super.connectivityStream = value;
    });
  }

  late final _$selectedArithmaticTypeAtom = Atom(
      name: '_CalculatorViewModel.selectedArithmaticType', context: context);

  @override
  String get selectedArithmaticType {
    _$selectedArithmaticTypeAtom.reportRead();
    return super.selectedArithmaticType;
  }

  @override
  set selectedArithmaticType(String value) {
    _$selectedArithmaticTypeAtom
        .reportWrite(value, super.selectedArithmaticType, () {
      super.selectedArithmaticType = value;
    });
  }

  late final _$selectedCurrencyTypeTempAtom = Atom(
      name: '_CalculatorViewModel.selectedCurrencyTypeTemp', context: context);

  @override
  String get selectedCurrencyTypeTemp {
    _$selectedCurrencyTypeTempAtom.reportRead();
    return super.selectedCurrencyTypeTemp;
  }

  @override
  set selectedCurrencyTypeTemp(String value) {
    _$selectedCurrencyTypeTempAtom
        .reportWrite(value, super.selectedCurrencyTypeTemp, () {
      super.selectedCurrencyTypeTemp = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_CalculatorViewModel.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$selectedDefaultCurrencyTypeAtom = Atom(
      name: '_CalculatorViewModel.selectedDefaultCurrencyType',
      context: context);

  @override
  String get selectedDefaultCurrencyType {
    _$selectedDefaultCurrencyTypeAtom.reportRead();
    return super.selectedDefaultCurrencyType;
  }

  @override
  set selectedDefaultCurrencyType(String value) {
    _$selectedDefaultCurrencyTypeAtom
        .reportWrite(value, super.selectedDefaultCurrencyType, () {
      super.selectedDefaultCurrencyType = value;
    });
  }

  late final _$outputStrAtom =
      Atom(name: '_CalculatorViewModel.outputStr', context: context);

  @override
  String get outputStr {
    _$outputStrAtom.reportRead();
    return super.outputStr;
  }

  @override
  set outputStr(String value) {
    _$outputStrAtom.reportWrite(value, super.outputStr, () {
      super.outputStr = value;
    });
  }

  late final _$getCurrencyDataListAsyncAction =
      AsyncAction('_CalculatorViewModel.getCurrencyDataList', context: context);

  @override
  Future<void> getCurrencyDataList() {
    return _$getCurrencyDataListAsyncAction
        .run(() => super.getCurrencyDataList());
  }

  late final _$_CalculatorViewModelActionController =
      ActionController(name: '_CalculatorViewModel', context: context);

  @override
  void setCurrencyTypeTemp(String s) {
    final _$actionInfo = _$_CalculatorViewModelActionController.startAction(
        name: '_CalculatorViewModel.setCurrencyTypeTemp');
    try {
      return super.setCurrencyTypeTemp(s);
    } finally {
      _$_CalculatorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDefaultCurrencyType(String s) {
    final _$actionInfo = _$_CalculatorViewModelActionController.startAction(
        name: '_CalculatorViewModel.setDefaultCurrencyType');
    try {
      return super.setDefaultCurrencyType(s);
    } finally {
      _$_CalculatorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOutputStr(String s) {
    final _$actionInfo = _$_CalculatorViewModelActionController.startAction(
        name: '_CalculatorViewModel.setOutputStr');
    try {
      return super.setOutputStr(s);
    } finally {
      _$_CalculatorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setArithmaticType(String s) {
    final _$actionInfo = _$_CalculatorViewModelActionController.startAction(
        name: '_CalculatorViewModel.setArithmaticType');
    try {
      return super.setArithmaticType(s);
    } finally {
      _$_CalculatorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeInputField(CurrencyField val) {
    final _$actionInfo = _$_CalculatorViewModelActionController.startAction(
        name: '_CalculatorViewModel.removeInputField');
    try {
      return super.removeInputField(val);
    } finally {
      _$_CalculatorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addInputField(CurrencyField val) {
    final _$actionInfo = _$_CalculatorViewModelActionController.startAction(
        name: '_CalculatorViewModel.addInputField');
    try {
      return super.addInputField(val);
    } finally {
      _$_CalculatorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeInputFieldData(int index, String currencyType) {
    final _$actionInfo = _$_CalculatorViewModelActionController.startAction(
        name: '_CalculatorViewModel.changeInputFieldData');
    try {
      return super.changeInputFieldData(index, currencyType);
    } finally {
      _$_CalculatorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFieldList() {
    final _$actionInfo = _$_CalculatorViewModelActionController.startAction(
        name: '_CalculatorViewModel.clearFieldList');
    try {
      return super.clearFieldList();
    } finally {
      _$_CalculatorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calculateData() {
    final _$actionInfo = _$_CalculatorViewModelActionController.startAction(
        name: '_CalculatorViewModel.calculateData');
    try {
      return super.calculateData();
    } finally {
      _$_CalculatorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setError(String msg) {
    final _$actionInfo = _$_CalculatorViewModelActionController.startAction(
        name: '_CalculatorViewModel.setError');
    try {
      return super.setError(msg);
    } finally {
      _$_CalculatorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
connectivityStream: ${connectivityStream},
selectedArithmaticType: ${selectedArithmaticType},
selectedCurrencyTypeTemp: ${selectedCurrencyTypeTemp},
errorMessage: ${errorMessage},
selectedDefaultCurrencyType: ${selectedDefaultCurrencyType},
outputStr: ${outputStr}
    ''';
  }
}
