import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:food_reviewer/pages/otp.dart';

class accActivate extends StatelessWidget {
  const accActivate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: const activation(),
      ),
    );
  }
}

class activation extends StatelessWidget {
  const activation({super.key});

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
                color: Colors.orange[100],
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2.5, 2.5),
                      blurRadius: 1.5,
                      spreadRadius: 1)
                ]),
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
                      "Enter your mobile number to \nactivate your account.",
                      style: TextStyle(fontSize: 17),
                    ),
                    Icon(
                      Icons.error_outline,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
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
                          SizedBox(width: 10,),
                          Text("+60", style: TextStyle(fontSize: 17),),
                        ],
                      ),
                    ),
                    TextFieldSample()
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    checkBox(),
                    Text(
                      "I agree to the terms & conditions",
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      key: const Key("getActivationalCode"),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => OTP()));
                      },
                      child: Container(
                        width: 220,
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
                            "Get Activation Code",
                            style: TextStyle(
                                color: Color.fromRGBO(144, 40, 162, 1),
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
          const SizedBox(
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
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Copyright UPM & Kejuruteraan Minyak Sawit ",
          ),
          const Text("CCS Sdn. Bhd.")
        ],
      ),
    );
  }
}

class checkBox extends StatefulWidget {
  const checkBox({super.key});

  @override
  State<checkBox> createState() => checkBoxState();
}

class checkBoxState extends State<checkBox> {
  bool? isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          tristate: true,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value;
            });
          },
        ),
      ],
    );
  }
}

class TextFieldSample extends StatelessWidget {
  const TextFieldSample({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 220,
      child: TextField(
        obscureText: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Mobile Number',

          // Enabling color filling
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
