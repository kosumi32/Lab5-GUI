import 'package:flutter/material.dart';
import 'package:food_reviewer/main.dart';
import 'package:food_reviewer/pages/engineerInvite.dart';
import 'package:food_reviewer/pages/engineerList.dart';
import 'package:food_reviewer/pages/factory1.dart';

// Import main
import '../main.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: settingTab(),
      routes: {
        "/profile": (context) => Engineerlist(),
        "/home": (context) => FirstPage(),
        "/setting": (context) => Setting()
      },
    );
  }
}

class settingTab extends StatefulWidget {
  const settingTab({super.key});

  @override
  State<settingTab> createState() => _settingTabState();
}

class _settingTabState extends State<settingTab> {
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
            icon: Icon(Icons.settings),
            tooltip: "Setting",
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("FoodHunter's Setting")));
            },
          )
        ],
      ),
      body: Column(
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
            padding: EdgeInsets.all(10),
            width: 380,
            height: 490,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Minimum Threshold",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    Icon(Icons.info_outline_rounded),
                    Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepPurple[50],
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1.0, 1.0),
                                blurRadius: 1.5,
                                spreadRadius: 1)
                          ]),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 8, 0),
                          child: Icon(Icons.edit)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 28,
                ),
                Expanded(
                    child: thresholdLayout(
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
          SizedBox(height: 35,),
          SingleChildScrollView(
            // Scroll Horizontally
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Factory1()));
                    },
                    child: factorySlider(factoryNo: "Factory 1")),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FirstPage()));
                    },
                    child: factorySlider(factoryNo: "Factory 2")),
                GestureDetector(
                    onTap: () {
                      // logger.d("This is Factory 3");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EngineerInvite()));
                    },
                    child: factorySlider(factoryNo: "Factory 3")),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
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

class threshold extends StatelessWidget {
  final String title;
  final double value;
  final String valueType;

  const threshold(
      {super.key,
      required this.title,
      required this.value,
      required this.valueType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 180,
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Text(
            "$title",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      "$value",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                ),
                Container(
                    height: 15, child: VerticalDivider(color: Colors.black), width: 20,),
                Center(
                  child: Text(
                    "$valueType",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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

class thresholdLayout extends StatelessWidget {
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

  const thresholdLayout({
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          mainAxisExtent: 150),
      children: [
        threshold(title: title1, value: value1, valueType: valueType1),
        threshold(title: title2, value: value2, valueType: valueType2),
        threshold(title: title3, value: value3, valueType: valueType3),
        threshold(title: title4, value: value4, valueType: valueType4)
      ],
    );
  }
}

