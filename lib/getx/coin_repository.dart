import 'package:dio/dio.dart';
import 'package:test1/getx/coin_model.dart';
import 'package:test1/getx/getx_client.dart';
import 'package:test1/getx/getx_constant.dart';

abstract class CoinRepository {
  Future<List<CoinModel>> getCoins({String currency});
}

class CoinRepositoryImpl extends CoinRepository {
  @override
  Future<List<CoinModel>> getCoins({String currency = "usd"}) async {
    try {
      final res = await GetXClient.instance.get(
        path: GetXConstant.tickerPath,
        queryParameters: {'vs_currency': currency},
      );
      final list = res as List;
      final coinList = list.map((e) => CoinModel.fromJson(e)).toList();
      return coinList;
    } on DioException catch (e) {
      throw e.message ?? "Opp Something went wrong";
    }
  }
}
