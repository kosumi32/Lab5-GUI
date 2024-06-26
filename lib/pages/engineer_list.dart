import 'package:flutter/material.dart';
import 'package:food_reviewer/pages/acc_activation.dart';
import 'package:food_reviewer/pages/engineer_invite.dart';
import 'package:food_reviewer/pages/factory1.dart';
import 'package:food_reviewer/pages/setting.dart';

// Import main
import '../main.dart';

class Engineerlist extends StatelessWidget {
  const Engineerlist({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const EngineeringListClass(),
      routes: {
        "/profile": (context) => const Engineerlist(),
        "/home": (context) => const FirstPage(),
        "/setting": (context) => const Setting()
      },
    );
  }
}

class EngineeringListClass extends StatefulWidget {
  const EngineeringListClass({super.key});

  @override
  State<EngineeringListClass> createState() => _EngineeringListClassState();
}

class _EngineeringListClassState extends State<EngineeringListClass> {
  int currentIndex = 0;

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
        child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: Colors.grey[100],
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(2.5, 2.5),
                          blurRadius: 1.5,
                          spreadRadius: 1)
                    ],
                  ),
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(15),
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const NameList(name: "Ben", phone: 60123456789),
                          const NameList(name: "Yao", phone: 60234455678),
                          const NameList(name: "Egg", phone: 60190000009),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                key: const Key("AddButton"),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const EngineerInvite()));
                                },
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(0, 40, 20, 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.purple[100],
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(-1, -1),
                                            blurRadius: 2,
                                            spreadRadius: 2)
                                      ]),
                                  height: 55,
                                  width: 55,
                                  child: const Center(
                                      child: Text(
                                    "+",
                                    style: TextStyle(
                                        fontSize: 35, color: Colors.purple),
                                  )),
                                ),
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
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
                            // logger.d("This is Factory 3");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AccActivate()));
                          },
                          child: const FactorySlider(factoryNo: "Factory 3")),
                    ],
                  ),
                )
              ],
            )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Setting", icon: Icon(Icons.settings)),
        ],

        // index into [items] for the current active [BottomNavigationBarItem]
        currentIndex: currentIndex,
        selectedItemColor: Colors.purple,
        onTap: _onIteamTapped,
      ),
    );
  }
}

class NameList extends StatelessWidget {
  final String name;
  final int phone;

  const NameList({super.key, required this.name, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[300],
          boxShadow: const [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0.5, 0.5),
                blurRadius: 3,
                spreadRadius: 2),
          ]),
      margin: const EdgeInsets.all(10),
      alignment: Alignment.bottomLeft,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 55),
            child: Text(
              name,
              style: const TextStyle(fontSize: 22.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
            child: Row(
              children: [
                const Icon(Icons.phone),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "+$phone",
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
