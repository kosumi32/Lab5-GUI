import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:food_reviewer/pages/engineerList.dart';

class EngineerInvite extends StatelessWidget {
  const EngineerInvite({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: engineerInvitation(),
      ),
    );
  }
}

class engineerInvitation extends StatelessWidget {
  engineerInvitation({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Invitation",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
              )
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Invite users",
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 10, 10, 25),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Owner's Name",
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 10,
                ),
                textFieldName(
                  description: "Type here",
                ),
                SizedBox(height: 35,),
                Text(
                  "Owner's Phone Number",
                  style: TextStyle(fontSize: 22),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  child: Row(
                children: [
                  CountryFlag.fromCountryCode(
                            "MY",
                            height: 20,
                            width: 45,
                            borderRadius: 8,
                          ),
                  const Text("+60", style: TextStyle(fontSize: 17),),
                ],
              )),
              Container(
                height: 60,
                width: 270,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Center(
                  child: Text(
                    "Enter your phone numb...",
                    style: TextStyle(color: Colors.grey[600], fontSize: 18),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: GestureDetector(
              key: const Key("submitInvitation"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => engineeringList()));
              },
              child: Container(
                width: 290,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 250, 225, 255),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1.5, .5),
                          blurRadius: 0.5,
                          spreadRadius: 1)
                    ]),
                child: const Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        color: Color.fromARGB(255, 144, 40, 162), fontSize: 17.5),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class textFieldName extends StatelessWidget {
  final String description;

  const textFieldName({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370,
      child: TextField(
        obscureText: false,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: description,

          // Enabling color filling
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
