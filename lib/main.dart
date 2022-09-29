// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  // Controller
  TextEditingController etInputUser = TextEditingController();

  // Function
  // Celcius to Kelvin
  double printKelvin(double inputUser) {
    double kelvin = inputUser + 273;
    return kelvin.ceilToDouble();
  }

  // Celcius to Reamor
  double printReamor(double inputUser) {
    double reamor = 4 / 5 * inputUser;
    return reamor.ceilToDouble();
  }

  // Celcius to Fahrenheit
  double printFahrenheit(double inputUser) {
    double fahrenheit = (9 / 5 * inputUser) + 32;
    return fahrenheit.ceilToDouble();
  }

  // Variabel berubah
  double _kelvin = 0;
  double _reamor = 0;
  double _fahrenheit = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Konverter Suhu'),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                controller: etInputUser,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  hintText: 'Masukkan Suhu Dalam Celcius',
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Suhu dalam Kelvin'),
                          Text(
                            '$_kelvin',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Suhu dalam Reamor'),
                          Text(
                            '$_reamor',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Suhu dalam Fahrenheit'),
                    Text(
                      '$_fahrenheit',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (etInputUser.text.isNotEmpty) {
                            _kelvin =
                                printKelvin(double.parse(etInputUser.text));
                            _reamor =
                                printReamor(double.parse(etInputUser.text));
                            _fahrenheit =
                                printFahrenheit(double.parse(etInputUser.text));
                          }
                        });
                      },
                      child: const Text('Konversi Suhu'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
