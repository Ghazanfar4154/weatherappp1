import 'package:flutter/material.dart';
import 'package:practiceapp/constants.dart';

class UpdateCity extends StatelessWidget {
  static const String routeName = "changeCity";
  var updatedCity = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Get Weather "),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Enter city name ",
              label: Text(
                "City",
                style: Alable,
              ),
            ),
            controller: updatedCity,
          ),
          ElevatedButton(
              onPressed: () {
                print("City is ${updatedCity.text}");
                Navigator.pop(context, updatedCity.text);
              },
              child: Text(" Enter"))
        ],
      ),
    );
  }
}
