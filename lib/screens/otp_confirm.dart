import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_codediva/screens/login_screen.dart';
import 'package:test_codediva/screens/pin_setup_screen.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class IdentityVerificationScreen extends StatefulWidget {
  @override
  _IdentityVerificationScreenState createState() =>
      _IdentityVerificationScreenState();
}

class _IdentityVerificationScreenState
    extends State<IdentityVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoFillOTPAndNavigate();
    });
  }

  _autoFillOTPAndNavigate() {
    setState(() {
      _otpController.text = "999999";
    });

    Future.delayed(Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PinSetupScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'ยืนยันตัวตน',
                  style: GoogleFonts.prompt(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'กรุณากรอกรหัสยืนยันที่เราส่งให้คุณ\n082-XXX-8998',
                  style: GoogleFonts.prompt(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),

                // Hidden TextField
                TextField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  onChanged: (value) {
                    setState(() {
                      _otpController.text = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    counterText: '',
                  ),
                  style: TextStyle(height: 0, fontSize: 0),
                ),

                // Visible OTPTextField
                OTPTextField(
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 40,
                  style: GoogleFonts.prompt(
                    fontSize: 20,
                    letterSpacing: 20,
                  ),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.underline,
                  onChanged: (pin) {
                    setState(() {
                      _otpController.text = pin;
                    });
                  },
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                  },
                ),
                SizedBox(height: 60),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'หากคุณไม่ได้รับรหัส?',
                        style: GoogleFonts.prompt(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          // Handle the resend password action here
                        },
                        child: Text(
                          'ส่งรหัสใหม่',
                          style: GoogleFonts.prompt(
                            color: Color.fromARGB(255, 63, 170, 161),
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 40.0,
              left: 10.0,
              child: IconButton(
                icon: const Icon(Icons.arrow_back,
                    color: Color.fromARGB(255, 63, 170, 161)),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
