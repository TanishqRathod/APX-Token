import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:investment_app/core/routing/app_routes.dart';

class CustomAmountScreen extends StatefulWidget {
  const CustomAmountScreen({super.key});

  @override
  State<CustomAmountScreen> createState() => _CustomAmountScreenState();
}

class _CustomAmountScreenState extends State<CustomAmountScreen> {
  final TextEditingController _usdtController = TextEditingController();
  double _apxTokens = 0;

  static const conversionRate = 500; // 1 USDT = 500 APX

  void _calculateTokens(String value) {
    final usdt = double.tryParse(value) ?? 0;
    setState(() {
      _apxTokens = usdt * conversionRate;
    });
  }

  @override
  Widget build(BuildContext context) {
    const greenColor = Color(0xff2A983D);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(CupertinoIcons.left_chevron,size: 30,color: Colors.white,)),
        title: const Text("Enter Custom Amount", style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter USDT Amount",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 10),
            TextField(
              cursorColor: Colors.white,
              controller: _usdtController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xff1D1D1D),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xff2A983D),width: 1)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xff2A983D),width: 1.5)
                ),
                hintText: "e.g. 10",
                hintStyle: const TextStyle(color: Colors.white54),
              ),
              onChanged: _calculateTokens,
            ),
            const SizedBox(height: 30),
            Text(
              "You will receive:",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 8),
            Text(
              "${_apxTokens.toStringAsFixed(0)} APX Tokens",
              style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              "1 USDT = 500 APX TOKENS",
              style: TextStyle(color: Colors.white54),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                 Get.toNamed(AppRoutes.scanner);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Buying $_apxTokens APX tokens")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("Buy Now", style: TextStyle(fontSize: 16)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
