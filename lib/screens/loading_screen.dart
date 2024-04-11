import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';


class loadingscreen extends StatefulWidget {
  @override
  State<loadingscreen> createState() => _loadingscreenState();
}

class _loadingscreenState extends State<loadingscreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
  }
 void getData()async{
     Response response = await get('https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}' as Uri);
     if(response.statusCode ==200)
       {
         print(response.body);
       }
     else
       {
         print(response.statusCode);
       }
 }
  @override
  Widget build(BuildContext context)
  {
    getData();
    return Scaffold(
        // body: Center(
        //   child: Padding(
        //     padding: const EdgeInsets.all(15.0),
        //     child: TextButton(
        //       style: TextButton.styleFrom(
        //         backgroundColor: Colors.blue[100],
        //       ),
        //       onPressed: () {
        //         getLocation();
        //       },
        //       child: Text(
        //         'Get Location',
        //         style: TextStyle(
        //             color: Colors.black,
        //             fontSize: 30,
        //             fontStyle: FontStyle.italic),
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
