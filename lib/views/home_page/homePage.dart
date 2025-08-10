import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: false,
        backgroundColor: Colors.amber,
        elevation: 2,
      ),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}