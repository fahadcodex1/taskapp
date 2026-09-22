import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskapp/pages/otp_page.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _userNameController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _pinCodeController = TextEditingController();
  final _cityController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _userNameController.dispose();
    _mobileNumberController.dispose();
    _pinCodeController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextFormField(
                controller: _userNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Username",
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter your name";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextFormField(
                controller: _mobileNumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Mobile Number",
                  prefixIcon: Icon(Icons.smartphone_outlined),
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Mobile Number";
                  }
                  if (value.length != 10) {
                    return "Please Enter Full Mobile Number";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextFormField(
                controller: _pinCodeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Pin Code",
                  prefixIcon: Icon(Icons.location_on_outlined),
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6),
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Pin Code";
                  }

                  if (value.length != 6) {
                    return "Please Enter Full Pin Code";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextFormField(
                controller: _cityController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "City",
                  prefixIcon: Icon(Icons.location_city_outlined),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter City";
                  }

                  if (value.length <= 3) {
                    return "City must be more than 3 characters";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(5),
                    ),
                  ),

                  child: Text("Submit"),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("Data Saved")));

                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => const OtpPage(),
                        ),
                      );
                      _userNameController.clear();
                      _mobileNumberController.clear();
                      _pinCodeController.clear();
                      _cityController.clear();
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
