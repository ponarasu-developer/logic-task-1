import 'package:flutter/material.dart';
import './result_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  List multiples = [];
  void findMultiples(int inputValue) {
    int middlevalue = inputValue ~/ 2;

    for (var i = 1; i <= middlevalue; i++) {
      if (inputValue % i == 0) {
        multiples.add(i);
      }
    }
    multiples.add(inputValue);
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController multipleFinderController =
      TextEditingController();

  final _validatorKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "multiples finder",
        ),
        centerTitle: true,
      ),
      body: Form(
          key: _validatorKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Enter the number to calculate multiples"),
              Container(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  validator: (value) {
                    if (value == "" || value!.isEmpty
                        // &&    RegExp(r'^[A-Za-z]+$').hasMatch(value)
                        ) {
                      return "enter the value";
                    } else if (int.parse(value) > 10000000) {
                      return 'enter below 10000000';
                    } else {
                      return null;
                    }
                  },
                  controller: multipleFinderController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  )),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (_validatorKey.currentState!.validate()) {
                      widget.multiples.clear();
                      widget.findMultiples(
                          int.parse(multipleFinderController.text));
                      multipleFinderController.clear();
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ResultScreen(
                            multiples: widget.multiples,
                          );
                        },
                      ));
                    }
                  },
                  child: const Text("Calculate"))
            ],
          )),
    );
  }
}
