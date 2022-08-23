import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practiceapp/Screens/changeCity.dart';
import 'dart:convert' as convert;
import 'package:practiceapp/main.dart';
import 'package:practiceapp/constants.dart';

class WeatherScreen extends StatefulWidget {
  static const String routeName = " WeatherName";

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  var newCity = null;
  @override
  Widget build(BuildContext context) {
    Future<Map> getData(String city) async {
      var url =
          "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiId";
      var data = await http.get(Uri.parse(url));
      print(convert.jsonDecode(data.body));
      return convert.jsonDecode(data.body);
    }

    Future<void> updateCity() async {
      String result = await Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return UpdateCity();
      }));
      if (result != '') {
        setState(() {
          print("new City is$newCity:");
          newCity = result;
          print("new City is$newCity:");
        });
      }
    }

    Widget updateData() {
      return FutureBuilder(
        future: getData(newCity == null ? defaultCity : newCity),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            Map data = snapshot.data!;
            var temp = double.parse((data["main"]["temp"]).toString()) - 273;
            final tmp = temp.toStringAsFixed(2);
            final min = (temp - 4).toStringAsFixed(2);
            final max = (temp + 3).toStringAsFixed(2);
            print(data);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Text(
                    "Temp:  ${tmp}",
                    style: Zlable,
                  ),
                ),
                ListTile(
                  title: Text(" min: $min  \n"
                      " max: $max \n"
                      " humadity ${data["main"]["humidity"]}"),
                ),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          " Weather App",
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  updateCity();
                });
              },
              icon: Icon(Icons.menu)),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/weather.jpg",
            height: 1200,
            fit: BoxFit.cover,
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(right: 5, top: 5),
            child: Text(newCity == null ? defaultCity : newCity),
          ),
          Container(
            child: updateData(),
          ),
        ],
      ),
    );
  }
}
