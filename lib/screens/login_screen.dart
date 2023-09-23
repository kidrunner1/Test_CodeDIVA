import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:test_codediva/screens/reset_password.dart';
import 'otp_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'ชื่อผู้ใช้งาน',
                    labelStyle: GoogleFonts.prompt(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'รหัสผ่าน',
                    labelStyle: GoogleFonts.prompt(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.visibility),
                      onPressed: () {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (newValue) {}),
                    Text(
                      'บันทึกการเข้าสู่ระบบ',
                      style: GoogleFonts.prompt(),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResetPassword()));
                      },
                      child: Text(
                        'ลืมรหัสผ่าน?',
                        style: GoogleFonts.prompt(
                            color: Color.fromARGB(255, 63, 170, 161)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTPRequestScreen()));
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
                      'เข้าสู่ระบบ',
                      style: GoogleFonts.prompt(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'ไม่มีบัญชีผู้ใช้',
                        style: GoogleFonts.prompt(fontWeight: FontWeight.w200),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 63, 170, 161),
                        backgroundColor: Colors.white, // text (and icon) color
                        side: const BorderSide(
                            color: Color.fromARGB(255, 63, 170, 161), width: 2),
                        minimumSize: const Size(
                            double.infinity, 45) // border color and width
                        ),
                    child: Text(
                      'เปิดบัญชีเพื่อลงทะเบียนบัญชีผู้ใช้',
                      style: GoogleFonts.prompt(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
