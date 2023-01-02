import 'package:structure_app/view/currency_picker/widgets/currency_type_list_view.dart';
import 'package:structure_app/model/currency_field.dart';
import 'package:structure_app/shared/contstants/imports.dart';
import 'package:structure_app/view_model/calculator/calculator_view_model.dart';
import 'package:structure_app/view_model/currency_picker/currency_picker_view_model.dart';
///[CurrencyTypeBottomSheet] using this class you can access bottomSheet
class CurrencyTypeBottomSheet {
  static void openBottomSheet(int type,
      {int? selectedPos, required BuildContext context}) {
    CalculatorViewModel calculatorViewModel =
        Provider.of<CalculatorViewModel>(context, listen: false);
    CurrencyPickerViewModel currencyPickerViewModel =
        Provider.of<CurrencyPickerViewModel>(context, listen: false);
    calculatorViewModel.setArithmaticType('');
    calculatorViewModel.setCurrencyTypeTemp("");
    currencyPickerViewModel.setFilter('');
    Widget getArithmeticSelectionView(String text) {
      return Padding(
        padding: const EdgeInsets.only(right: 40),
        child: GestureDetector(
          child: text == calculatorViewModel.selectedArithmaticType
              ? CircleAvatar(
                  radius: 30,
                  child: Center(
                      child: Text(
                    text,
                    style: const TextStyle(fontSize: 40),
                    textAlign: TextAlign.center,
                  )))
              : Text(text, style: const TextStyle(fontSize: 50)),
          onTap: () {
            calculatorViewModel.setArithmaticType(text);
          },
        ),
      );
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      barrierColor: Colors.black.withOpacity(0.5),
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        bool isArithmaticVisible = calculatorViewModel.inputFields.isNotEmpty &&
            type == 0 &&
            selectedPos == null;
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.70,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 5, right: 20, left: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  if (isArithmaticVisible)
                    const Text(
                      Strings.chooseArithmaticOperation,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  if (isArithmaticVisible)
                    Observer(
                      builder: (_) => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          getArithmeticSelectionView('+'),
                          getArithmeticSelectionView('-'),
                          getArithmeticSelectionView('/'),
                          getArithmeticSelectionView('*'),
                        ],
                      ),
                    ),
                  const Text(
                    Strings.chooseCurrencyType,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Expanded(
                      child: CurrencyTypeListView(
                    type,
                    selectedIndex: selectedPos,
                  )),
                  if (type == 0 && selectedPos == null)
                    Center(
                      child: TextButton(
                        onPressed: () {
                          if (calculatorViewModel.selectedArithmaticType ==
                                  '' &&
                              calculatorViewModel.inputFields.isNotEmpty &&
                              type == 0) {
                            SnackBarUtil.showSnackBars(
                                context, Strings.pleaseSelectArithmeticType);
                          } else if ((calculatorViewModel
                                          .selectedCurrencyTypeTemp ==
                                      '' &&
                                  type == 0) ||
                              (calculatorViewModel
                                          .selectedDefaultCurrencyType ==
                                      '' &&
                                  type == 1)) {
                            SnackBarUtil.showSnackBars(
                                context, Strings.pleaseSelectCurrencyType);
                          } else {
                            Navigator.pop(context);
                            if (type == 0) {
                              calculatorViewModel.addInputField(CurrencyField(
                                  calculatorViewModel.selectedCurrencyTypeTemp,
                                  '',
                                  calculatorViewModel.selectedArithmaticType));
                            }
                          }
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                        child: const Text(
                          Strings.submit,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
