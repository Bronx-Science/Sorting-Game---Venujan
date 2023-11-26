import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sort the Items',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Sort the Items'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> index = [];
  List<String> text = [];
  int i = 0;
  Random ran = Random();
  Map<int, List<String>> map = {
    0: ["Haloween", "Christmas", "Valentine's Day", "Memorial Day"],
    1: ["Chocolate", "Lolipop", "Candy Cane", "Sugar"],
    2: ["Sweden", "Belgium", "Italy", "Finland"],
    3: ["Bartholomew", "Ron", "Tim", "Brad"],
    4: ["Persimmon", "Blueberry", "Pineapple", "Banana"],
    5: ["Nagasaki", "Chicago", "Auburn", "London"],
    6: ["Maroon", "Indigo", "Lime", "Orange"]
  };
  void _showDialog(BuildContext context, String desc) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(desc),
          actions: <Widget>[
            FilledButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text("Leave"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _tile(BuildContext context, int num) {
    return Draggable<String>(
        data: text[num],
        onDraggableCanceled: (velocity, offset) {},
        feedback: Container(
          decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black)),
          width: 100,
          height: 100,
          child: Center(
            child: Text(
              text[num],
              style: const TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 17,
              ),
            ),
          ),
        ),
        child: Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black)),
          margin: const EdgeInsets.fromLTRB(10, 5, 0, 5),
          child: Center(
            child: Text(
              text[num],
              style: const TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
                fontSize: 15,
              ),
            ),
          ),
        ));
  }

  Widget out(BuildContext context, String t, List<dynamic> acc) {
    return Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.black)),
        child: !acc.contains(t) ? const Text("") : Text(t));
  }

  void reset() {
    index.clear();
    text.clear();
    Random random = Random();
    for (int i = 0; i < 4; i++) {
      int n = random.nextInt(6);
      if (index.contains(n)) {
        i--;
      } else {
        index.add(n);
      }
    }
    for (int i = 0; i < 4; i++) {
      List<String> temp = map[index[i]]!;
      for (int j = 0; j < 4; j++) {
        text.add(temp.elementAt(j));
      }
      text.shuffle();
    }
    setState(() {});
  }

  Color color = const Color(0xFFFFFFFF);

  void changeColor() {
    setState(() {
      color = Color.fromARGB(
        ran.nextInt(256),
        ran.nextInt(256),
        ran.nextInt(256),
        ran.nextInt(256),
      );
    });
  }

  void rand() {
    i = 1;
  }

  String n(int e) {
    switch (e) {
      case 0:
        {
          return "Holidays";
        }
      case 1:
        {
          return "Sweets";
        }
      case 2:
        {
          return "European Countries";
        }
      case 3:
        {
          return "Boy Names";
        }
      case 4:
        {
          return "Fruits";
        }
      case 5:
        {
          return "Cities";
        }
      case 6:
        {
          return "Colors";
        }
    }
    return "";
  }

  String description(int e) {
    switch (e) {
      case 0:
        {
          return "Special Celebrated Days";
        }
      case 1:
        {
          return "Foods that induce a warm feeling";
        }
      case 2:
        {
          return "Countries of the continent of Europe";
        }
      case 3:
        {
          return "Names of the male gender";
        }
      case 4:
        {
          return "Not vegetables";
        }
      case 5:
        {
          return "Big towns that are famous around the world";
        }
      case 6:
        {
          return "Pretty things";
        }
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    if (i == 0) {
      reset();
    }
    i = 1;
    int n1 = index[0];
    int n2 = index[1];
    int n3 = index[2];
    int n4 = index[3];
    List<String> list1 = map[n1]!;
    List<String> list2 = map[n2]!;
    List<String> list3 = map[n3]!;
    List<String> list4 = map[n4]!;
    List<String> acc = [];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: RichText(
              maxLines: 2,
              text: TextSpan(
                  text: widget.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black),
                  children: const <TextSpan>[
                    TextSpan(
                        text: '\nDouble Tap the categories to find more info',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                  ])),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: changeColor, child: const Text("New Color")),
              Row(
                children: [
                  Container(
                    child: _tile(context, 0),
                  ),
                  Container(
                    child: _tile(context, 1),
                  ),
                  Container(
                    child: _tile(context, 2),
                  ),
                  Container(
                    child: _tile(context, 3),
                  ),
                  Container(
                    child: _tile(context, 4),
                  ),
                  Container(
                    child: _tile(context, 5),
                  ),
                  Container(
                    child: _tile(context, 6),
                  ),
                  Container(
                    child: _tile(context, 7),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    child: _tile(context, 8),
                  ),
                  Container(
                    child: _tile(context, 9),
                  ),
                  Container(
                    child: _tile(context, 10),
                  ),
                  Container(
                    child: _tile(context, 11),
                  ),
                  Container(
                    child: _tile(context, 12),
                  ),
                  Container(
                    child: _tile(context, 13),
                  ),
                  Container(
                    child: _tile(context, 14),
                  ),
                  Container(
                    child: _tile(context, 15),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.black)),
                      child: GestureDetector(
                        child: Text(
                          n(n1),
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        onDoubleTap: () {
                          _showDialog(context, description(n1));
                        },
                      )),
                  Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.black)),
                      child: GestureDetector(
                        child: Text(
                          n(n2),
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        onDoubleTap: () {
                          _showDialog(context, description(n2));
                        },
                      )),
                  Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.black)),
                      child: GestureDetector(
                        child: Text(
                          n(n3),
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        onDoubleTap: () {
                          _showDialog(context, description(n3));
                        },
                      )),
                  Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.black)),
                      child: GestureDetector(
                        child: Text(
                          n(n4),
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        onDoubleTap: () {
                          _showDialog(context, description(n4));
                        },
                      ))
                ],
              ),
              Row(children: [
                DragTarget<String>(
                    onWillAccept: (i) => list1.contains(i),
                    onAccept: (i) {
                      acc.add(i);
                    },
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return Container(
                          color: Colors.green,
                          child: Column(
                            children: [
                              Row(children: [
                                out(context, list1[0], acc),
                                out(context, list1[1], acc),
                              ]),
                              Row(
                                children: [
                                  out(context, list1[2], acc),
                                  out(context, list1[3], acc),
                                ],
                              ),
                            ],
                          ));
                    }),
                DragTarget<String>(
                    onWillAccept: (i) => list2.contains(i),
                    onAccept: (i) {
                      acc.add(i);
                    },
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return Container(
                          color: Colors.green,
                          child: Column(
                            children: [
                              Row(children: [
                                out(context, list2[0], acc),
                                out(context, list2[1], acc),
                              ]),
                              Row(
                                children: [
                                  out(context, list2[2], acc),
                                  out(context, list2[3], acc),
                                ],
                              ),
                            ],
                          ));
                    }),
                DragTarget<String>(
                    onWillAccept: (i) => list3.contains(i),
                    onAccept: (i) {
                      acc.add(i);
                    },
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return Container(
                          color: Colors.green,
                          child: Column(
                            children: [
                              Row(children: [
                                out(context, list3[0], acc),
                                out(context, list3[1], acc),
                              ]),
                              Row(
                                children: [
                                  out(context, list3[2], acc),
                                  out(context, list3[3], acc),
                                ],
                              ),
                            ],
                          ));
                    }),
                DragTarget<String>(
                    onWillAccept: (i) => list4.contains(i),
                    onAccept: (i) {
                      acc.add(i);
                    },
                    builder: (
                      BuildContext context,
                      List<dynamic> accepted,
                      List<dynamic> rejected,
                    ) {
                      return Container(
                          color: Colors.green,
                          child: Column(
                            children: [
                              Row(children: [
                                out(context, list4[0], acc),
                                out(context, list4[1], acc),
                              ]),
                              Row(
                                children: [
                                  out(context, list4[2], acc),
                                  out(context, list4[3], acc),
                                ],
                              ),
                            ],
                          ));
                    }),
              ]),
              ElevatedButton(
                  onPressed: rand,
                  onLongPress: reset,
                  child: const Text("Reset"))
            ],
          ),
        ));
  }
}
