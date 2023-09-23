import 'package:flutter/material.dart';
import 'language_selection.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(
          255, 63, 170, 161), // Set the background color to green
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          // Check if the scroll position is at the end
          if (scrollNotification.metrics.pixels ==
              scrollNotification.metrics.maxScrollExtent) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LanguageSelection()));
            return true;
          }
          return false;
        },
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.9, // 90% of screen height
                  ),
                  // Thick line at the bottom with rounded corners
                  Container(
                    height: 8, // Define the thickness of the line here
                    width: MediaQuery.of(context).size.width *
                        0.6, // 60% of screen width
                    decoration: BoxDecoration(
                      color: Colors.white, // Color of the line
                      borderRadius:
                          BorderRadius.circular(20), // Border radius of 20
                      border: Border.all(
                          color: Colors.white,
                          width: 1), // Border color and width
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.2, // 10% of screen height
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
