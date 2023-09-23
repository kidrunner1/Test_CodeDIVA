import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_codediva/screens/otp_screen.dart';
import 'package:test_codediva/screens/pin_entry.dart'; // Make sure this is the correct import for your PinEntryScreen

class TouchIDSetupScreen extends StatefulWidget {
  @override
  _TouchIDSetupScreenState createState() => _TouchIDSetupScreenState();
}

class _TouchIDSetupScreenState extends State<TouchIDSetupScreen> {
  bool _isFingerprintSet = false; // Example state variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Spacer(flex: 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Touch ID",
                    style: GoogleFonts.prompt(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "ตั้งค่าล็อคอินด้วยลายนิ้วมือ\nเพื่อการเข้าถึงที่รวดเร็ว",
                    style: GoogleFonts.prompt(
                        fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Spacer(flex: 2),
              Expanded(
                child: Center(
                  child: Icon(
                    Icons.fingerprint,
                    size: 100,
                    color: Color.fromARGB(255, 63, 170, 161).withOpacity(0.5),
                  ),
                ),
              ),
              Spacer(flex: 2),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to OTP screen on pressing this button
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            const Color.fromARGB(255, 63, 170, 161),
                        minimumSize: const Size(double.infinity, 45)),
                    child: Text(
                      'ตั้งค่าลายนิ้วมือ',
                      style: GoogleFonts.prompt(),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Skip Text Button
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => PinEntryScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "ข้าม",
                    style: GoogleFonts.prompt(
                      fontSize: 16,
                      color: Color.fromARGB(255, 63, 170, 161),
                    ),
                  ),
                ),
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
