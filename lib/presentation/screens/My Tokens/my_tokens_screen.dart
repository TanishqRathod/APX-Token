import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:investment_app/core/routing/app_routes.dart';

import '../widgets/custom_button.dart';

class MyTokensScreen extends StatelessWidget {
  const MyTokensScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const greenColor = Color(0xff2A983D);

    // Dummy transaction data
    final transactions = [
      {'amount': '5000 APX', 'date': '10 Mar 2025'},
      {'amount': '100 APX', 'date': '01 Apr 2025'},
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "My Tokens",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),

              const Text(
                "Wallet Balance",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xff1D1D1D),
                  border: Border.all(color: greenColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/logo.png", height: 28), // APX icon
                    const SizedBox(width: 12),
                    const Text(
                      "5100  APX Tokens",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              const Text(
                "Transaction History",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 12),

              // Transaction List
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xff1D1D1D),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: transactions.map((txn) {
                    return Column(
                      children: [
                        ListTile(
                          leading: Image.asset("assets/images/logo.png",
                              height: 30),
                          title: Text(txn['amount']!,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16)),
                          trailing: Text(txn['date']!,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14)),
                        ),
                        if (txn != transactions.last)
                          const Divider(color: Colors.white, indent: 16, endIndent: 16),
                      ],
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 50,),
              CustomButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.apxtoken);
                },
                label: "Buy More APX",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
