
import 'package:flutter/material.dart';

List<Map<String, dynamic>> bookedEvents = [];

class Booked extends StatefulWidget {
  const Booked({super.key});

  @override
  State<Booked> createState() => _BookedState();
}

class _BookedState extends State<Booked> {

  int _getTotal() {
    dynamic total = 0;
    for (var event in bookedEvents) {
      total += event["price"] ?? 0;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Booked Events",style: TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: true,
          backgroundColor: Colors.red.shade200,
          ),
          body: bookedEvents.isEmpty ?
            Center(
              child: Text("No Events Booked Yet!"),
            ) :
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: bookedEvents.length,
                    itemBuilder: (context,index) {
                    final event = bookedEvents[index];
                    return ListTile(
                      title: Text(event["title"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      subtitle: Text(event["date"]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(event["price"] == 0 ? "Free" : 'PKR ${event["price"]}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  
                          IconButton(
                            onPressed: () {
                              setState(() {
                                bookedEvents.removeAt(index);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("${event["title"]} removed"),
                                duration: Duration(seconds: 2),
                              )
                              );
                            },
                            icon: Icon(Icons.delete_forever_rounded, color: Colors.red, size: 35,),
                            
                          ),
                          ],
                          
                      ),
                    );
                    }
                    ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.red.shade50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Cost:", 
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text( _getTotal() == 0 ? "Free" : "PKR ${_getTotal()}",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
              ],
            ),
          ),
              ],

            )

          ),
    );
  }
}