import 'package:flutter/material.dart';
import 'WeatherScreen.dart';

class LoginScreen extends StatelessWidget {
  static String routName = "LoginScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/images/Login.png"),
          TextFormField(
            decoration: InputDecoration(
                hintText: " Enter username", label: Text(" Username")),
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: " Enter Password",
              label: Text("Password"),
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, WeatherScreen.routeName);
            },
            child: Text(
              "Login",
              style: TextStyle(
                  color: Colors.lightGreen, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
