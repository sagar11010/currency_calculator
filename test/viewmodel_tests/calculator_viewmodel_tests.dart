import 'dart:convert';
import 'dart:io';

import 'package:structure_app/di/injector_provider.dart';
import 'package:structure_app/model/currency_field.dart';
import 'package:structure_app/network/http_client.dart';
import 'package:structure_app/network/model/currency_list_payment_response_model.dart';
import 'package:structure_app/view_model/calculator/calculator_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../core/test_constants.dart';

void main() {
  setUpAll(() {
    setupInjection();
  });

  group('Calculation viewModel logic test', () {
    group('checkSubmit', () {
      test('When no field added or no input given submit return false', () {
        CalculatorViewModel calcViewModel = CalculatorViewModel();
        expect(calcViewModel.onValidate(), false);
      });

      test(
          'When field added and mock data added but no default output currency selected then return false',
          () {
        CalculatorViewModel calcViewModel = CalculatorViewModel();
        calcViewModel.addInputField(CurrencyField('INR', '20', ''));
        calcViewModel.addInputField(CurrencyField('INR', '20', '/'));

        expect(calcViewModel.onValidate(), false);
      });

      test(
          'When field added and default currency selected then should return true',
          () {
        CalculatorViewModel calcViewModel = CalculatorViewModel();
        calcViewModel.addInputField(CurrencyField('INR', '20', ''));
        calcViewModel.addInputField(CurrencyField('INR', '20', '/'));
        calcViewModel.setDefaultCurrencyType('INR');
        expect(calcViewModel.onValidate(), true);
      });

      test(
          'When field added and default currency selected then should return true',
          () {
        CalculatorViewModel calcViewModel = CalculatorViewModel();
        calcViewModel.addInputField(CurrencyField('INR', '20', ''));
        calcViewModel.addInputField(CurrencyField('INR', '20', '/'));
        calcViewModel.setDefaultCurrencyType('INR');
        calcViewModel.setCurrencyListPaymentResponseModel(
            CurrencyListPaymentResponseModel.fromJson(jsonDecode(
                '{"success":true,"timestamp":1672643222,"base":"EUR","date":"2023-01-02","rates":{"AED":3.926468,"AFN":95.156961,"ALL":114.174346,"AMD":419.894664,"ANG":1.922153,"AOA":538.479444,"ARS":188.943445,"AUD":1.570541,"AWG":1.924321,"AZN":1.823858,"BAM":1.953851,"BBD":2.153419,"BDT":110.013061,"BGN":1.953592,"BHD":0.403037,"BIF":2210.860692,"BMD":1.069067,"BND":1.429553,"BOB":7.369735,"BRL":5.651727,"BSD":1.06652,"BTC":6.4281113e-05,"BTN":88.067491,"BWP":13.60382,"BYN":2.692073,"BYR":20953.714741,"BZD":2.149822,"CAD":1.447143,"CDF":2170.206331,"CHF":0.988031,"CLF":0.032865,"CLP":906.83613,"CNY":7.375064,"COP":5182.837197,"CRC":631.139236,"CUC":1.069067,"CUP":28.330278,"CVE":110.153419,"CZK":24.156103,"DJF":189.867672,"DKK":7.436435,"DOP":60.006635,"DZD":146.824543,"EGP":26.448289,"ERN":16.036006,"ETB":57.168412,"EUR":1,"FJD":2.370019,"FKP":0.883647,"GBP":0.885134,"GEL":2.880695,"GGP":0.883647,"GHS":10.87868,"GIP":0.883647,"GMD":66.229093,"GNF":9194.276615,"GTQ":8.369622,"GYD":223.133974,"HKD":8.342946,"HNL":26.321031,"HRK":7.528582,"HTG":157.869235,"HUF":399.638348,"IDR":16638.478931,"ILS":3.755259,"IMP":0.883647,"INR":88.333794,"IQD":1556.643184,"IRR":44740.456964,"ISK":151.497707,"JEP":0.883647,"JMD":161.815791,"JOD":0.75893,"JPY":139.976691,"KES":131.558904,"KGS":91.598013,"KHR":4391.567698,"KMF":492.011393,"KPW":962.160371,"KRW":1360.500089,"KWD":0.32707,"KYD":0.8888,"KZT":493.600003,"LAK":18431.829308,"LBP":1612.766333,"LKR":391.951669,"LRD":165.172499,"LSL":18.184482,"LTL":3.156677,"LVL":0.646668,"LYD":5.149983,"MAD":11.14571,"MDL":20.4348,"MGA":4762.605675,"MKD":61.581422,"MMK":2239.722952,"MNT":3686.341661,"MOP":8.561328,"MRO":381.656763,"MUR":47.028273,"MVR":16.462774,"MWK":1095.449354,"MXN":20.842083,"MYR":4.709278,"MZN":68.238257,"NAD":18.18513,"NGN":479.027508,"NIO":38.945015,"NOK":10.506765,"NPR":140.928019,"NZD":1.6878,"OMR":0.411014,"PAB":1.06652,"PEN":4.039508,"PGK":3.75852,"PHP":59.57694,"PKR":241.783383,"PLN":4.694105,"PYG":7853.644578,"QAR":3.892206,"RON":4.93385,"RSD":117.153872,"RUB":78.843339,"RWF":1150.416089,"SAR":4.020112,"SBD":8.850045,"SCR":13.850824,"SDG":610.969399,"SEK":11.155929,"SGD":1.433726,"SHP":1.47253,"SLE":20.157322,"SLL":20125.18751,"SOS":608.833733,"SRD":34.005893,"STD":22127.530089,"SVC":9.332547,"SYP":2686.064398,"SZL":18.059107,"THB":37.011431,"TJS":10.873286,"TMT":3.741735,"TND":3.323197,"TOP":2.503539,"TRY":20.023521,"TTD":7.247858,"TWD":32.826879,"TZS":2495.202709,"UAH":39.196695,"UGX":3967.481103,"USD":1.069067,"UYU":42.623824,"UZS":11995.109443,"VEF":1843179.939769,"VES":18.276554,"VND":25267.400403,"VUV":125.333837,"WST":2.882336,"XAF":655.385078,"XAG":0.044619,"XAU":0.000586,"XCD":2.889207,"XDR":0.801488,"XOF":655.293215,"XPF":119.68216,"YER":267.621847,"ZAR":18.162596,"ZMK":9622.882489,"ZMW":19.314935,"ZWL":344.239163}}')));
        // verify(currencyExchangeRepo.getCurrencyTypeList());
        expect(calcViewModel.onValidate(), true);
      });

      test('Check currency input initial value', () {
        CalculatorViewModel calcViewModel = CalculatorViewModel();
        expect(calcViewModel.inputFields.length, 0);
      });
      test('Check currency input value after add', () {
        CalculatorViewModel calcViewModel = CalculatorViewModel();

        calcViewModel.addInputField(CurrencyField('INR', '20', ''));
        calcViewModel.addInputField(CurrencyField('INR', '20', '/'));

        expect(calcViewModel.inputFields.length, 2);
      });

      test('Delete Field', () {
        CalculatorViewModel calcViewModel = CalculatorViewModel();

        calcViewModel.addInputField(CurrencyField('INR', '20', ''));
        calcViewModel.addInputField(CurrencyField('INR', '20', '/'));

        calcViewModel.removeInputField(calcViewModel.inputFields[1]);

        expect(calcViewModel.inputFields.length, 1);
      });

      test('Calculate Operation', () async {
        CalculatorViewModel calcViewModel = CalculatorViewModel();
        calcViewModel.addInputField(CurrencyField('INR', '20', ''));
        calcViewModel.addInputField(CurrencyField('INR', '20', '*'));
        calcViewModel.addInputField(CurrencyField('INR', '20', '+'));

        final response = await HttpClient().get(
          wsLatest,
          headers: {},
          queryParameters: {},
        );
        calcViewModel.setCurrencyListPaymentResponseModel(
            CurrencyListPaymentResponseModel.fromJson(response));

        calcViewModel.setDefaultCurrencyType('INR');
        calcViewModel.calculateData();
        expect(calcViewModel.outputStr, (20 * 20 + 20).toStringAsFixed(2));
      });

      test('Reset Data', () {
        CalculatorViewModel calcViewModel = CalculatorViewModel();

        calcViewModel.clearFieldList();
        expect(calcViewModel.outputStr, '');
        expect(calcViewModel.inputFields.length, 0);
        expect(calcViewModel.selectedDefaultCurrencyType, '');
      });
    });

    test('Check internet connection', () async {
      var connected = false;
      try {
        CalculatorViewModel calcViewModel = CalculatorViewModel();

        final result = await NetworkInterface.list();
        for (var interface in result) {
          if (interface.addresses.isNotEmpty && interface.name != 'lo') {
            connected = true;
            break;
          }
        }
      } catch (e) {
        print('Error checking internet connection: $e');
      }
      expect(connected, true);
    });
  });
  tearDownAll(() {
    print('Congrats all test cases passed');
  });
}
