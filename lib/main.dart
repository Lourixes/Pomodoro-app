// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "Taskpage.dart";

void main() => runApp(const MaterialApp(home: StatelessApp()));

class StatelessApp extends StatelessWidget {
  const StatelessApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  title: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: "Arial",
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(text: "Pomo"),
                        TextSpan(
                            text: "do", style: TextStyle(color: Colors.blue)),
                        TextSpan(text: "ro")
                      ],
                    ),
                  ),
                  bottom: const TabBar(
                    tabs: [
                      Tab(
                        child: Text(
                          "Shortly",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Tasks",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Tab(
                          child: Text(
                        "Shortly",
                        style: TextStyle(color: Colors.black),
                      ))
                    ],
                  ),
                ),
                body: TabBarView(children: <Widget>[
                  const Icon(Icons.directions_car),
                  TaskPage(),
                  const Icon(Icons.directions_bike),
                ]))));
  }
}
