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
       appBar: AppBar(
         leading: IconButton( onPressed: () { 
           Navigator.pop(context);
         }, icon: Icon(Icons.arrow_back,size: 25,),),

       ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              Icon(Icons.location_city, size: 25, color: Colors.lightBlueAccent,)
            ],
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, cityName);
            },
            child: Text(
              'Get Weather',
              style: kButtonTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
