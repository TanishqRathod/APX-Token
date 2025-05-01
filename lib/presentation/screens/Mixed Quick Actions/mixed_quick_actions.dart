import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:investment_app/core/routing/app_routes.dart';

class MixedQuickActions extends StatefulWidget {
  const MixedQuickActions({super.key});

  @override
  State<MixedQuickActions> createState() => _MixedQuickActionsState();
}

class _MixedQuickActionsState extends State<MixedQuickActions> {
  int selectedIndex = 0;

  final actions = [
    {'icon': FontAwesomeIcons.arrowUpLong, 'label': 'Send'},
    {'icon': FontAwesomeIcons.arrowDownLong, 'label': 'Receive'},
    {'icon': FontAwesomeIcons.inbox, 'label': 'My Tokens'},
  ];

  @override
  Widget build(BuildContext context) {
    const greenColor = Color(0xff2A983D);
    const backgroundColor = Color(0xff121212);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 50,),
              // Selectable Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(actions.length, (index) {
                  final item = actions[index];
                  final isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 103,
                          height: 71,
                          decoration: BoxDecoration(
                            color: isSelected ? greenColor.withOpacity(0.2) : backgroundColor,
                            border: Border.all(color: greenColor),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(item['icon'] as IconData, color: Colors.white,size: 30,),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          item['label'] as String,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              const SizedBox(height: 24),

              // My Referrals
              _buildInfoCard('My Referrals', '2'),

              const SizedBox(height: 12),

              // My Tokens
              _buildInfoCard('My Tokens', '5000'),

              const SizedBox(height: 12),

              // Buy $APX
              Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Buy \$APX',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: greenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed(AppRoutes.apxtoken);
                      },
                      child: const Text('Buy Now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 19),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    const greenColor = Color(0xff2A983D);
    const backgroundColor = Color(0xff121212);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
          Row(
            children: [
              Text(value, style: const TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(width: 6),
              Icon(Icons.arrow_forward, color: greenColor,size: 40,),
            ],
          )
        ],
      ),
    );
  }
}
