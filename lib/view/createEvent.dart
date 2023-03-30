import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:with_you/view/listEvent.dart';

import '../main.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  var formKey = GlobalKey<FormState>();

  List listEvents = [];

  TextEditingController eventDescriptionController = TextEditingController();
  TextEditingController eventTypeController = TextEditingController();
  TextEditingController eventOrganizerController = TextEditingController();
  TextEditingController eventDateController = TextEditingController();
  TextEditingController eventContactController = TextEditingController();
  TextEditingController eventTimeController = TextEditingController();
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventAdressController = TextEditingController();

  @override
  void dispose() {
    eventNameController.dispose();
    eventAdressController.dispose();
    eventContactController.dispose();
    eventDateController.dispose();
    eventDescriptionController.dispose();
    eventOrganizerController.dispose();
    eventTimeController.dispose();
    eventTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Events"),
        backgroundColor: Color.fromARGB(255, 49, 168, 215),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (context) {
                  return MyApp();
                },
              ), (route) => false);
            },
            icon: Icon(Icons.cancel),
            color: Color.fromARGB(255, 255, 0, 0),
          ),
          IconButton(
            onPressed: EventAdd,
            icon: Icon(Icons.check_circle),
            color: Color.fromARGB(255, 0, 255, 8),
          ),
        ],
      ),
      body: _buildForm(),
    );
  }

  Widget _buildForm() {
    return Form(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            TextInputContainer(
              label: "Event Name",
              controller: eventNameController,
              hintText: "Plese Enter Event Name",
            ),
            TextInputContainer(
              label: "Activity Adress",
              controller: eventAdressController,
              hintText: "London/England",
            ),
            TextInputContainer(
              label: "Event Description",
              controller: eventDescriptionController,
              hintText: "Please Enter Description",
            ),
            TextInputContainer(
              label: "Event Type",
              controller: eventTypeController,
              hintText: "Animal, Forest,Nature...",
            ),
            TextInputContainer(
              label: "Event Date",
              controller: eventDateController,
              hintText: "22/02/2023",
            ),
            TextInputContainer(
              label: "Event Time",
              controller: eventTimeController,
              hintText: "For Example 12.00 am",
            ),
            TextInputContainer(
              label: "Event Organizer",
              controller: eventOrganizerController,
              hintText: "Name Surname",
            ),
            TextInputContainer(
              label: "Event Contact",
              controller: eventContactController,
              hintText: "forexample@gmail.com",
            ),
          ],
        ),
      ),
    );
  }

  void EventAdd() async {
    Database db = await openDatabase(
      "with_you",
      version: 1,
      onCreate: (db, version) {
        db.execute(
            "CREATE TABLE Events(eventsId INTEGER PRIMARY KEY,eventName TEXT,eventDescription TEXT,eventType TEXT,eventDate TEXT,eventTime TEXT,eventAdress TEXT,eventOrganizer TEXT,eventContact TEXT)");
        print("eventt Add çalıştı");
      },
    );
    var newEvent = {
      "eventName": eventNameController.text,
      "eventDescription": eventDescriptionController.text,
      "eventtype": eventTypeController.text,
      "eventDate": eventDateController.text,
      "eventTime": eventTimeController.text,
      "eventAdress": eventAdressController.text,
      "eventOrganizer": eventOrganizerController.text,
      "eventContact": eventContactController.text,
    };
    int eventsId = await db.insert("Events", newEvent);
    print("Kullanici Ekle Çalıştı   ${eventsId}");
    db.close();
    _saveAndChange();
    _showMyDialog();
  }

  Future<Widget> _saveAndChange() async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const EventList();
        },
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Your event has been registered.'),
                Text('You can edit and delete from your profile.'),
              ],
            ),
          ),
          //********************************** Burada kayıt edip ana sayfaya gönderiyoruz.
          actions: <Widget>[
            TextButton(
              child: const Text('Back to Home'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (context) {
                    return MyApp();
                  },
                ), (route) => false);
              },
            ),
          ],
        );
      },
    );
  }
}

class TextInputContainer extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  const TextInputContainer(
      {super.key,
      required this.label,
      required this.controller,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(fontStyle: FontStyle.italic),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              filled: true,
              fillColor: Colors.grey.shade200),
        ),
      ],
    );
  }
}
