import 'package:amazing_app/data_classes/attempt_data.dart';
import 'package:amazing_app/drawer.dart';
import 'package:flutter/material.dart';

var listOfAttempts = <AttemptData>[];

class AttemptsRecorder extends StatefulWidget {
  const AttemptsRecorder({super.key});

  @override
  State<AttemptsRecorder> createState() => _AttemptsRecorderState();
}

class _AttemptsRecorderState extends State<AttemptsRecorder> {
  final idController = TextEditingController();
  final nameController = TextEditingController();

  void addAttempt(String attemptId, String person) {
    var timeNow = DateTime.now();
    setState(() {
      listOfAttempts.add(AttemptData(
          attemptId: attemptId,
          personName: person,
          time: "${timeNow.hour}:${timeNow.minute}"));
    });
  }

  @override
  void dispose() {
    idController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Record Attempts"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: ListView.builder(
                    itemCount: listOfAttempts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(listOfAttempts[index].attemptId),
                        subtitle: Text(
                            "By ${listOfAttempts[index].personName} at ${listOfAttempts[index].time}"),
                      );
                    })),
            OutlinedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        final attemptNo = listOfAttempts.length;
                        idController.text = "Attempt $attemptNo";
                        return AlertDialog(
                          title: const Text("Add An Attemt"),
                          content: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: idController,
                                  decoration: const InputDecoration(
                                    hintText: "Enter Attempt Id",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                    controller: nameController,
                                    decoration: const InputDecoration(
                                      hintText: "Add the person name",
                                      border: OutlineInputBorder(),
                                    )),
                              ),
                            ],
                          ),
                          actions: [
                            OutlinedButton(
                                onPressed: () {
                                  addAttempt(
                                      idController.text, nameController.text);
                                  Navigator.pop(context);
                                },
                                child: const Text("Add")),
                            OutlinedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel"))
                          ],
                        );
                      });
                },
                child: const Text("Add Attempt")),
            const SizedBox(
              width: 5,
              height: 5,
            ),
            OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Back")),
          ])),
      drawer: const Drawer(
        child: DrawerContent(),
      ),
    );
  }
}
