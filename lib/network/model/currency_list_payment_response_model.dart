import 'dart:convert';

CurrencyListPaymentResponseModel currencyListPaymentResponseModelFromJson(
        String str) =>
    CurrencyListPaymentResponseModel.fromJson(json.decode(str));

String currencyListPaymentResponseModelToJson(
        CurrencyListPaymentResponseModel data) =>
    json.encode(data.toJson());

class CurrencyListPaymentResponseModel {
  CurrencyListPaymentResponseModel({
    required this.base,
    required this.date,
    required this.rates,
    required this.success,
    required this.timestamp,
  });

  String base;
  DateTime date;
  Map<String, double> rates;
  bool success;
  int timestamp;

  factory CurrencyListPaymentResponseModel.fromJson(
          Map<String, dynamic> json) =>
      CurrencyListPaymentResponseModel(
        base: json["base"],
        date: DateTime.parse(json["date"]),
        rates: Map.from(json["rates"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        success: json["success"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "base": base,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "success": success,
        "timestamp": timestamp,
      };
}
