import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_codediva/screens/login_screen.dart';
import 'package:test_codediva/screens/otp_confirm.dart';

class OTPRequestScreen extends StatefulWidget {
  @override
  _OTPRequestScreenState createState() => _OTPRequestScreenState();
}

class _OTPRequestScreenState extends State<OTPRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Stack(
                    alignment: Alignment.center,
                    children: [Icon(FontAwesomeIcons.lockOpen)],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'OTP จะถูกส่งไปยัง\nเบอร์โทรศัพท์ 082-xxx-8998',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.prompt(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    IdentityVerificationScreen()));
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
                        'ขอรหัส OTP',
                        style: GoogleFonts.prompt(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'หากเบอร์โทรศัพท์ไม่ถูกต้อง, กรุณาติดต่อ\n02-xxx-xxxx',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.prompt(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40.0, // You can adjust this value as per your needs
            left: 10.0, // You can adjust this value as per your needs
            child: IconButton(
              icon: const Icon(Icons.arrow_back,
                  color: Color.fromARGB(255, 84, 109, 86)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
