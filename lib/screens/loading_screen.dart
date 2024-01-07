import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
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
