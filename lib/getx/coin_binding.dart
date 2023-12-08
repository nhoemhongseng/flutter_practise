import 'package:get/instance_manager.dart';
import 'package:test1/getx/coin_repository.dart';
import 'package:test1/getx/controller.dart';

class CoinBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CoinRepository>(CoinRepositoryImpl());
    Get.lazyPut(() => Controller(repository: Get.find<CoinRepository>()));
  }
}
