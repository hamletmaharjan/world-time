import 'package:http/http.dart';
import 'dart:convert';


class WorldTime {
  String location;
  String time;
  String flag;
  String url;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async{
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
    
    time = now.toString();
  }

  
}


