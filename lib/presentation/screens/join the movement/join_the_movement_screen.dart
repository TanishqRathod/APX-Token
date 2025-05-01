import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class JoinTheMovementScreen extends StatefulWidget {
  const JoinTheMovementScreen({Key? key}) : super(key: key);

  @override
  State<JoinTheMovementScreen> createState() => _JoinTheMovementScreenState();
}

class _JoinTheMovementScreenState extends State<JoinTheMovementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text("Join The Movement",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
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
              title: "Get Involved",
              subtitle: "Buy APX tokens, stake for rewards ,or partner with APX.",
            ),
            const SizedBox(height: 16),

            // Problems & Solutions
            _buildInfoBox(
              title: "Community Engagement",
              subtitle: "Join Telegram, Twitter ,and Discord.",
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
                "assets/images/enjoy_the_movement_img.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 15,),
            // Join The Movement Button
            CustomButton(
              onPressed: () {

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
                    style: const TextStyle(color: Colors.white, fontSize: 15),textAlign: TextAlign.center,),
              ],
            ),
          ),
          const Icon(Icons.add, color: Colors.white,size: 30,),
        ],
      ),
    );
  }
}
