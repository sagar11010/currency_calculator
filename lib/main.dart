import 'package:flutter/material.dart';
import 'package:structure_app/di/injector_provider.dart';
import 'package:structure_app/route_generator.dart';
import 'package:structure_app/shared/contstants/imports.dart';
import 'package:structure_app/view_model/calculator/calculator_view_model.dart';
import 'package:structure_app/view_model/currency_picker/currency_picker_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();
  setupInjection();
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (BuildContext context) => CalculatorViewModel(),
        ),
        Provider(
          create: (BuildContext context) => CurrencyPickerViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.initial,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
