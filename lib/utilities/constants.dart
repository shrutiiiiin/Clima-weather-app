import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 18.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 18.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 18.0,
  fontFamily: 'Spartan MB',
  color: Colors.blueAccent,
);

const kConditionTextStyle = TextStyle(
  fontSize: 18.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.lightBlueAccent,
  icon: Icon(
    Icons.location_city,
    color: Colors.lightBlueAccent,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.white,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);