import 'package:structure_app/view/currency_picker/widgets/currency_type_bottomsheet.dart';
import 'package:structure_app/model/currency_field.dart';
import 'package:structure_app/shared/contstants/imports.dart';
import 'package:structure_app/view_model/calculator/calculator_view_model.dart';

///[InputFieldWidget] contain field which use in app
class InputFieldWidget extends StatelessWidget {
  final CurrencyField field;
  final CalculatorViewModel viewModel;
  final int index;

  const InputFieldWidget(this.field, this.viewModel,
      {Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (field.arithmeticOperation != '')
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: CircleAvatar(
                child: Text(field.arithmeticOperation),
              ),
            ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.25),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    CurrencyTypeBottomSheet.openBottomSheet(0,
                        context: context, selectedPos: index);
                  },
                  child: Row(
                    children: [
                      Text(field.currencyType!),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),

                Expanded(
                  child: TextFormField(
                    key: UniqueKey(),
                    decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: Strings.pleaseEnterValue),
                    keyboardType: TextInputType.number,
                    initialValue: field.text.toString(),
                    onChanged: (value) => field.text = value,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                // Render the remove button
                CircleAvatar(
                  backgroundColor: Colors.red,
                  child: IconButton(
                    iconSize: 15,
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      if (index == 0 && viewModel.inputFields.length > 1) {
                        viewModel.inputFields[1].arithmeticOperation = '';
                      }
                      viewModel.removeInputField(field);
                    },
                  ),
                  radius: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
