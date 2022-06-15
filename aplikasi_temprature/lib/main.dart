import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color warna = Colors.orange;
  String named = "Celcius";
  double suhu = 0;
  bool fahrenClick = true;
  TextEditingController dataSuhu = new TextEditingController();
  celciusChangeTo(String request) {
    if (request == "Fahrenheit") {
      var hitung = (9 * suhu) / 5;
      var hasil = hitung + 32;
      warna = Colors.blue;
      return suhu = hasil;
    }
    if (request == "Reamur") {
      var hitung = (4 * suhu);
      var hasil = hitung / 5;
      warna = Colors.red;
      return suhu = hasil;
    }
    if (request == "Kelvin") {
      var hasil = suhu + 273;
      warna = Colors.green;
      return suhu = hasil;
    }
  }

  fahrenheitChangeTo(String request) {
    if (request == "Celcius") {
      var hitung = (suhu - 32) * 5;
      var hasil = hitung / 9;
      warna = Colors.orange;
      return suhu = hasil;
    }
    if (request == "Reamur") {
      var hitung = (suhu - 32) / 2.25;
      warna = Colors.red;

      return suhu = hitung;
    }
    if (request == "Kelvin") {
      var hitung = (suhu + 459.67) / 1.8;
      warna = Colors.green;
      return suhu = hitung;
    }
  }

  reamurChangeTo(String request) {
    if (request == "Celcius") {
      var hitung = (5 * suhu) / 4;
      warna = Colors.orange;

      return suhu = hitung;
    }
    if (request == "Fahrenheit") {
      var hitung = (9 * suhu) / 4;
      var hasil = hitung + 32;
      warna = Colors.blue;

      return suhu = hasil;
    }
    if (request == "Kelvin") {
      var hitung = (5 * suhu) / 4;
      var hasil = hitung + 273;
      warna = Colors.green;
      return suhu = hasil;
    }
  }

  kelvinChangeTo(String request) {
    if (request == "Celcius") {
      var hitung = suhu - 273;
      warna = Colors.orange;

      return suhu = hitung;
    }
    if (request == "Reamur") {
      var hitung = (suhu - 273) * 4;
      var hasil = hitung / 5;
      warna = Colors.red;

      return suhu = hasil;
    }
    if (request == "Fahrenheit") {
      var hitung = (suhu - 273) * 1.8;
      var hasil = hitung + 32;
      warna = Colors.blue;

      return suhu = hasil;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          color: warna,
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(named,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.normal,
                      color: Colors.white)),
              Text(
                "\u00B0" + suhu.toString(),
                style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3,
              margin: EdgeInsets.only(top: 35.0),
              child: TextField(
                controller: dataSuhu,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Tentukan Suhu",
                    fillColor: Colors.white70),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 35,
              ),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    suhu = double.parse(dataSuhu.text);
                    named = "Celcius";
                    warna = Colors.orange;
                    dataSuhu.text = "";
                  });
                },
                child: const Text(
                  "OK",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(80, 80),
                  shape: const CircleBorder(),
                  primary: Colors.purple[400],
                  onPrimary: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 35.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: const Text(
                  "\u00B0" + "F",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  if (named == "Fahrenheit") {
                    return;
                  }
                  if (named == "Celcius") {
                    setState(() {
                      celciusChangeTo("Fahrenheit");
                      named = "Fahrenheit";
                    });
                  }
                  if (named == "Reamur") {
                    setState(() {
                      reamurChangeTo("Fahrenheit");
                      named = "Fahrenheit";
                    });
                  }
                  if (named == "Kelvin") {
                    setState(() {
                      kelvinChangeTo("Fahrenheit");
                      named = "Fahrenheit";
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(80, 80),
                  shape: const CircleBorder(),
                ),
              ),
              ElevatedButton(
                child: const Text(
                  "\u00B0" + "C",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  if (named == "Celcius") {
                    return;
                  }
                  if (named == "Fahrenheit") {
                    setState(() {
                      fahrenheitChangeTo("Celcius");
                      named = "Celcius";
                    });
                  }
                  if (named == "Reamur") {
                    setState(() {
                      reamurChangeTo("Celcius");
                      named = "Celcius";
                    });
                  }
                  if (named == "Kelvin") {
                    setState(() {
                      kelvinChangeTo("Celcius");
                      named = "Celcius";
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(80, 80),
                  shape: const CircleBorder(),
                  primary: Colors.orange[400],
                  onPrimary: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 35.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: const Text(
                  "\u00B0" + "R",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  if (named == "Reamur") {
                    return;
                  }
                  if (named == "Celcius") {
                    setState(() {
                      celciusChangeTo("Reamur");
                      named = "Reamur";
                    });
                  }
                  if (named == "Fahrenheit") {
                    setState(() {
                      fahrenheitChangeTo("Reamur");
                      named = "Reamur";
                    });
                  }
                  if (named == "Kelvin") {
                    setState(() {
                      kelvinChangeTo("Reamur");
                      named = "Reamur";
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(80, 80),
                  shape: const CircleBorder(),
                  primary: Colors.red[400],
                  onPrimary: Colors.white,
                ),
              ),
              ElevatedButton(
                child: const Text(
                  "\u00B0" + "K",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  if (named == "Kelvin") {
                    return;
                  }
                  if (named == "Celcius") {
                    setState(() {
                      celciusChangeTo("Kelvin");
                      named = "Kelvin";
                    });
                  }
                  if (named == "Fahrenheit") {
                    setState(() {
                      fahrenheitChangeTo("Kelvin");
                      named = "Kelvin";
                    });
                  }
                  if (named == "Reamur") {
                    setState(() {
                      reamurChangeTo("Kelvin");
                      named = "Kelvin";
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(80, 80),
                  shape: const CircleBorder(),
                  primary: Colors.green[400],
                  onPrimary: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
