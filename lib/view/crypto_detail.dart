import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/crypto_model.dart';
import 'package:coin_api/viewModel/number_format.dart';

class DetailPage extends StatefulWidget {
  final CryptoModel crypto;
  DetailPage({
    Key? key,
    required this.crypto,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.crypto.cryptoName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SlideTransition(
                position: _animation,
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.network(
                    widget.crypto.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.crypto.symbol,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Preço ${NumberFormatter().formatNumber(widget.crypto.price.toString())}',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'MarketCap ${NumberFormatter().formatNumber(widget.crypto.marketCap.toString())}',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Maior Alta do Dia ', style: TextStyle(fontSize: 24)),
                  Icon(
                    Icons.arrow_upward,
                    color: Colors.greenAccent,
                  ),
                  Text(
                    NumberFormatter().formatNumber(widget.crypto.high.toString()),
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Maior Baixa do Dia ', style: TextStyle(fontSize: 24)),
                  Icon(
                    Icons.arrow_downward,
                    color: Colors.redAccent,
                  ),
                  Text(
                    NumberFormatter().formatNumber(widget.crypto.low.toString()),
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Volume ${NumberFormatter().formatNumber(widget.crypto.volume.toString())}',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}