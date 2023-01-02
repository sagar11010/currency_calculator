// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_picker_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CurrencyPickerViewModel on _CurrencyPickerViewModel, Store {
  late final _$currencyTypeDataAtom =
      Atom(name: '_CurrencyPickerViewModel.currencyTypeData', context: context);

  @override
  Map<String, String> get currencyTypeData {
    _$currencyTypeDataAtom.reportRead();
    return super.currencyTypeData;
  }

  @override
  set currencyTypeData(Map<String, String> value) {
    _$currencyTypeDataAtom.reportWrite(value, super.currencyTypeData, () {
      super.currencyTypeData = value;
    });
  }

  late final _$filterAtom =
      Atom(name: '_CurrencyPickerViewModel.filter', context: context);

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$exceptionAtom =
      Atom(name: '_CurrencyPickerViewModel.exception', context: context);

  @override
  CustomException get exception {
    _$exceptionAtom.reportRead();
    return super.exception;
  }

  @override
  set exception(CustomException value) {
    _$exceptionAtom.reportWrite(value, super.exception, () {
      super.exception = value;
    });
  }

  late final _$getCurrencyTypeListAsyncAction = AsyncAction(
      '_CurrencyPickerViewModel.getCurrencyTypeList',
      context: context);

  @override
  Future<void> getCurrencyTypeList() {
    return _$getCurrencyTypeListAsyncAction
        .run(() => super.getCurrencyTypeList());
  }

  late final _$_CurrencyPickerViewModelActionController =
      ActionController(name: '_CurrencyPickerViewModel', context: context);

  @override
  void setFilter(String filter) {
    final _$actionInfo = _$_CurrencyPickerViewModelActionController.startAction(
        name: '_CurrencyPickerViewModel.setFilter');
    try {
      return super.setFilter(filter);
    } finally {
      _$_CurrencyPickerViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currencyTypeData: ${currencyTypeData},
filter: ${filter},
exception: ${exception}
    ''';
  }
}
