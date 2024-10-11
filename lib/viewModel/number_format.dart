import 'package:intl/intl.dart';

class NumberFormatter {
  String number = '';

  String formatNumber(numberNotFormat){
    NumberFormat formatador = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    );

    return number = formatador.format(double.parse(numberNotFormat));

  }

}