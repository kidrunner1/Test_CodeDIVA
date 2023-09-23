import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_codediva/screens/login_screen.dart';

class PinEntryScreen extends StatefulWidget {
  @override
  _PinEntryScreenState createState() => _PinEntryScreenState();
}

class _PinEntryScreenState extends State<PinEntryScreen> {
  String _pin = "";
  String? _errorMessage; // 1. Add a new variable to hold the error message.

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => _showDialog());
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 10,
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.fingerprint,
                size: 70,
                color: Colors.red.withOpacity(0.5),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Touch ID for\n"CGS Application"',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.prompt(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'เข้าใช้งานด้วย Touch ID หรือ',
                textAlign: TextAlign.center,
                style: GoogleFonts.prompt(fontSize: 15),
              ),
              SizedBox(height: 10),
              Text(
                'ยกเลิกเพื่อกลับไปใช้รหัส PIN',
                textAlign: TextAlign.center,
                style: GoogleFonts.prompt(fontSize: 15),
              ),
              SizedBox(height: 20),
              Divider(),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Enter Password")),
              TextButton(
                child: Text(
                  'ยกเลิก',
                  style: GoogleFonts.prompt(fontSize: 16, color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _pinCircle({bool filled = false}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 20,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: filled ? Color.fromARGB(255, 63, 170, 161) : Colors.white,
        border: Border.all(
            color: filled ? Color.fromARGB(255, 63, 170, 161) : Colors.grey,
            width: 2),
      ),
    );
  }

  void _addNumberToPIN(int number) {
    if (_pin.length < 6) {
      setState(() {
        _pin += number.toString();
      });
      if (_pin.length == 6) {
        if (_pin == "444444") {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => SuccessLoginScreen()));
        } else {
          // Set the error message when the PIN is incorrect
          setState(() {
            _errorMessage =
                "รหัส PIN ไม่ถูกต้อง โปรดลองใหม่"; // This means "The PIN is incorrect. Please try again."
            _pin = ""; // Clear the pin for re-entry
          });
        }
      }
    }
  }

  void _removeLastPIN() {
    if (_pin.isNotEmpty) {
      setState(() {
        _pin = _pin.substring(0, _pin.length - 1);
      });
    }
  }

  Widget _numberButton(int number) {
    return InkWell(
      onTap: () => _addNumberToPIN(number),
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.withOpacity(0.3), width: 2),
        ),
        alignment: Alignment.center,
        child: Text(
          '$number',
          style: GoogleFonts.prompt(fontSize: 24),
        ),
      ),
    );
  }

  Widget _deleteButton() {
    return InkWell(
      onTap: _removeLastPIN,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
        ),
        alignment: Alignment.center,
        child: Icon(Icons.backspace, size: 24),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: 100),
              Text(
                "กรุณากรอกรหัส PIN",
                style:
                    GoogleFonts.prompt(fontSize: 18, color: Colors.grey[600]),
              ),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    _errorMessage!,
                    style: GoogleFonts.prompt(fontSize: 16, color: Colors.red),
                  ),
                ),
              // Reduced height for proximity
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (index) {
                  return _pinCircle(filled: index < _pin.length);
                }),
              ),
              // Reduced height for proximity
              for (var row = 1; row <= 4; row++)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0), // Reduced padding
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(3, (col) {
                      int number = col + 1 + (row - 1) * 3;
                      if (row == 4 && col == 0) {
                        return SizedBox(
                            width: 75,
                            child: IconButton(
                              icon: Icon(
                                Icons.fingerprint,
                                color: Colors.red,
                                size: 40,
                              ),
                              onPressed: () {},
                            ));
                      }
                      if (row == 4 && col == 1) return _numberButton(0);
                      if (row == 4 && col == 2) return _deleteButton();
                      return _numberButton(number);
                    }),
                  ),
                ),
              Text(
                "ลืมรหัส PIN ?", // This is in Thai, meaning "Forgot PIN?"
                style: GoogleFonts.prompt(fontSize: 16, color: Colors.blue),
              ),
              SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}

class SuccessLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline_rounded,
                size: 100.0, color: Color.fromARGB(255, 63, 170, 161)),
            SizedBox(height: 60),
            Text(
              "การเข้าสู่ระบบสำเร็จ",
              textAlign: TextAlign.center,
              style: GoogleFonts.prompt(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 70),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 63, 170, 161),
                    minimumSize: const Size(20, 45)),
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
