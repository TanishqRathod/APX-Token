import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:investment_app/core/routing/app_routes.dart';
import 'package:investment_app/presentation/screens/widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  int secondsRemaining = 59;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining == 0) {
        _timer.cancel();
      } else {
        setState(() {
          secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _onEditPhone() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Text(
                  "OTP Verification",
                  style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sent on +91 00000 00000 ",
                      style: TextStyle(color: Colors.white60),
                    ),
                    GestureDetector(
                      onTap: _onEditPhone,
                      child: Text(
                        "Edit",
                        style: TextStyle(color: Color(0xffFF9933), fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),

                // OTP Input
                SizedBox(
                  width: 240,
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    onChanged: (value) {},
                    textStyle: TextStyle(color: Colors.white),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      inactiveColor: Colors.white,
                      activeColor: Colors.greenAccent,
                      selectedColor: Colors.green,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),

                SizedBox(height: 10),
                Text(
                  "Resend in $secondsRemaining sec",
                  style: TextStyle(color: Colors.white60),
                ),
                SizedBox(height: 100,),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(text: "By continuing "),
                        TextSpan(
                          text: "Terms of Use",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                        TextSpan(text: " and "),
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ],
                    ),
                  ),
                ),

                CustomButton(onPressed: (){
                  Get.toNamed(AppRoutes.navbar);
                }, label: 'Confirm')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
