import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 Map data = {};

 @override
 void initState() {
   super.initState();
 }

 @override
  Widget build(BuildContext context) {
   data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data['time']);
    Color bgColor = data['isDayTime']? Colors.blue : Colors.grey;
    Color fontColor = false? Colors.black : Colors.white;

   return Scaffold(

      backgroundColor: bgColor,
      body: SafeArea(
          child:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(data['time'],
                  style: TextStyle(
                      fontSize: 48.0,
                      color: fontColor
                  ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data['flag']),
                    SizedBox(width: 22),
                    Text(data['location'],
                      style: TextStyle(
                          fontSize: 22.0,
                          color: fontColor),
                    ),
                  ]
                ),
                FlatButton.icon(onPressed:() async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time' : result['time'],
                        'location' : result['location'],
                        'isDayTime' : result['isDayTime'],
                        'flag' : result['flag']
                      };
                    });
                    },
                  icon: Icon(Icons.location_on),
                  label: Text('Choose Location'),
                  color: fontColor,
                )
              ],
            ),
          )
      ),
    );
  }
}
