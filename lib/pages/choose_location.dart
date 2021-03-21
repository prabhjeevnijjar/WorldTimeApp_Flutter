import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<world_time> locations = [
    world_time(urlendpoint: 'Europe/London', location: 'London', flag: 'uk.png'),
    world_time(urlendpoint: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    world_time(urlendpoint: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    world_time(urlendpoint: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    world_time(urlendpoint: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    world_time(urlendpoint: 'America/New_York', location: 'New York', flag: 'usa.png'),
    world_time(urlendpoint: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    world_time(urlendpoint: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updateTime(index) async {
    world_time obj = locations[index];
    await obj.getData();
    //navigate to home screen
    Navigator.pop(context,{
      "flag":obj.flag,
      "location":obj.location,
      "time":obj.time,
      "isDayTime":obj.isDayTime
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title:Text('Available Locations',style: TextStyle(letterSpacing: 1.0),),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
              )
            );

      })
    );
  }
}
