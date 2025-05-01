import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:investment_app/core/routing/app_routes.dart';
import 'package:investment_app/presentation/screens/QR%20Buy%20APX/qr_apx_buy_screen.dart';

import '../widgets/custom_button.dart';

class BuyAPXTokenScreen extends StatelessWidget {
  const BuyAPXTokenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const greenColor = Color(0xff2A983D);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 70),
              Row(
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(CupertinoIcons.left_chevron,size: 30,color: Colors.white,)),
                  SizedBox(width: 80,),
                  const Center(
                    child: Text(
                      "Buy APX Token",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
          // Spend Section
              _SpendOrGetBox(
                title: "You Spend",
                value: "10",
                tokenName: "USDT",
                img: "assets/images/Vector.png",
              ),
        
              const SizedBox(height: 20),
        
              // Get Section
              _SpendOrGetBox(
                title: "You Get",
                value: "5000",
                tokenName: "APX",
                img: "assets/images/logo.png",
                subtitle: "1 USDT = 500 APX TOKENS",
              ),
        
             SizedBox(height: 70,),
        
              // Buttons
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        Get.toNamed(AppRoutes.customApx);
                      },
                      child: const Text(
                        "Custom Amount",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => QrApxBuyScreen(),));
                    },
                    label: "Buy Now",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SpendOrGetBox extends StatelessWidget {
  final String title;
  final String value;
  final String tokenName;
  final String img;
  final String? subtitle;

  const _SpendOrGetBox({
    required this.title,
    required this.value,
    required this.img,
    required this.tokenName,

    this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const greenColor = Color(0xff2A983D);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xff1D1D1D),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(title,
                      style: const TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w400)),
                  SizedBox(height: 10,),
                  Text(value,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              Container(
                width: 133,
                height: 71,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: greenColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(img,height: 20,),
                    const SizedBox(width: 6),
                    Text(tokenName,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700,fontSize: 20)),
                  ],
                ),
              ),
            ],
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 12),
            Divider(color: greenColor.withOpacity(0.5), thickness: 1),
            const SizedBox(height: 6),
            Text(subtitle!,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400)),
          ]
        ],
      ),
    );
  }
}
