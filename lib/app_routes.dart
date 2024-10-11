import 'package:coin_api/view/coin_list.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const coinlist = '/view/coin_list';

  static List<GetPage> define () {
    return [
      GetPage(name: coinlist, page: () => CryptoListPage()),
    ];
  }
}