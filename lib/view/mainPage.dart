import 'package:flutter/material.dart';
import 'package:with_you/view/LoginPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return LoginForm();
                    },
                  ), (route) => false);
                },
                icon: Icon(Icons.settings)),
          )
        ],
        title: const Text(
          "With You",
          style: TextStyle(fontSize: 33, fontStyle: FontStyle.italic),
        ),
        backgroundColor: Color.fromARGB(255, 49, 168, 215),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 25, left: 25, top: 8, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Populer Activity",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            // üst kısım
            Container(
              height: 150,
              decoration:
                  _buildImageContainer("assets/images/mainPageForest.jpg"),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    iconSize: 40,
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Afforestation Event",
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text("England/London",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 255, 255, 255))),
                      SizedBox(
                        height: 10,
                      ),
                      Text("22/04/2023   12.00 am",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 255, 255, 255))),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    iconSize: 40,
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Categories",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                        heroTag: ValueKey("1"),
                        onPressed: () {},
                        child: const Icon(Icons.forest)),
                    FloatingActionButton(
                        heroTag: ValueKey("2"),
                        onPressed: () {},
                        child: const Icon(Icons.menu_book)),
                    FloatingActionButton(
                        heroTag: ValueKey("3"),
                        onPressed: () {},
                        child: const Icon(Icons.fastfood)),
                    FloatingActionButton(
                        heroTag: ValueKey("4"),
                        onPressed: () {},
                        child: const Icon(Icons.pets)),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                        heroTag: ValueKey("5"),
                        onPressed: () {},
                        child: const Icon(Icons.child_friendly_rounded)),
                    FloatingActionButton(
                        heroTag: ValueKey("6"),
                        onPressed: () {},
                        child: const Icon(Icons.water_drop)),
                    FloatingActionButton(
                        heroTag: ValueKey("7"),
                        onPressed: () {},
                        child: const Icon(Icons.health_and_safety_sharp)),
                    FloatingActionButton(
                        heroTag: ValueKey("8"),
                        onPressed: () {},
                        child: const Icon(Icons.more_horiz_outlined)),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Current Activity",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "More",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration:
                              _buildImageContainer("assets/images/animal.jpg"),
                        ),
                        Container(
                            height: 100,
                            width: 100,
                            decoration: _buildImageContainer(
                                "assets/images/books.jpg")),
                        Container(
                            height: 100,
                            width: 100,
                            decoration: _buildImageContainer(
                                "assets/images/ocean.jpg")),
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildImageContainer(String assetImage) {
    return BoxDecoration(
        image: DecorationImage(
          opacity: 2,
          filterQuality: FilterQuality.none,
          fit: BoxFit.cover,
          image: AssetImage(assetImage),
        ),
        color: Colors.blue.shade500,
        borderRadius: BorderRadius.circular(20));
  }
}
