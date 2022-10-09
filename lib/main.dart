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
  double _result = 0;
  var listSuhu = ["Kelvin", "Reamor", "Fahrenheit"];
  var selectedSuhu = "Kelvin";
  String? selectedValue;

  konverterSuhu() {
    setState(() {
      if (etInputUser.text.isNotEmpty) {
        if (selectedSuhu == "Kelvin") {
          _result = printKelvin(double.parse(etInputUser.text));
        }

        if (selectedSuhu == "Reamor") {
          _result = printReamor(double.parse(etInputUser.text));
        }

        if (selectedSuhu == "Fahrenheit") {
          _result = printFahrenheit(double.parse(etInputUser.text));
        }
      }
    });
  }

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
              DropdownButton(
                  value: selectedSuhu,
                  items: listSuhu.map((String listSuhu) {
                    return DropdownMenuItem(
                      value: listSuhu,
                      child: Text(listSuhu),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedSuhu = newValue!;
                    });
                  }),
              const Text(
                'Hasil',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                '$_result',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        konverterSuhu();
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
