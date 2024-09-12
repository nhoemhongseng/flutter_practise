import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test1/getx/coin_model.dart';
import 'package:test1/getx/coin_repository.dart';

class Controller extends GetxController {
  
  final CoinRepository repository;

  Rx<bool> loading = false.obs;
  Rx<String> errorMsg = "".obs;

  RxList<CoinModel> listData = RxList.empty(growable: true);

  Controller({required this.repository});

  void getCoinList() async {
    try {
      loading(true);
      final res = await repository.getCoins();
      listData.value = res;
      loading(false);
    } on DioException catch (e) {
      errorMsg(e.message ?? "Opp! Something went wrong");
    }
  }
}
