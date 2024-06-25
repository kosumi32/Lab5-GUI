import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_reviewer/pages/accActivation.dart';
import 'package:food_reviewer/pages/engineerInvite.dart';
import 'package:food_reviewer/pages/factory1.dart';
import 'package:food_reviewer/pages/setting.dart';
import "package:syncfusion_flutter_gauges/gauges.dart";
import 'package:logger/logger.dart';

import '../pages/engineerList.dart';

final logger = Logger();

void main() {
  runApp(const accActivate());
}

class Factory2 extends StatelessWidget {
  const Factory2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FoodHunter",
      theme: ThemeData(primarySwatch: Colors.grey),
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        "/profile": (context) => const Engineerlist(),
        "/home": (context) => const FirstPage(),
        "/setting": (context) => const Setting()
      },
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
      body: SingleChildScrollView(
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
                  padding: EdgeInsets.all(10),
                  width: 380,
                  height: 490,
                  child: const Column(
                    children: [
                      Text(
                        "1549.7kW",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 32.5),
                      ),
                      Expanded(
                        child: gaugeLayout(
                            value1: 34.19,
                            value2: 22.82,
                            value3: 55.41,
                            value4: 50.08,
                            title1: "Steam Pressure",
                            title2: "Steam Flow",
                            title3: "Water Level",
                            title4: "Power Frequency",
                            valueType1: "bar",
                            valueType2: "T/H",
                            valueType3: "%",
                            valueType4: "Hz"),
                      ),
                      Text("2024-04-26 13:45:25",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 17.5))
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
                          key: const Key("factory1"),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Factory1()));
                          },
                          child: const factorySlider(factoryNo: "Factory 1")),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const FirstPage()));
                          },
                          child: const factorySlider(factoryNo: "Factory 2")),
                      GestureDetector(
                          onTap: () {
                            logger.d("This is Factory 3");
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Setting()));
                          },
                          child: const factorySlider(factoryNo: "Factory 3")),
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
        currentIndex: currentIndex,
        selectedItemColor: Colors.purple,
        onTap: _onIteamTapped,
      ),
    );
  }
}

class radialgauge extends StatelessWidget {
  final double value;
  final String title;
  final String valueType;

  //Constructor
  const radialgauge({
    super.key,
    required this.value,
    required this.title,
    required this.valueType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 175,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromARGB(255, 255, 255, 255)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "$title",
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          Container(
              height: 120,
              width: 100,
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: SfRadialGauge(
                axes: [
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    showLabels: false,
                    showTicks: true,
                    startAngle: 180,
                    endAngle: 360,
                    radiusFactor: 1.5,
                    canScaleToFit: true,
                    axisLineStyle: const AxisLineStyle(
                      thickness: 0.3,
                      thicknessUnit: GaugeSizeUnit.factor,
                    ),
                    pointers: <GaugePointer>[
                      RangePointer(
                        value: value,
                        color: value < 30 ? Colors.red : Colors.green,
                        width: 0.3,
                        sizeUnit: GaugeSizeUnit.factor,
                      )
                    ],
                    annotations: [
                      GaugeAnnotation(
                        widget: Text(
                          "$value $valueType",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        angle: 90,
                        positionFactor: 0.375,
                      )
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}

class gaugeLayout extends StatelessWidget {
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

  const gaugeLayout({
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
          mainAxisSpacing: 20,
          crossAxisSpacing: 12,
          mainAxisExtent: 180),
      children: [
        radialgauge(value: value1, title: title1, valueType: valueType1),
        radialgauge(value: value2, title: title2, valueType: valueType2),
        radialgauge(value: value3, title: title3, valueType: valueType3),
        radialgauge(value: value4, title: title4, valueType: valueType4),
      ],
    );
  }
}

class factorySlider extends StatelessWidget {
  final String factoryNo;

  const factorySlider({
    super.key,
    required this.factoryNo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Make space between factorySliders
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      width: 175,
      height: 150,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[300],
        boxShadow: const [
          BoxShadow(
              color: Colors.grey,
              offset: Offset(2.5, 2.5),
              blurRadius: 5,
              spreadRadius: 3),
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.factory, size: 40),
          const SizedBox(
            height: 20,
          ),
          Text(
            "$factoryNo",
            style: const TextStyle(fontSize: 22.5),
          )
        ],
      ),
    );
  }
}
