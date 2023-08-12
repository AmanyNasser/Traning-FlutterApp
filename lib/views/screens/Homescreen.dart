import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'Body1.dart';
import 'Body2.dart';
import 'Body3.dart';

class Homescreen extends StatefulWidget {
  //...........
  String email;
  Homescreen({super.key, required this.email});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  //..............
  int currentIndex = 0;
  List<Widget> page = [
    Body1(),
    Body2(),
    Body3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(161, 255, 153, 0),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(); //............
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            child: page[currentIndex],
          ),
          /* Center(
              child: Text(
            widget.email,
            style: TextStyle(fontSize: 30),
          )),*/
        ],
      ),
      //  body: page[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Body1'),
          BottomNavigationBarItem(icon: Icon(Icons.security), label: 'Body2'),
          BottomNavigationBarItem(icon: Icon(Icons.more), label: 'Body3'),
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
            print(value);
          });
        },
      ),
    );
  }
}
