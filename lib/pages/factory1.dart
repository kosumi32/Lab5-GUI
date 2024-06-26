import 'package:flutter/material.dart';
import 'package:food_reviewer/main.dart';
import 'package:food_reviewer/pages/engineer_list.dart';
import 'package:food_reviewer/pages/setting.dart';


class Factory1 extends StatelessWidget {
  const Factory1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const FactoryClass1(),
      routes: {
        "/profile": (context) => const Engineerlist(),
        "/home": (context) => const FactoryClass1(),
        "/setting": (context) => const Setting()
      },
    );
  }
}

class FactoryClass1 extends StatefulWidget {
  const FactoryClass1({super.key});

  @override
  State<FactoryClass1> createState() => _FactoryClass1State();
}

class _FactoryClass1State extends State<FactoryClass1> {
  int currentIndex = 1;

  void _onIteamTapped(int index) {
    setState(() {
      currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, "/profile");
        break;
      case 1:
        Navigator.pushNamed(context, "/home");
        break;
      case 2:
        Navigator.pushNamed(context, "/setting");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Factory 1"),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontSize: 28, fontWeight: FontWeight.w900, color: Colors.black),

        // A list of widget display after title
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: "Setting",
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("FoodHunter's Setting")));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          // color: Colors.grey[500],
          child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[300],
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(2.5, 2.5),
                              blurRadius: 5,
                              spreadRadius: 2),
                        ]),
                    padding: const EdgeInsets.all(10),
                    width: 380,
                    height: 490,
                    child: const Column(
                      children: [
                        Text(
                          "ABD1234 IS UNREACHABLE !",
                          style:
                              TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                        ),
                        Expanded(
                          child: GaugeLayout(
                              value1: 0.0,
                              value2: 0.0,
                              value3: 0.0,
                              value4: 0.0,
                              title1: "Steam Pressure",
                              title2: "Steam Flow",
                              title3: "Water Level",
                              title4: "Power Frequency",
                              valueType1: "bar",
                              valueType2: "T/H",
                              valueType3: "%",
                              valueType4: "Hz"),
                        ),
                        Text("--:--",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 15))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    // Scroll Horizontally
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Factory1()));
                            },
                            child: const FactorySlider(factoryNo: "Factory 1")),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const FirstPage()));
                            },
                            child: const FactorySlider(factoryNo: "Factory 2")),
                        GestureDetector(
                            onTap: () {
                              logger.d("This is Factory 3");
                            },
                            child: const FactorySlider(factoryNo: "Factory 3")),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Setting", icon: Icon(Icons.settings)),
        ],

        // index into [items] for the current active [BottomNavigationBarItem]
        currentIndex: currentIndex,

        // Return us which index we clicked on
        selectedItemColor: Colors.purple,
        onTap: _onIteamTapped,
      ),
    );
  }
}
