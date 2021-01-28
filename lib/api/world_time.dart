import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime {
  String location, time, url;
  bool isDayTime;

  WorldTime({this.location, this.url});

  Future<void> getCurrentTime() async {
    try {
      Response response =
          await get('https://worldtimeapi.org/api/timezone/$url');

      Map data = jsonDecode(response.body);

      String dateTime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime currentTime = DateTime.parse(dateTime);
      currentTime = currentTime.add(Duration(hours: int.parse(offset)));

      isDayTime = currentTime.hour > 6 && currentTime.hour < 19 ? true : false;
      time = DateFormat.jm().format(currentTime);
    } catch (e) {
      print('caught error: $e');
      time = 'could not fetch time data';
    }
  }
}
