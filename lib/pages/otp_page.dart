import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskapp/pages/home_page.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _boxOne = TextEditingController();
  final _boxTwo = TextEditingController();
  final _boxThree = TextEditingController();
  final _boxFour = TextEditingController();
  final _boxFive = TextEditingController();
  final _boxSix = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late FocusNode _focusNode1;
  late FocusNode _focusNode2;
  late FocusNode _focusNode3;
  late FocusNode _focusNode4;
  late FocusNode _focusNode5;
  late FocusNode _focusNode6;

  @override
  void initState() {
    super.initState();
    _focusNode1 = FocusNode();
    _focusNode2 = FocusNode();
    _focusNode3 = FocusNode();
    _focusNode4 = FocusNode();
    _focusNode5 = FocusNode();
    _focusNode6 = FocusNode();
  }

  @override
  void dispose() {
    _boxOne.dispose();
    _boxTwo.dispose();
    _boxThree.dispose();
    _boxFour.dispose();
    _boxFive.dispose();
    _boxSix.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    _focusNode5.dispose();
    _focusNode6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back_ios)),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            //Text
            const SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Enter 6 Digits verfication \ncode sent to your number",
                    style: TextStyle(fontSize: 28),
                  ),
                ],
              ),
            ),
            // textformfield
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 68,
                  width: 54,
                  child: TextFormField(
                    focusNode: _focusNode1,
                    onChanged: (value) {
                      if (value.length == 1) {
                        _focusNode2.requestFocus();
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Error";
                      }
                      return null;
                    },
                    controller: _boxOne,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 54,
                  child: TextFormField(
                    focusNode: _focusNode2,
                    onChanged: (value) {
                      if (value.length == 1) {
                        _focusNode3.requestFocus();
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Error";
                      }
                      return null;
                    },
                    controller: _boxTwo,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 54,
                  child: TextFormField(
                    focusNode: _focusNode3,
                    onChanged: (value) {
                      if (value.length == 1) {
                        _focusNode4.requestFocus();
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Error";
                      }
                      return null;
                    },
                    controller: _boxThree,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 54,
                  child: TextFormField(
                    focusNode: _focusNode4,
                    onChanged: (value) {
                      if (value.length == 1) {
                        _focusNode5.requestFocus();
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Error";
                      }
                      return null;
                    },
                    controller: _boxFour,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 54,
                  child: TextFormField(
                    focusNode: _focusNode5,
                    onChanged: (value) {
                      if (value.length == 1) {
                        _focusNode6.requestFocus();
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Error";
                      }
                      return null;
                    },
                    controller: _boxFive,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 54,
                  child: TextFormField(
                    focusNode: _focusNode6,
                    onChanged: (value) {
                      if (value.length == 1) {
                        _focusNode6.unfocus();
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Error";
                      }
                      return null;
                    },
                    controller: _boxSix,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 70),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(5),
                    ),
                  ),

                  child: Text(
                    "Confirm",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("OTP Verification SuccessFul")),
                      );

                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => HomePage(),
                        ),
                      );
                    } else {
                      _focusNode1.requestFocus();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
