import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
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

  ResultScreen({super.key, required this.multiples});
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  late int temp;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: widget.multiples.length,
          itemBuilder: (context, index) {
            return Center(
              child: TextButton(
                onPressed: () {
                  temp = widget.multiples[index];
                  setState(() {
                    widget.multiples.clear();
                    widget.findMultiples(temp);
                  });
                },
                child: Text(widget.multiples[index].toString()),
              ),
            );
          },
        ),
      )),
    );
  }
}
