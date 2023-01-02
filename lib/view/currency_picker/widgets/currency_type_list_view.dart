import 'package:structure_app/shared/contstants/imports.dart';
import 'package:structure_app/view_model/calculator/calculator_view_model.dart';
import 'package:structure_app/view_model/currency_picker/currency_picker_view_model.dart';
///[CurrencyTypeListView] show listView for selection item
class CurrencyTypeListView extends StatelessWidget {
  final int type;
  final int? selectedIndex;

  const CurrencyTypeListView(this.type, {Key? key, this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CurrencyPickerViewModel currencyPickerViewModel =
        context.read<CurrencyPickerViewModel>();
    CalculatorViewModel calculatorViewModel =
        context.read<CalculatorViewModel>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: type == 1 ? 10 : 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextField(
              style: const TextStyle(color: Colors.black),
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                  isDense: true,
                  alignLabelWithHint: true,
                  labelText: Strings.search,
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: Strings.typeCurrencyNameOrSearchCode,
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.search),
                  prefixStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1))),
              onChanged: (s) {
                currencyPickerViewModel.setFilter(s);
              },
            ),
          ),
          Expanded(child: Observer(builder: (_) {
            var maps = currencyPickerViewModel.currencyTypeData;
            if (currencyPickerViewModel.filter != '') {
              maps = Map.fromEntries(currencyPickerViewModel
                  .currencyTypeData.entries
                  .where((element) =>
                      element.key.toLowerCase().contains(
                          currencyPickerViewModel.filter.toLowerCase()) ||
                      element.value.toLowerCase().contains(
                          currencyPickerViewModel.filter.toLowerCase())));
            }
            return ListView.builder(
              itemBuilder: (ctx, i) {
                void handleClick() {
                  if (type == 0 && selectedIndex == null) {
                    calculatorViewModel
                        .setCurrencyTypeTemp(maps.keys.elementAt(i));
                  } else if (selectedIndex != null) {
                    calculatorViewModel.changeInputFieldData(
                        selectedIndex!, maps.keys.elementAt(i));
                    Navigator.pop(context);
                  } else {
                    calculatorViewModel
                        .setDefaultCurrencyType(maps.keys.elementAt(i));
                    Navigator.pop(context);
                  }
                }

                return Observer(
                  builder: (_) => GestureDetector(
                    onTap: () {
                      handleClick();
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Radio(
                              value: maps.keys.elementAt(i),
                              groupValue: type == 0
                                  ? selectedIndex == null
                                      ? calculatorViewModel
                                          .selectedCurrencyTypeTemp
                                      : calculatorViewModel
                                          .inputFields[selectedIndex!]
                                          .currencyType
                                  : calculatorViewModel
                                      .selectedDefaultCurrencyType,
                              onChanged: (a) {
                                handleClick();
                              }),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 5.0),
                              child: Text(
                                '${maps.keys.elementAt(i)} (${maps.values.elementAt(i)})',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: maps.length,
            );
          })),
        ],
      ),
    );
  }
}
