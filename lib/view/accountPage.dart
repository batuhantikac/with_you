import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../event_model.dart';
import 'eventsDetails.dart';

class AccountPage extends StatefulWidget {
  AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List _listEvents = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "With You",
            style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
          ),
          backgroundColor: Color.fromARGB(255, 49, 168, 215),
          bottom: const TabBar(
            indicatorColor: Color.fromARGB(255, 0, 5, 80),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 5,
            tabs: <Widget>[
              Tab(
                child: Text("Profile"),
              ),
              Tab(
                child: Text("Created"),
              ),
              Tab(
                child: Text("Attended"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // profile
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
              child: Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                        foregroundImage: AssetImage(
                          "assets/images/person.jpg",
                        ),
                        radius: 70),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "Semih Küçükpehlivan",
                      style: TextStyle(fontSize: 25),
                    ),
                    const Text(
                      "kpsemih16@gmail.com",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: _buildContainerDecorationProfile(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildTextButton("Edit Profile Information",
                                      Icons.perm_identity_outlined),
                                  _buildTextButton("Notifications",
                                      Icons.notifications_active_outlined),
                                  _buildTextButton("Language", Icons.language),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: _buildContainerDecorationProfile(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildTextButton("Contact Us",
                                      Icons.support_agent_rounded),
                                  _buildTextButton(
                                      "Privacy Policy", Icons.security_rounded),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Kayıt Edilen etkinlikler gözükecek
            Center(
              child: ListView.builder(
                itemCount: _listEvents.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 8, left: 5, right: 5, bottom: 6),
                    child: Card(
                      elevation: 6,
                      shape: Border.all(width: 0.15),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EventsDetails(
                                  selectEvent: Event(
                                name: _listEvents[index]['eventName'],
                                description: _listEvents[index]
                                    ["eventDescription"],
                                address: _listEvents[index]["eventAdress"],
                                contact: _listEvents[index]["eventContact"],
                                date: _listEvents[index]["eventDate"],
                                organizer: _listEvents[index]["eventOrganizer"],
                                time: _listEvents[index]["eventTime"],
                                type: _listEvents[index]["eventType"],
                              )),
                            ),
                          );
                        },
                        leading: const Icon(
                          Icons.circle,
                          color: Colors.green,
                          size: 36,
                        ),
                        title: _buildText(
                            _listEvents.elementAt(index)["eventName"],
                            FontStyle.normal,
                            18),
                        subtitle: _buildText(
                            _listEvents.elementAt(index)["eventAdress"],
                            FontStyle.italic,
                            14),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Center(
              child: Text("Not attended Activity"),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildContainerDecorationProfile() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(color: Colors.grey.shade400, offset: const Offset(5.0, 6))
      ],
    );
  }

  _buildTextButton(String text, IconData icon) {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(
          iconSize: const MaterialStatePropertyAll(30),
          iconColor: MaterialStatePropertyAll(Colors.grey.shade800)),
      icon: Icon(icon),
      label: Text(
        text,
        style: const TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
      ),
    );
  }

  void listEvent() async {
    Database db = await openDatabase("with_you");
    _listEvents = await db.rawQuery("select * from Events");
    db.close();

    setState(() {});
  }
}

Widget _buildText(String text, FontStyle fontstyle, double fontSize) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      fontStyle: fontstyle,
    ),
  );
}
