//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body1 extends StatefulWidget {
  const Body1({super.key});

  @override
  State<Body1> createState() => _Body1State();
}

class _Body1State extends State<Body1> {
  String email = "";

  getCachedEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email') ?? '--';

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getCachedEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Your Profile \n  WELCOME..." + " $email"),
    );
  }
}
