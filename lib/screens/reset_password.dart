import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_codediva/screens/login_screen.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _phoneFocus = FocusNode(); // Create the FocusNode
  final String fakePhoneNumber = "0123456789";

  void _checkPhoneNumberAndNavigate() {
    if (_controller.text.isNotEmpty) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SuccessScreen()));
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)), // Curved edges
                title: Text(
                  "",
                  style: GoogleFonts.prompt(), // Using Google font
                ),
                content: Text(
                  "กรุณากรอกเบอร์โทรศัพท์ \nหรืออีเมล",
                  style: GoogleFonts.prompt(fontSize: 16), // Using Google font
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the dialog
                      },
                      child: Text(
                        "OK",
                        style: GoogleFonts.prompt(), // Using Google font
                      ))
                ],
              ));
    }
  }

  @override
  void dispose() {
    _phoneFocus.dispose(); // Dispose of the FocusNode
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 40.0,
            left: 10.0,
            child: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: Color.fromARGB(255, 63, 170, 161)),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen())),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ลืมรหัสผ่าน?',
                    style: GoogleFonts.prompt(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text('กรุณากรอกอีเมลหรือเบอร์โทรศัพท์ที่\nทำการลงทะเบียน',
                    style: GoogleFonts.prompt(fontSize: 16)),
                SizedBox(height: 20),
                TextField(
                  controller: _controller,
                  focusNode:
                      _phoneFocus, // Assign the FocusNode to the TextField
                  autofocus: true, // Set autofocus to true
                  decoration: InputDecoration(
                    labelText: 'อีเมล/เบอร์โทรศัพท์',
                    labelStyle: GoogleFonts.prompt(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _checkPhoneNumberAndNavigate,
                    child: Text('ส่ง',
                        style: GoogleFonts.prompt(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 63, 170, 161),
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline_rounded,
                size: 150.0, color: Color.fromARGB(255, 63, 170, 161)),
            SizedBox(height: 60),
            Text(
              "สำเร็จ",
              textAlign: TextAlign.center,
              style: GoogleFonts.prompt(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20), // Add a spacer to separate the texts
            Text(
              "รีเซ็ตรหัสผ่านของคุณสำเร็จแล้ว.",
              textAlign: TextAlign.center,
              style: GoogleFonts.prompt(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),

            SizedBox(height: 70),
            Container(
              // Container to define the width of the button
              width: MediaQuery.of(context).size.width *
                  0.7, // Width is 70% of the screen width
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LoginScreen())); // Navigate to OTP screen on pressing this button
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 63, 170, 161),
                    minimumSize: const Size(25, 45)),
                child: Text(
                  'ตกลง',
                  style: GoogleFonts.prompt(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
