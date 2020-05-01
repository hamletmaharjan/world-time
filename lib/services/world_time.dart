import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDaytime = false;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async{
    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      

      //crete datetime object
      String datetime = data['datetime'];
      String hour = data['utc_offset'].substring(1,3);
      String minutes = data['utc_offset'].substring(4,6);

      //print(minutes);
      //print(datetime);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(hour),minutes: int.parse(minutes)));
      isDaytime = (now.hour > 0 && now.hour < 18) ? true : false; 
      time = DateFormat.jm().format(now);
    }
    catch(e) {
      print('caught error: $e');
      time = 'Error Loading Time';
    }
    
  }

  
}


