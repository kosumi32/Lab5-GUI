import 'package:flutter/material.dart';
import 'package:food_reviewer/main.dart';
import 'package:food_reviewer/pages/engineer_invite.dart';
import 'package:food_reviewer/pages/engineer_list.dart';
import 'package:food_reviewer/pages/factory1.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SettingTab(),
      routes: {
        "/profile": (context) => const Engineerlist(),
        "/home": (context) => const FirstPage(),
        "/setting": (context) => const Setting()
      },
    );
  }
}

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
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
        title: const Text("Factory 2"),
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
        child: Column(
          children: [
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
              width: 375,
              height: 490,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          "Minimum Threshold",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28),
                              overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Icon(Icons.info_outline_rounded),
                      Container(
                        width: 55,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.deepPurple[50],
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 1.5,
                                  spreadRadius: 1)
                            ]),
                        child: const Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 8, 0),
                            child: Icon(Icons.edit)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const Expanded(
                      child: ThresholdLayout(
                          value1: 29,
                          value2: 22,
                          value3: 53,
                          value4: 48,
                          title1: "Steam \nPressure",
                          title2: "Steam\nFlow",
                          title3: "Water\nLevel",
                          title4: "Power\nFrequency",
                          valueType1: "bar",
                          valueType2: "T/H",
                          valueType3: "%",
                          valueType4: "Hz"))
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            SingleChildScrollView(
              // Scroll Horizontally
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                      key: const Key("factory1"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FactoryClass1()));
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
                        // logger.d("This is Factory 3");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EngineerInvite()));
                      },
                      child: const FactorySlider(factoryNo: "Factory 3")),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Setting", icon: Icon(Icons.settings)),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.purple,
        onTap: _onIteamTapped,
      ),
    );
  }
}

class Threshold extends StatelessWidget {
  final String title;
  final double value;
  final String valueType;

  const Threshold(
      {super.key,
      required this.title,
      required this.value,
      required this.valueType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      height: 180,
      margin: const EdgeInsets.all(5),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
                border: Border.all(color: Colors.black)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      "$value",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                ),
                const SizedBox(
                    height: 15,
                    width: 20,
                    child: VerticalDivider(color: Colors.black)),
                Center(
                  child: Text(
                    valueType,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ThresholdLayout extends StatelessWidget {
  final double value1;
  final double value2;
  final double value3;
  final double value4;

  final String title1;
  final String title2;
  final String title3;
  final String title4;

  final String valueType1;
  final String valueType2;
  final String valueType3;
  final String valueType4;

  const ThresholdLayout({
    super.key,
    required this.value1,
    required this.value2,
    required this.value3,
    required this.value4,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
    required this.valueType1,
    required this.valueType2,
    required this.valueType3,
    required this.valueType4,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 18,
          crossAxisSpacing: 18,
          mainAxisExtent: 150),
      children: [
        Threshold(title: title1, value: value1, valueType: valueType1),
        Threshold(title: title2, value: value2, valueType: valueType2),
        Threshold(title: title3, value: value3, valueType: valueType3),
        Threshold(title: title4, value: value4, valueType: valueType4)
      ],
    );
  }
}
