import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controllers/global_controllers.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {

  String city = "";
  DateTime date = DateTime.now();
  final GlobalController globalController = 
  Get.put(GlobalController(),permanent: true);

  @override
  void initState(){
    getAddress(globalController.getLattitude().value,
    globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
   List<Placemark> placemark = 
    await placemarkFromCoordinates(lat, lon);
    Placemark place = placemark[0];
    setState(() {
      city = place.locality!;
    });
  } 
  @override

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
      margin: const EdgeInsets.only(
        left: 20,
         right: 20),
         alignment: Alignment.topLeft,
      child: Text(city,
      style: const TextStyle(
        fontSize: 35,
        height: 2,
      ),
      ),
        ),
          Container(
      margin:  const EdgeInsets.only(
        left: 20,
         right: 20, bottom: 20,
         ),
         alignment: Alignment.topLeft,
      child: Text(city,
      style:   TextStyle(
        fontSize: 15,
        color: Colors.grey[700],
        height: 1.5,
      ),
      ),
        ),
        ],
    );
  }
}