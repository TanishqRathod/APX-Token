import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/routing/app_routes.dart';
import 'core/routing/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Investment App',
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
      theme: ThemeData.dark(),
    );
  }
}
