// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intro_flutter/tasks_page.dart';
import 'package:google_fonts/google_fonts.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, color: Color.fromARGB(255, 168, 126, 1)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    children: [
                        Text(
                          "Hello Ender",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)
                          ),
                        Text(
                          "Today you have 4 tasks",
                           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey)
                      ),
                    ],
                  ), 
                  Image.asset( 
                    "assets/woman.png",
                     width: 60,
                     height: 60,
                    ), 
                  ],
                ),
            ),
            MainCard(image: "assets/sun.png", name: "Today", tasks_num: 4, ),
            MainCard(image: "assets/calendar.png", name: "Planned", tasks_num: 2),
            MainCard(image: "assets/man.png", name: "Personal", tasks_num: 6), 
            MainCard(image: "assets/suitcase.png", name: "Work", tasks_num: 5),
            MainCard(image: "assets/bag.png", name: "Shopping", tasks_num: 8)
          ]
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 168, 126, 1),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home_outlined)),

          BottomNavigationBarItem(label: "Courses", icon: Icon(Icons.list_outlined)),

          BottomNavigationBarItem(label: "Messages", icon: Icon(Icons.message_outlined)),

          BottomNavigationBarItem(label: "Help" , icon: Icon(Icons.help_outline,)),
        ],)     
    );
  }
}


class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.image, required this.name ,required this.tasks_num});

final String image;
final String name;
final int tasks_num;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, TasksPage.routeName);
      },
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(color: Color.fromARGB(255, 255, 235, 181), borderRadius: BorderRadius.circular(12), border: Border.all(color: Color.fromARGB(255, 238, 192, 41), width: 1,),),
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Image.asset(
                    image,
                    height: 45,
                    width: 45,
                   ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.robotoSlab(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                    Text("Task $tasks_num",
                     style: GoogleFonts.robotoSlab(textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                     ),
                ],
              ),
            ],
          ),
          
          Icon(Icons.menu),
          ],
        ),
      
      ),
    );
  }
}