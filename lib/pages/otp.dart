import 'package:flutter/material.dart';
import 'package:food_reviewer/main.dart';


class OTP extends StatelessWidget {
  const OTP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: otpPage(),
      ),
    );
  }
}

class otpPage extends StatelessWidget {
  const otpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Image.asset("images/upmLogo.png"),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: const Text(
                "Welcome !",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.5),
              color: Colors.grey[100],
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2.5, 2.5),
                    blurRadius: 1.5,
                    spreadRadius: 1)
              ],
            ),
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            padding: EdgeInsets.all(15),
            height: 350,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Enter the activation code you \nreceived via SMS.",
                      style: TextStyle(fontSize: 17),
                    ),
                    Icon(
                      Icons.error_outline,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ObscuredTextFieldSample()],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 25, 0),
                      child: Text(
                        "0/6",
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't recieve? ",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Tap here",
                          style: TextStyle(
                            color: Colors.blue[200],
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                          ))
                    ])),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      key: const Key("activateOTP"),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Factory2()));
                      },
                      child: Container(
                        width: 170,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 250, 225, 255),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1.5, .5),
                                  blurRadius: 0.5,
                                  spreadRadius: 1)
                            ]),
                        child: Center(
                          child: Text(
                            "Activate",
                            style: TextStyle(
                                color: Color.fromARGB(255, 144, 40, 162),
                                fontSize: 17.5),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text.rich(TextSpan(children: [
              TextSpan(
                text: "Disclaimer | Privacy Statement",
                style: TextStyle(
                  color: Colors.blue[500],
                  fontSize: 17,
                  decoration: TextDecoration.underline,
                ),
              )
            ])),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Copyright UPM & Kejuruteraan Minyak Sawit ",
          ),
          Text("CCS Sdn. Bhd.")
        ],
      ),
    );
  }
}

class ObscuredTextFieldSample extends StatelessWidget {
  const ObscuredTextFieldSample({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 300,
      child: TextField(
        obscureText: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'OTP',

          // Enabling color filling
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
