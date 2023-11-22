import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shafinbd/controller/indexController.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<indexController>(builder: (controller) {
      return Scaffold(
        body: controller.pages[controller.index],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue, // Set the selected item color here
          unselectedItemColor: Colors.grey,
          //selectedIconTheme: IconThemeData(color: Colors.yellow),
          currentIndex: controller.index,
          elevation: 0,
          // backgroundColor: const Color.fromARGB(255, 190, 186, 186),
          onTap: (index) {
            controller.onchange(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                //color: Colors.black,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              //backgroundColor: Colors.black,
              icon: Icon(
                Icons.book,
                //color: Colors.black,
              ),
              label: "Course",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                // color: Colors.black,
              ),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}
