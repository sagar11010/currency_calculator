import 'package:get_it/get_it.dart';
import 'package:structure_app/network/repository/currency_exchange_repository.dart';

final GetIt getIt = GetIt.instance;

///[setupInjection] is use for inject Repo
Future<void> setupInjection() async {
  getIt.registerSingleton<CurrencyExchangeRepository>(
      CurrencyExchangeRepositoryImpl());
}
