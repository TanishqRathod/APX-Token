import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:investment_app/core/routing/app_routes.dart';

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100),topLeft: Radius.circular(20))
      ),
      child: Drawer(
        backgroundColor: Colors.black87,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            SizedBox(height: 150,),
            ListTile(
              title: Text('About',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),),
              onTap: (){
                Get.toNamed(AppRoutes.about);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 40.0),
              child: Divider(color: Color(0xff2A983D),),
            ),
            ListTile(
              title: Text('FAQ',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),),
              onTap: (){
                Get.toNamed(AppRoutes.faq);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 40.0),
              child: Divider(color: Color(0xff2A983D),),
            ),
            ListTile(
              title: Text('KYC',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),),
              onTap: (){
                Get.toNamed(AppRoutes.kyc);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 40.0),
              child: Divider(color: Color(0xff2A983D),),
            ),
          ],
        ),
      ),
    );
  }
}
