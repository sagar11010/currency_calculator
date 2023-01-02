import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:structure_app/network/custom_exception.dart';
import 'package:structure_app/network/http_client.dart';
import 'package:structure_app/network/model/currency_list_payment_response_model.dart';
import 'package:structure_app/network/model/currency_list_response_model.dart';
import 'package:structure_app/shared/contstants/imports.dart';

///[CurrencyExchangeRepository] class provide abstraction layer for implimentation
abstract class CurrencyExchangeRepository {
  Future<Either<CustomException, CurrencyListResponseModel>>
      getCurrencyTypeList();

  Future<Either<CustomException, CurrencyListPaymentResponseModel>>
      getCurrencyDataList();
}

class CurrencyExchangeRepositoryImpl extends CurrencyExchangeRepository {
  final HttpClient _httpClient = HttpClient();

  @override
  Future<Either<CustomException, CurrencyListResponseModel>>
      getCurrencyTypeList() async {
    ConnectivityResult connectionStatus =
        await Connectivity().checkConnectivity();
    if (connectionStatus != ConnectivityResult.none) {
      try {
        final response = await _httpClient
            .get(ApiConstants.wsSymbols, queryParameters: {}, headers: {});
        PreferenceUtils.setString(
            StorageConstants.symbols, jsonEncode(response));
        return Right(CurrencyListResponseModel.fromJson(response));
      } catch (e) {
        return Left(CustomException('Server Exception'));
      }
    } else {
      try {
        final response =
            jsonDecode(PreferenceUtils.getString(StorageConstants.symbols));
        return Right(CurrencyListResponseModel.fromJson(response));
      } catch (e) {
        return Left(CustomException('Server Exception'));
      }
    }
  }

  @override
  Future<Either<CustomException, CurrencyListPaymentResponseModel>>
      getCurrencyDataList() async {
    ConnectivityResult connectionStatus =
        await Connectivity().checkConnectivity();
    if (connectionStatus != ConnectivityResult.none) {
      try {
        final response = await _httpClient
            .get(ApiConstants.wsLatest, queryParameters: {}, headers: {});

        PreferenceUtils.setString(
            StorageConstants.latest, jsonEncode(response));
        return Right(CurrencyListPaymentResponseModel.fromJson(response));
      } catch (e) {
        return Left(CustomException(e.toString()));
      }
    } else {
      try {
        final response =
            jsonDecode(PreferenceUtils.getString(StorageConstants.latest));

        return Right(CurrencyListPaymentResponseModel.fromJson(response));
      } catch (e) {
        return Left(CustomException('Server Exception'));
      }
    }
  }
}
