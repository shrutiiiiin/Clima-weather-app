import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}
class _CityScreenState extends State<CityScreen> {
  late String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 25.0, color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration:kTextFieldInputDecoration,
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  child: Text(
                    'Get Weather',
                    style: kButtonTextStyle.copyWith(
                      decoration: TextDecoration.underline
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Image(
                  image: AssetImage('images/man with a map.png'),
                  height: 300, // Set the height to 200 pixels
                  width: 350, // Set the width to 200 pixels
                ),
              ],
            ),
          ),
      ),
    );
  }
}