import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:with_you/event_model.dart';
import 'package:with_you/view/eventsDetails.dart';

class EventList extends StatefulWidget {
  const EventList({super.key});

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  List _listEvents = [];
  @override
  Widget build(BuildContext context) {
    listEvent();
    return Scaffold(
      appBar: AppBar(
        title: Text("Activites",style: TextStyle(fontSize: 30),),
        backgroundColor: Color.fromARGB(255, 49, 168, 215),
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: _listEvents.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(
              _listEvents.elementAt(index)["eventName"],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              _listEvents.elementAt(index)["eventAdress"],
              style: const TextStyle(
                fontSize: 17,
                fontStyle: FontStyle.italic,
              ),
            ),
            leading: const Icon(
              Icons.circle,
              color: Colors.green,
            ),
            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.check_circle_sharp,)),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EventsDetails(
                    selectEvent: Event(
                  name: _listEvents[index]['eventName'],
                  description: _listEvents[index]["eventDescription"],
                  address: _listEvents[index]["eventAdress"],
                  contact: _listEvents[index]["eventContact"],
                  date: _listEvents[index]["eventDate"],
                  organizer: _listEvents[index]["eventOrganizer"],
                  time: _listEvents[index]["eventTime"],
                  type: _listEvents[index]["eventType"],
                )),
              ));
            },
          ),
        );
      },
    );
  }

  void listEvent() async {
    Database db = await openDatabase("with_you");
    _listEvents = await db.rawQuery("select * from Events");
    db.close();
    if (mounted) {
      setState(() {});
    }
  }
}
