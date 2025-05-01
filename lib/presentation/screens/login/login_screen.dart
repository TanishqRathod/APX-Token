import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:investment_app/core/routing/app_routes.dart';
import 'package:investment_app/presentation/screens/login/otp/otp_screen.dart';
import 'package:investment_app/presentation/screens/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              // Logo
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                ),
              ),
              SizedBox(height: 50),

              // Phone Input Field with Country Code Picker
              IntlPhoneField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent, width: 2),
                  ),
                ),
                initialCountryCode: 'IN',
                showDropdownIcon: false,
                dropdownIconPosition: IconPosition.trailing,
                flagsButtonMargin: const EdgeInsets.only(right: 8),
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
                dropdownTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              // Continue Button
              CustomButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.otp);
                },
                label: "Continue",
              ),


              SizedBox(height: 10),

              // Social Text
              Text(
                'Or connect with social media',
                style: TextStyle(color: Colors.white60,fontSize: 10,fontWeight: FontWeight.w400),
              ),

              SizedBox(height: 10),
              CustomButton(
                onPressed: () {

                },
                label: "Continue with Google",
                icon: FontAwesomeIcons.google,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
