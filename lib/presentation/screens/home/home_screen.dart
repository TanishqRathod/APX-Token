import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:investment_app/core/routing/app_routes.dart';
import 'package:investment_app/presentation/screens/refer%20and%20earn/refer_and_earn_screen.dart';
import '../token/apx_token_screen.dart';
import '../widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController apxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const greenColor = Color(0xff2A983D);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: greenColor),
                image: const DecorationImage(
                  image: AssetImage("assets/images/img_1.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Feature Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    // Get.toNamed(AppRoutes.kyc);
                  },
                    child: _buildFeatureIcon(icon: Icons.local_florist, label: "Staking")),
                _buildFeatureIcon(icon: Icons.account_balance_wallet, label: "Deposit"),
                InkWell(
                  onTap: (){
                    Get.toNamed(AppRoutes.refer);
                  },
                child: _buildFeatureIcon(icon: Icons.campaign_outlined, label: "Refer & Earn")),
              ],
            ),
            const SizedBox(height: 20),

            // Buy APX Card
            Container(
              height: 205,
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xff1D1D1D),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: greenColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo.png", height: 121),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xff1D1D1D),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Color(0xff2A983D)),
                        ),
                        width: 140,
                        height: 40,
                        alignment: Alignment.center,
                        child: TextField(
                          controller: apxController,
                          style: const TextStyle(color: Colors.white),
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "1 = 0.002 APX",
                            hintStyle: TextStyle(color: Colors.white70),
                            isCollapsed: true,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => BuyAPXTokenScreen(),));
                          Get.toNamed(AppRoutes.apxtoken);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: greenColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text("Buy Now", style: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Join the Movement Button
            CustomButton(
              onPressed: () {
               Get.toNamed(AppRoutes.joy);
              },
              label: "Join The Movement",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureIcon({required IconData icon, required String label}) {
    return Column(
      children: [
        Container(
          height: 71,
          width: 103,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff2A983D)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: 35),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 14,fontWeight: FontWeight.w400)),
      ],
    );
  }
}
