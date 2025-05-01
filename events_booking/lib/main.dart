import 'package:events_booking/event_info.dart';
import 'package:events_booking/events_booked.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(MaterialApp(
    home: EventPage(),
  ));
}

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events List",style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.red.shade200,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) => Booked()));
            }, 
            icon: Icon(Icons.event_available_outlined, size: 40,)),
            Tooltip(message: "Events Booked")
        ],),
        backgroundColor: Colors.red.shade50,
        body: _getEventList(),
    );
  }
  
  _getEventList() {
    List<Map<String,dynamic>> list = [{"title":"Food Festival", 
                                      "price":500,
                                      "date":"15th May 2025",
                                      "venue":"Beach View Park, Clifton",
                                      "website":"www.foodfestkarachi.com",
                                      "time":"9:00 AM - 5:00 PM",
                                      "image":"assets/fest.png"},

                                      {"title":"Art Exhibition", 
                                      "price":1500,
                                      "date":"5th June 2025",
                                      "venue":"Arts Council of Pakistan, Karachi",
                                      "website":"www.artscouncilkarachi.com",
                                      "time":"9:00 AM - 11:00 PM",
                                      "image":"assets/art.png"},

                                      {"title":"Book Fair", 
                                      "price":0,
                                      "date":"21th July 2025",
                                      "venue":"Karachi Expo Centre",
                                      "website":"www.karachibookfair.com",
                                      "time":"10:00 AM - 6:00 PM",
                                      "image":"assets/book.png"},

                                      {"title": "Craft Fair",
                                      "price": 100,
                                      "date": "18th October 2025",
                                      "venue": "Zamzama Park",
                                      "website": "www.karachicrafts.pk",
                                      "time": "11:00 AM - 8:00 PM",
                                      "image": "assets/craft.png"
                                      },

                                      {"title": "Independence Day",
                                      "price": 0,
                                      "date": "14th August 2025",
                                      "venue": "Mazar-e-Quaid Grounds",
                                      "website": "www.pakistanevents.gov.pk",
                                      "time": "8:00 AM - 1:00 PM",
                                      "image": "assets/day.png"
                                      },

                                      {
                                      "title": "Automobile Show",
                                      "price": 300,
                                      "date": "12th October 2025",
                                      "venue": "Karachi Expo Centre",
                                      "website": "www.karachiautoshow.pk",
                                      "time": "11:00 AM - 7:00 PM",
                                      "image": "assets/autoshow.png"
                                      },

                                      {
                                      "title": "Karachi Marathon",
                                      "price": 0,
                                      "date": "28th February 2026",
                                      "venue": "Sea View, Clifton",
                                      "website": "www.karachimarathon.com",
                                      "time": "6:00 AM",
                                      "image": "assets/marathon.png"
                                    },

                                      ];
  
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, index) {
      final info = list[index];
      timeDilation = 2.5;
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          horizontalTitleGap: 20,
          contentPadding: EdgeInsets.all(6),
          leading: CircleAvatar(radius: 30,
            backgroundColor: Colors.orangeAccent,
            child:
            Hero(
              tag: info["image"],
              child: Image.asset(info["image"])),),

          title: Text(info["title"], textScaler: TextScaler.linear(1.5),),

          subtitle: Text(info["date"], textScaler: TextScaler.linear(1.2),),

          trailing: Text(
            info["price"] == 0 ? "Free" : 'PKR ${info["price"]}',
            textScaler: TextScaler.linear(2),),
          
          tileColor: Colors.white54,
          onTap: () {
            Navigator.push(context, 
              MaterialPageRoute(
                builder: (context) => EventInfo(eventData: info)));
          },
        ),
      );
    },
  );
}
}