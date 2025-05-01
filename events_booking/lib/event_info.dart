import 'package:events_booking/events_booked.dart';
import 'package:flutter/material.dart';
class EventInfo extends StatelessWidget {
  const EventInfo({super.key, required this.eventData});

  final Map<String, dynamic> eventData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text(eventData["title"],style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            centerTitle: true,
            backgroundColor: Colors.red.shade200,
            ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: eventData["image"],
              child: Image.asset(eventData["image"]),
              ),
            SizedBox(height: 10,),
            Text("Date: ${eventData['date']}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),),
            Text("Price: PKR ${eventData['price']}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),),
            
            Text("Venue: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            Text("${eventData['venue']}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),

            Text("Time: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            Text("${eventData['time']}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),

            Text("Website: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            Text("${eventData['website']}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            
            SizedBox(height: 35,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent[400],
                fixedSize: Size(300, 25)
              ),
              onPressed: (){
                bookedEvents.add(eventData);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("${eventData["title"]} added to booked events!"),
                  duration: Duration(seconds: 3),
                  )
                  );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_box_outlined, size: 35, color: Colors.black,),
                  Text("   Book Event", 
                    style: TextStyle(fontSize: 25, color: Colors.black),)
                ],
              ),)
          ],
        ),
      ),
    );
  }
}