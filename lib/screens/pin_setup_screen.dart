import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_codediva/screens/fingerprint_setup_screen.dart';

class PinSetupScreen extends StatefulWidget {
  @override
  _PinSetupScreenState createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends State<PinSetupScreen> {
  String _pin = "";
  String _initialPin = "";
  bool _isConfirming = false;
  String? _errorMessage;

  Widget _pinCircle({bool filled = false}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 20,
      height: 20,
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
    if (!_isConfirming && number != 4) return;

    if (_pin.length < 6) {
      setState(() {
        _pin += number.toString();
      });

      if (_pin.length == 6) {
        if (!_isConfirming) {
          Future.delayed(Duration(milliseconds: 500), () {
            setState(() {
              _initialPin = _pin;
              _pin = "";
              _isConfirming = true;
            });
          });
        } else if (_isConfirming && _pin == _initialPin) {
          Future.delayed(Duration(milliseconds: 500), () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => TouchIDSetupScreen(),
            ));
          });
        } else if (_isConfirming && _pin != _initialPin) {
          setState(() {
            _errorMessage = "รหัส PIN ไม่ตรงกัน"; // "PINs don't match."
            _pin = "";
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
          style: GoogleFonts.prompt(
              fontSize: 24, color: Colors.black), // Set color to black
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _isConfirming ? 'ยืนยันรหัส PIN' : 'ตั้งรหัส PIN CODE',
                  style: GoogleFonts.prompt(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(6, (index) {
                    return _pinCircle(filled: index < _pin.length);
                  }),
                ),
                SizedBox(
                  height: 20,
                ),
                if (_errorMessage != null) // <-- Display error message
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      _errorMessage!,
                      style:
                          GoogleFonts.prompt(fontSize: 16, color: Colors.red),
                    ),
                  ),
                SizedBox(height: 20),
                for (var row = 1; row <= 4; row++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(3, (col) {
                        int number = col + 1 + (row - 1) * 3;
                        if (row == 4 && col == 0)
                          return Container(width: 75); // Empty space
                        if (row == 4 && col == 1) return _numberButton(0);
                        if (row == 4 && col == 2) return _deleteButton();
                        return _numberButton(number);
                      }),
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
