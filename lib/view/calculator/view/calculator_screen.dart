import 'package:structure_app/view/calculator/widget/input_field_widget.dart';
import 'package:structure_app/view/currency_picker/widgets/currency_type_bottomsheet.dart';
import 'package:structure_app/view_model/calculator/calculator_view_model.dart';
import 'package:structure_app/view_model/currency_picker/currency_picker_view_model.dart';
import 'package:mobx/mobx.dart';
import '../../../shared/contstants/imports.dart';

///[CalculatorScreen] this class show currency calculation UI
class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  late CalculatorViewModel _calculatorViewModel;
  late CurrencyPickerViewModel _currencyPickerViewModel;

  @override
  void initState() {
    super.initState();
    _calculatorViewModel =
        Provider.of<CalculatorViewModel>(context, listen: false);
    _currencyPickerViewModel =
        Provider.of<CurrencyPickerViewModel>(context, listen: false);
    _currencyPickerViewModel.getCurrencyTypeList();
    _calculatorViewModel.getCurrencyDataList();
    initDisposer();
  }

  Widget getFieldListView() {
    return Observer(
        builder: (_) => _calculatorViewModel.inputFields.isNotEmpty
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _calculatorViewModel.inputFields.length,
                itemBuilder: (ctx, index) {
                  return InputFieldWidget(
                    _calculatorViewModel.inputFields[index],
                    _calculatorViewModel,
                    index: index,
                  );
                })
            : const Padding(
                child: const Text(
                  Strings.pleaseClickOnAddFieldButton,
                  style: TextStyle(fontSize: 18),
                ),
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              ));
  }

  List<ReactionDisposer> _disposers = [];

  void initDisposer() {
    _disposers = <ReactionDisposer>[
      reaction((_) => _calculatorViewModel.connectivityStream.value, (r) {
        SnackBarUtil.showSnackBars(context,
            r == ConnectivityResult.none ? 'You\'re offline' : 'You\'re online',
            bgColor: r == ConnectivityResult.none ? Colors.red : Colors.green);
      }),
      reaction((_) => _calculatorViewModel.errorMessage, (r) {
        if (r != '') {
          SnackBarUtil.showSnackBars(context, r.toString());
        }
      }, equals: (a, b) => false)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.currencyCalculator),
      ),
      body: body,
    );
  }

  Widget get body => Column(
        children: [
          Expanded(
              child: Container(
            color: Colors.grey.withOpacity(0.2),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  getFieldListView(),
                  addFieldButton,
                ],
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Observer(
              builder: (_) => Row(
                children: [
                  const Text(
                    Strings.selectOutputCurrency,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(_calculatorViewModel.selectedDefaultCurrencyType),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: Text(
                        _calculatorViewModel.selectedDefaultCurrencyType == ''
                            ? Strings.select
                            : Strings.change,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        _currencyPickerViewModel.setFilter('');
                        Navigator.pushNamed(context, Routes.currencyPicker);
                      }),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Observer(
                  builder: (_) => Text(
                        "${Strings.total} ${_calculatorViewModel.outputStr}",
                        style: TextStyle(fontWeight: FontWeight.w800),
                      )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                resetButton,
                const SizedBox(
                  width: 50,
                ),
                calculateButton,
              ],
            ),
          )
        ],
      );

  Widget get addFieldButton => Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            child: const Text(
              Strings.addField,
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              CurrencyTypeBottomSheet.openBottomSheet(0, context: context);
            },
          ),
        ),
      );

  Widget get resetButton => Expanded(
        child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: AppColors.primaryColor,
                      width: 1,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            child: const Text(
              Strings.reset,
              style: TextStyle(color: AppColors.primaryColor),
            ),
            onPressed: () {
              _calculatorViewModel.clearFieldList();
            }),
      );

  Widget get calculateButton => Expanded(
        child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            child: const Text(
              Strings.calculate,
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              _calculatorViewModel.calculateData();
            }),
      );
}
