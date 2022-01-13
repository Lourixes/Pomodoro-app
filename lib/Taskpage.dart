import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class TaskPage extends StatefulWidget {
  TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final number = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView.builder(
              itemCount: taskTitels.length,
              addAutomaticKeepAlives: true,
              itemBuilder: (context, i) {
                return SingleTask(timeofTasks[i], taskTitels[i]);
              })),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add, size: 35),
          onPressed: () async {
            await showDialogFunction(context);
            setState(() {
              taskTitels.add(newWord);
              newWord = "";
            });
            number.value++;
          }),
    );
  }
}

List<String> taskTitels = [];
List timeofTasks = [];

class SingleTask extends StatefulWidget {
  const SingleTask(this.timeofCreation, this.titleofTask, {Key? key})
      : super(key: key);
  final timeofCreation;
  final String titleofTask;

  @override
  _SingleTaskState createState() => _SingleTaskState();
}

class _SingleTaskState extends State<SingleTask> {
  @override
  Widget build(BuildContext context) {
    const oneSec = Duration(seconds: 10);
    Timer.periodic(oneSec, (Timer t) => setState(() {}));
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
            leading: const Checkbox(
              value: false,
              onChanged: null,
            ),
            title: Text(
              widget.titleofTask,
              style: const TextStyle(fontSize: 18, fontFamily: "Arial"),
            ),
            trailing: Text(timeago
                .format(widget.timeofCreation, allowFromNow: true)
                .toString())));
  }
}

void addtoList(userInput) {
  taskTitels.add(userInput);
}

var newWord = "";
Future<void> showDialogFunction(BuildContext context) async {
  return await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        final TextEditingController myController = TextEditingController();
        return AlertDialog(
          content: Form(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                  controller: myController,
                  validator: (value) {
                    return value!.isEmpty ? null : "Invalid";
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter Text",
                  )),
            ],
          )),
          actions: <Widget>[
            TextButton(
                child: const Text("Okay"),
                onPressed: () {
                  newWord = myController.text;
                  Navigator.of(context).pop();

                  timeofTasks.add(DateTime.now());
                })
          ],
        );
      });
}
