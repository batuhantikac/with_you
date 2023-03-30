import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:with_you/event_model.dart';

class EventsDetails extends StatefulWidget {
  final Event selectEvent;

  const EventsDetails({super.key, required this.selectEvent});

  @override
  State<EventsDetails> createState() => _EventsDetailsState();
}

class _EventsDetailsState extends State<EventsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                size: 30,
              ))
        ],
      ),
      body: _buildDetay(),
      bottomNavigationBar: _buildDonate(),
    );
  }

  _buildDetay() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            "assets/images/mountain.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 40, top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.selectEvent.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Color.fromARGB(255, 49, 168, 215),
                      fontSize: 27,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Color.fromARGB(255, 49, 168, 215),
                      ),
                      // Etkinlik Adresi *****************************
                      Text(
                        widget.selectEvent.address,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 49, 168, 215),
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Organizator",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.selectEvent.organizer,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Overview",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 49, 168, 215),
                      fontSize: 22,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add_circle,
                      size: 50,
                      color: Color.fromARGB(255, 49, 168, 215),
                    ),
                  ),
                  const SizedBox(
                    height: 125,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          color: Color.fromARGB(255, 49, 168, 215),
          thickness: 3,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 12),
          child: Column(
            children: [
              Text(widget.selectEvent.description,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  )),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.date_range,
                    color: Color.fromARGB(255, 49, 168, 215),
                  ),
                  Text(
                    "${widget.selectEvent.date}    ${widget.selectEvent.time}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.message,
                    color: Color.fromARGB(255, 49, 168, 215),
                  ),
                  Text(
                    widget.selectEvent.contact,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

BottomAppBar _buildDonate() {
  return BottomAppBar(
    elevation: 30,
    height: 60,
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 25),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        TextButton(
          onPressed: () {},
          child: const Icon(
            Icons.arrow_drop_down,
            size: 50,
            color: Colors.red,
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 30,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "5 £",
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Icon(
            Icons.arrow_drop_up,
            size: 50,
            color: Colors.green,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              "Donate",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 49, 168, 215),
                  fontSize: 23,
                  fontStyle: FontStyle.italic),
            )),
      ]),
    ),
  );
}
