import 'package:flutter/material.dart';
import 'package:test_codediva/screens/language_selection.dart';
import 'package:test_codediva/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsOfService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
              child:
                  SizedBox.shrink()), // This pushes the container to the bottom
          Container(
            padding:
                const EdgeInsets.only(bottom: 50, left: 40, top: 40, right: 20),
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Icon(Icons.article,
                        color: Color.fromARGB(255, 63, 170, 161), size: 28.0),
                    const SizedBox(width: 10),
                    Text(
                      'เงื่อนไขการใช้บริการ',
                      style: GoogleFonts.prompt(
                        // Set the Prompt font
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                  color:
                      Colors.grey, // Corrected color typo from "gray" to "grey"
                  thickness: 1.5,
                ),
                const Spacer(), // This will push the buttons down
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LanguageSelection(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(
                            color: Color.fromARGB(255, 63, 170, 161)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                      ),
                      child: Text(
                        'ปฏิเสธ',
                        style: GoogleFonts.prompt(
                          // Set the Prompt font
                          color: Color.fromARGB(255, 63, 170, 161),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 63, 170, 161),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                      ),
                      child: Text(
                        'ยอมรับ',
                        style: GoogleFonts.prompt(
                          // Set the Prompt font
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
