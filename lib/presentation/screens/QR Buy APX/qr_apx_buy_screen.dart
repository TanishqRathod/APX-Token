import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class QrApxBuyScreen extends StatefulWidget {
  const QrApxBuyScreen({super.key});

  @override
  State<QrApxBuyScreen> createState() => _QrApxBuyScreenState();
}

class _QrApxBuyScreenState extends State<QrApxBuyScreen> {
  @override
  Widget build(BuildContext context) {
    const greenColor = Color(0xff2A983D);
    const address =
        "0xdac17f958d2ee523a2206206994597c13d831ec7"; // Your wallet address

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),

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

              // QR Code Container
              Container(
                height: 290,
                width: 290,
                decoration: BoxDecoration(
                  border: Border.all(color: greenColor),
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xff1D1D1D),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.qr_code_2_outlined, color: Colors.white, size: 190),
                    Text("Pay Using",
                        style:
                        TextStyle(color: Colors.white, fontSize: 16)),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              const Center(
                child: Text(
                  "or copy below Address",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ),
              const SizedBox(height: 12),

              // Wallet Address
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xff1D1D1D),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white38),
                ),
                child: Text(
                  address,
                  style: const TextStyle(
                      color: Colors.white70, fontSize: 12.5,fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              // Upload Receipt Button
              CustomButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => QrApxBuyScreen(),));
                },
                label: "Upload Receipt",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
