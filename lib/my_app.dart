import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_getx_counter_app/view/screen/e_commerce_page.dart';
import 'package:reactive_getx_counter_app/view/screen/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
        ),
        GetPage(
          name: '/ecommerce',
          page: () => const ECommercePage(),
        ),
      ],
    );
  }
}
