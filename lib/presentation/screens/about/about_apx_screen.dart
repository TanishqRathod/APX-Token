import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class AboutApxScreen extends StatefulWidget {
  const AboutApxScreen({Key? key}) : super(key: key);

  @override
  State<AboutApxScreen> createState() => _AboutApxScreenState();
}

class _AboutApxScreenState extends State<AboutApxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text("About APX",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.left_chevron,size: 30,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Mission Statement
            _buildInfoBox(
              title: "Mission Statement",
              subtitle: "Blockchain-powered sustainable urban farming.",
            ),
            const SizedBox(height: 16),

            // Problems & Solutions
            _buildInfoBox(
              title: "Problems & Solutions",
              subtitle: "Traditional vs. APX farming",
            ),
            const SizedBox(height: 16),

            // Timeline Image
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff2A983D)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                "assets/images/about_apx_img.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 15,),

            // Join The Movement Button
            CustomButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => QrApxBuyScreen(),));
              },
              label: "Join The Movement",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox({required String title, required String subtitle}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xff2A983D)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    )),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: const TextStyle(color: Colors.white, fontSize: 15),textAlign: TextAlign.center),
              ],
            ),
          ),
          const Icon(Icons.add, color: Colors.white,size: 30,),
        ],
      ),
    );
  }
}
