import 'package:math_expressions/math_expressions.dart';
import 'package:mobx/mobx.dart';
import 'package:structure_app/di/injector_provider.dart';
import 'package:structure_app/model/currency_field.dart';
import 'package:structure_app/network/model/currency_list_payment_response_model.dart';
import 'package:structure_app/network/repository/currency_exchange_repository.dart';
import '../../shared/contstants/imports.dart';

part 'calculator_view_model.g.dart';

class CalculatorViewModel = _CalculatorViewModel with _$CalculatorViewModel;

abstract class _CalculatorViewModel with Store {
  final CurrencyExchangeRepository _currencyExchangeService =
      getIt<CurrencyExchangeRepository>();

  @observable
  ObservableStream<ConnectivityResult> connectivityStream =
      ObservableStream(Connectivity().onConnectivityChanged);

  // List of input fields with their respective currency and value
  ObservableList<CurrencyField> inputFields = ObservableList.of([]);

  CurrencyListPaymentResponseModel? _currencyListPaymentResponseModel;

  @observable
  String selectedArithmaticType = '';

  @observable
  String selectedCurrencyTypeTemp = '';

  @observable
  String errorMessage = '';

  @observable
  String selectedDefaultCurrencyType = '';

  @action
  void setCurrencyTypeTemp(String s) {
    selectedCurrencyTypeTemp = s;
  }

  @observable
  String outputStr = '';

  @action
  void setDefaultCurrencyType(String s) {
    selectedDefaultCurrencyType = s;
  }

  @action
  void setOutputStr(String s) {
    outputStr = s;
  }

  @action
  void setArithmaticType(String s) {
    selectedArithmaticType = s;
  }

  @action
  void removeInputField(CurrencyField val) {
    inputFields.remove(val);
  }

  @action
  void addInputField(CurrencyField val) {
    inputFields.add(val);
  }

  @action
  void changeInputFieldData(int index, String currencyType) {
    inputFields[index] = CurrencyField(currencyType, inputFields[index].text,
        inputFields[index].arithmeticOperation);
  }

  @action
  void clearFieldList() {
    inputFields.clear();
    outputStr = '';
    selectedDefaultCurrencyType = '';
  }

  bool onValidate() {
    if (inputFields.isEmpty) {
      setError('Please add field first');
      return false;
    } else if (selectedDefaultCurrencyType == '') {
      setError('Please set output currency type');
      return false;
    } else if (inputFields.where((element) => element.text == '').isNotEmpty) {
      setError('Please fill all field');
      return false;
    } else {
      return true;
    }
  }

  @action
  void calculateData() {
    if (_currencyListPaymentResponseModel != null) {
      if (onValidate()) {
        List<CurrencyField> l = [];
        for (int i = 0; i < inputFields.length; i++) {
          double initial = double.parse(inputFields[i].text!);
          double euroConverted = initial /
              _currencyListPaymentResponseModel!
                  .rates[inputFields[i].currencyType]!;

          double outputConverted = euroConverted *
              _currencyListPaymentResponseModel!
                  .rates[selectedDefaultCurrencyType]!;

          l.add(CurrencyField(selectedDefaultCurrencyType,
              outputConverted.toString(), inputFields[i].arithmeticOperation));
        }

        String total = '';
        for (var element in l) {
          total = total + element.arithmeticOperation + element.text!;
        }
        Parser p = Parser();
        Expression exp = p.parse(total);
        ContextModel ctx = ContextModel();
        print("expression $total");
        double eval = exp.evaluate(EvaluationType.REAL, ctx);

        if (eval.isInfinite) {
          setError('Number can not divide by zero');

          return;
        }
        setOutputStr(eval.toStringAsFixed(2));
      }
    }
  }

  @action
  Future<void> getCurrencyDataList() async {
    (await _currencyExchangeService.getCurrencyDataList())
        .fold((l) => setError(l.message), (r) {
      setCurrencyListPaymentResponseModel(r);
    });
  }

  @action
  void setError(String msg) {
    errorMessage = msg;
  }

  void setCurrencyListPaymentResponseModel(
      CurrencyListPaymentResponseModel model) {
    _currencyListPaymentResponseModel = model;
  }
}
