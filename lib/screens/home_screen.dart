

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controllers/global_controllers.dart';
import 'package:weatherapp_starter_project/widgets/header_widjet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  // Чакыруу
  final GlobalController globalController =
   Get.put(GlobalController(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      body: SafeArea(
       child: Obx(() => globalController.
       checkloading().isTrue ? 
       const Center(
        child: CircularProgressIndicator(

        ),
       ):
       ListView(
        scrollDirection: Axis.vertical,
        children: const [
          SizedBox( height: 20,
          ),
             HeaderWidget(),
          ],
       ),
       ),
        ),
    );
  }
}