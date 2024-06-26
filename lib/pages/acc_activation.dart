import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:food_reviewer/pages/otp.dart';

class AccActivate extends StatelessWidget {
  const AccActivate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: const Activation(),
      ),
    );
  }
}

class Activation extends StatelessWidget {
  const Activation({super.key});

  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Image.asset("images/upmLogo.png"),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Welcome !",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.5),
                color: Colors.orange[100],
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2.5, 2.5),
                      blurRadius: 1.5,
                      spreadRadius: 1)
                ]),
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            padding: const EdgeInsets.all(15),
            height: 350,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Row(
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
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          CountryFlag.fromCountryCode(
                            "MY",
                            height: 20,
                            width: 45,
                            borderRadius: 8,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "+60",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    const TextFieldSample()
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CheckBox(),
                    Text(
                      "I agree to the terms & conditions",
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      key: const Key("getActivationalCode"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OTP()));
                      },
                      child: Container(
                        width: 220,
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

class CheckBox extends StatefulWidget {
  const CheckBox({super.key});

  @override
  State<CheckBox> createState() => CheckBoxState();
}

class CheckBoxState extends State<CheckBox> {
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
    final double weight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: weight * 0.26,
      child: const TextField(
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
