import 'package:coin_api/app_routes.dart';
import 'package:coin_api/viewModel/crypto_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


Future<void> main() async{
  final CryptoController cryptoController = Get.put(CryptoController());
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppRoutes.coinlist,
    getPages: AppRoutes.define(),
  ));
}
