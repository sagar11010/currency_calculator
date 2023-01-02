
import 'dart:convert';

CurrencyListResponseModel currencyListResponseModelFromJson(String str) => CurrencyListResponseModel.fromJson(json.decode(str));

String currencyListResponseModelToJson(CurrencyListResponseModel data) => json.encode(data.toJson());

class CurrencyListResponseModel {
  CurrencyListResponseModel({
    required this.success,
    required this.symbols,
  });

  bool success;
  Map<String, String> symbols;

  factory CurrencyListResponseModel.fromJson(Map<String, dynamic> json) => CurrencyListResponseModel(
    success: json["success"],
    symbols: Map.from(json["symbols"]).map((k, v) => MapEntry<String, String>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "symbols": Map.from(symbols).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}
