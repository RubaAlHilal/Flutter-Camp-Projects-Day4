 // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';



class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  static const routeName = "/tasks-page";

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  List<Widget> tasks = [];
  

  TextEditingController taskInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.menu, color: Colors.white),
          ),
        ],
        backgroundColor: Color.fromARGB(255, 255, 221, 127),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color.fromARGB(255, 255, 221, 127),
              width: double.infinity,
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:25 ),
                        child: Image.asset(
                          "assets/woman.png",
                          width: 70,
                          height: 70,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "8 Tasks",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey, height: 5),
                          ),
                          Text(
                            "Personal",
                            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, height: 0.6),
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                      Column(children: tasks),
                      SizedBox(
                        width:200,
                        child: TextField(
                          controller: taskInput,
                        )
                      ),
                      ElevatedButtonTheme(
                        data:ElevatedButtonThemeData(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.amber)
                          ),
                        ),
                        child: ElevatedButton(
                          child: Text("Add"),
                          onPressed: () {
                            setState(() {
                              tasks.add(MainCheckBox(task: taskInput.text));
                            });
                            taskInput.clear();
                          },
                        ),
                      )
                ],
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}


class MainCheckBox extends StatefulWidget {
  const MainCheckBox({super.key, required this.task});

  final String task;
  @override
  State<MainCheckBox> createState() => _MainCheckBoxState();
}

class _MainCheckBoxState extends State<MainCheckBox> {
   bool checkboxIsClicked = false;
   
  @override
  Widget build(BuildContext context) {
     return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:25.0),
                        child: Checkbox(
                          value: checkboxIsClicked,
                          onChanged: (value) {
                            setState(() {
                              checkboxIsClicked = value!;
                            });
                          },
                        ),
                      ),
                      Text(
                        widget.task,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: checkboxIsClicked == true ? Colors.grey : Colors.black,
                          decoration: checkboxIsClicked == true ? TextDecoration.lineThrough : TextDecoration.none,
                        ),
                      ),
                    ],
                  );
  }
}