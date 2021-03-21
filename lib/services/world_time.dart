import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class world_time {
  String location;  //for UI
  String time;  //for UI
  String flag;  //for UI
  String urlendpoint;
  var isDayTime;
  world_time({this.location, this.flag, this.urlendpoint});

  Future<void> getData() async {
    try{
      var url = Uri.parse('https://worldtimeapi.org/api/timezone/$urlendpoint');
      Response response = await get(url);

      Map data = json.decode(response.body);
      print(data);
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      //datetime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now);
     isDayTime = now.hour>6&&now.hour<20?true:false;

    }
    catch(e){
      print("error is:: $e");
      time = 'could not get time';
    }
    // print(time);
  }
}