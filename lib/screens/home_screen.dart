import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:candlesticks/src/widgets/mobile_chart.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  final candleData = Candle(
      date: DateTime.now(),
      high: 1999.01,
      low: 1928.81,
      open: 1928.81,
      close: 1900.95,
      volume: 1000);

  List<Candle> listOfCandles = List.empty(growable: true);

  @override
  void initState() {
   // makeCandleList();
    readJsonAndAppendCandes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(DateTime.now().toString());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Chart Stocker")),
      body: Padding(
        padding: const EdgeInsets.only(top: 400),
        child: Container(
            color: Colors.transparent,
            alignment: Alignment.center,
            child: Candlesticks(
              candles: listOfCandles,
            )),
      ),
    );
  }

  void makeCandleList() {
    for (int i = 0; i < 20; i++) {
      //  await Future.delayed(Duration(seconds: 1));
      listOfCandles.add(Candle(
          date: DateTime(2023, 1, 2, 13, i),
          high: 1999.01 + (i + 1) * 4,
          low: 1928.81 + (i + 1) * 2,
          open: 1928.81 + (i + 1) * 3,
          close: 1900.95 + (i + 1) * 3,
          volume: 1000 + i * 12));
    }
  //  print(listOfCandles);
  }

  Future<void> readJsonAndAppendCandes() async {
    try {
      String jsonString = await rootBundle.loadString('assets/pricedata.json');
      dynamic jsonData = json.decode(jsonString);
      for (int i = 0; i < jsonData.length; i++) {
        print(jsonData[i]['date']);
        print(jsonData[i]['high']);
        print(jsonData[i]['low']);
        print(jsonData[i]['open']);
        print(jsonData[i]['close']);
        print(jsonData[i]['volume']);
      listOfCandles.add(Candle(
      date:DateTime(2023, 1, 2, 13, i),
      high: jsonData[i]['high'].toDouble(),
      low: jsonData[i]['low'].toDouble(),
      open: jsonData[i]['open'].toDouble(),
      close: jsonData[i]['close'].toDouble(),
      volume: jsonData[i]['volume'].toDouble()));
      }
    } catch (error) {
      print(error);
    }
  }
}
