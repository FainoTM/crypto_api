import 'package:coin_api/viewModel/number_format.dart';

class CryptoModel {
  String cryptoName;
  double price;
  String symbol;
  String image;
  int marketCap;
  int volume;
  double high;
  double low;

  CryptoModel({required this.cryptoName, required this.price, required this.symbol, required this.image, required this.marketCap, required this.volume, required this.high, required this.low});

  factory CryptoModel.fromJson(Map<String, dynamic> json) {
    return CryptoModel(
        cryptoName: json['name'],
        price: json['current_price'].toDouble(),
        symbol: json['symbol'],
        image: json['image'],
        marketCap: json['market_cap'],
        volume: json['total_volume'],
        high: json['high_24h'].toDouble(),
        low: json['low_24h'].toDouble()
    );
  }
}