import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:investment_app/core/routing/app_routes.dart';
import 'package:share_plus/share_plus.dart';

class ReferAndEarnScreen extends StatefulWidget {
  const ReferAndEarnScreen({super.key});

  @override
  State<ReferAndEarnScreen> createState() => _ReferAndEarnScreenState();
}

class _ReferAndEarnScreenState extends State<ReferAndEarnScreen> {
  final TextEditingController _referralCodeController = TextEditingController();
  late String referralCode;

  @override
  void initState() {
    super.initState();
    referralCode = generateReferralCode(); 
  }

  String generateReferralCode({int length = 8}) {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random.secure();
    return List.generate(length, (index) => chars[rand.nextInt(chars.length)]).join();
  }

  @override
  Widget build(BuildContext context) {
    const greenColor = Color(0xff2A983D);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.left_chevron, color: Colors.white,size: 30,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  SizedBox(
                    width: 300,
                    height: 230,
                    child: Image.asset("assets/images/referandearn.png", fit: BoxFit.cover),
                  ),

                  // Referral Code Display Box
                  Container(
                    height: 67,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Your Code",
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        GestureDetector(
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: referralCode));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Referral code copied!")),
                            );
                          },
                          child: Text(
                            referralCode,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Share.share('Join me on APX and earn tokens! Use my referral code: $referralCode');
                          },
                          child: const Icon(FontAwesomeIcons.shareFromSquare, color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Referral Code Entry
                  // TextField(
                  //   controller: _referralCodeController,
                  //   style: const TextStyle(color: Colors.white),
                  //   decoration: InputDecoration(
                  //     hintText: "Enter a referral code",
                  //     hintStyle: const TextStyle(color: Colors.white54),
                  //     filled: true,
                  //     fillColor: const Color(0xff1D1D1D),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     suffixIcon: IconButton(
                  //       icon: const Icon(Icons.check_circle, color: Colors.green),
                  //       onPressed: () {
                  //         String enteredCode = _referralCodeController.text.trim();
                  //         if (enteredCode.isEmpty) {
                  //           ScaffoldMessenger.of(context).showSnackBar(
                  //             const SnackBar(content: Text("Please enter a referral code.")),
                  //           );
                  //         } else {
                  //           // TODO: Send to backend or Firebase for validation and bonus logic
                  //           ScaffoldMessenger.of(context).showSnackBar(
                  //             SnackBar(content: Text("Referral code \"$enteredCode\" submitted!")),
                  //           );
                  //         }
                  //       },
                  //     ),
                  //   ),
                  // ),

                  // const SizedBox(height: 30),

                  // How to Earn Box
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xff1D1D1D),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "How to Earn ?",
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16),
                        _HowToEarnStep(
                          number: '1',
                          text: 'Invite your friends by sharing your referral code',
                        ),
                        SizedBox(height: 24),
                        _HowToEarnStep(
                          number: '2',
                          text: 'You will earn 2 APX Tokens when your friend completes Onboarding.',
                        ),
                        SizedBox(height: 24),
                        _HowToEarnStep(
                          number: '3',
                          text: 'No Minimum Amount Required',
                          isLast: true,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HowToEarnStep extends StatelessWidget {
  final String number;
  final String text;
  final bool isLast;

  const _HowToEarnStep({
    required this.number,
    required this.text,
    this.isLast = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 40,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              if (!isLast)
                Positioned(
                  top: 40,
                  bottom: 0,
                  child: Container(
                    width: 2,
                    color: Colors.white24,
                  ),
                ),
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xff2A983D),
                child: Text(
                  number,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
