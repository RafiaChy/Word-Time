import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/api/world_time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  var locationController = new TextEditingController();

  List<WorldTime> locations = [
    WorldTime(
      url: 'Europe/London',
      location: 'London',
    ),
    WorldTime(
      url: 'Europe/Berlin',
      location: 'Athens',
    ),
    WorldTime(
      url: 'Africa/Cairo',
      location: 'Cairo',
    ),
    WorldTime(
      url: 'Africa/Nairobi',
      location: 'Nairobi',
    ),
    WorldTime(
      url: 'America/Chicago',
      location: 'Chicago',
    ),
    WorldTime(
      url: 'America/New_York',
      location: 'New York',
    ),
    WorldTime(
      url: 'Asia/Seoul',
      location: 'Seoul',
    ),
    WorldTime(
      url: 'Asia/Jakarta',
      location: 'Jakarta',
    ),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getCurrentTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Input Location',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                ),
              ),
            );
          }),
    );
  }
}
// body: Padding(
//   padding: EdgeInsets.fromLTRB(20, 80, 20, 0),
//   child: Column(
//     children: [
//       AutoCompleteTextField(
//         controller: locationController,
//         suggestions: cities,
//         clearOnSubmit: false,
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 16.0,
//           fontWeight: FontWeight.bold,
//         ),
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20.0),
//           ),
//         ),
//         itemFilter: (item, query) {
//           return item.toLowerCase().startsWith(query.toLowerCase());
//         },
//         itemSorter: (a, b) {
//           return a.compareTo(b);
//         },
//         itemSubmitted: (item) {
//           locationController.text = item;
//         },
//         itemBuilder: (context, item) {
//           return Container(
//             padding: EdgeInsets.all(10.0),
//             child: Row(
//               children: [
//                 Text(
//                   item,
//                   style: TextStyle(
//                     color: Colors.black,
//                   ),
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//       SizedBox(
//         height: 350.0,
//       ),
//       RaisedButton.icon(
//         onPressed: () async {
//           // Navigator.pushNamed(context, '/location');
//         },
//         icon: Icon(
//           Icons.access_time,
//           color: Colors.lightBlue[900],
//         ),
//         label: Text(
//           'Fetch Time',
//           style: TextStyle(
//             color: Colors.lightBlue[900],
//             fontSize: 20.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     ],
//   ),
// ),
