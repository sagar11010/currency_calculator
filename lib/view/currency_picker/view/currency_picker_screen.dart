import 'package:structure_app/shared/contstants/imports.dart';
import 'package:structure_app/view/currency_picker/widgets/currency_type_list_view.dart';

///[CurrencyPickerScreen] show screen for pick currency
class CurrencyPickerScreen extends StatelessWidget {
  const CurrencyPickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(Strings.currencyPicker),
      ),
      body: CurrencyTypeListView(1),
    );
  }
}
