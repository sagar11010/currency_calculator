import 'package:structure_app/di/injector_provider.dart';
import 'package:structure_app/network/custom_exception.dart';
import 'package:structure_app/network/repository/currency_exchange_repository.dart';
import 'package:structure_app/shared/utility/logger.dart';
import 'package:mobx/mobx.dart';

part 'currency_picker_view_model.g.dart';

class CurrencyPickerViewModel = _CurrencyPickerViewModel with _$CurrencyPickerViewModel;

abstract class _CurrencyPickerViewModel with Store {
  final CurrencyExchangeRepository _currencyExchangeService =
      getIt<CurrencyExchangeRepository>();

  @observable
  Map<String, String> currencyTypeData = {};

  @observable
  String filter = '';

  @observable
  late CustomException exception;

  @action
  void setFilter(String filter) {
    this.filter = filter;
  }

  @action
  Future<void> getCurrencyTypeList() async {
    var v = await _currencyExchangeService.getCurrencyTypeList();
    v.fold((l) => Logger.prints(l), (r) {
      currencyTypeData = r.symbols;
    });
  }
}
