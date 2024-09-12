import 'package:get/get.dart';
import 'package:test1/getx/coin_repository.dart';
import 'package:test1/getx/controller.dart';
import 'package:test1/main.dart';

class AppPage {
  static final appPageRout = [
    GetPage(
      name: "/home",
      page: () => const MyHomePage(title: "title"),
      binding: BindingsBuilder(
        () {
          Get.put(Controller(repository: CoinRepositoryImpl()));
        },
      ),
    )
  ];
}
