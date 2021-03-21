import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading_screen extends StatefulWidget {
  @override
  _loading_screenState createState() => _loading_screenState();
}

class _loading_screenState extends State<loading_screen> {

  void setData() async {
    world_time obj = world_time(flag:'parisFlag.png' ,location:'Paris' ,urlendpoint:'Europe/Berlin');
    await obj.getData();

     Navigator.pushReplacementNamed(context, '/home',arguments: {
       "flag":obj.flag,
       "location":obj.location,
       "time":obj.time,
       "isDayTime":obj.isDayTime
     }
     );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.black12,
          size: 50.0,
        ),
      ),
    );
  }
}
