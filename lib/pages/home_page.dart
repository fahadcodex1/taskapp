import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> skillNames = ["Flutter", "Dart", "Firebase", "Git", "REST API"];

  Set<String> selectedSkills = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ...skillNames.map((skill) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(skill),
                    Checkbox(
                      value: selectedSkills.contains(skill),
                      onChanged: (value) {
                        setState(() {
                          if (value == true) {
                            selectedSkills.add(skill);
                          } else {
                            selectedSkills.remove(skill);
                          }
                        });
                      },
                    ),
                  ],
                ),
              );
            }),
            ElevatedButton(
              onPressed: () {
                debugPrint("Selected Skills:${selectedSkills.join("\n")}");
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
