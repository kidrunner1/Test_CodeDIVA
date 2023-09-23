import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_codediva/screens/terms_screen.dart';

class LanguageSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align content to the start
          children: [
            Text('ยินดีต้อนรับ', style: GoogleFonts.prompt(fontSize: 25)),

            Text('กรุณาเลือกภาษา',
                style: GoogleFonts.prompt(
                    fontSize: 20, fontWeight: FontWeight.w200)),
            const SizedBox(height: 40),
            // Center the buttons horizontally
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromARGB(255, 63, 170, 161),
                          minimumSize: const Size(
                              double.infinity, 45) // text (and icon) color
                          // border color and width
                          ),
                      child: Text(
                        'English',
                        style: GoogleFonts.prompt(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TermsOfService()));
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromARGB(255, 63, 170, 161),
                          minimumSize: const Size(
                              double.infinity, 45) // text (and icon) color
                          // border color and width
                          ),
                      child: Text(
                        'ไทย',
                        style: GoogleFonts.prompt(),
                      ),
                    ),
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
