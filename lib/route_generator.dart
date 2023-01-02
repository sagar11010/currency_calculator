import 'package:flutter/material.dart';
import 'package:structure_app/view/calculator/view/calculator_screen.dart';
import 'package:structure_app/view/currency_picker/view/currency_picker_screen.dart';
import 'package:structure_app/shared/contstants/routes.dart';
import 'package:structure_app/shared/contstants/strings.dart';

///[RouteGenerator] contain all pages route
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => const CalculatorScreen());
      case Routes.currencyPicker:
        return MaterialPageRoute(builder: (_) => const CurrencyPickerScreen());
      default:
        return _unknownRoute();
    }
  }

  static Route<dynamic> _unknownRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text(Strings.underDevelopment),
        ),
      );
    });
  }
}
