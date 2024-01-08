import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';


class GlobalController extends GetxController{
//// создаем различные переменные ........
final RxBool _isLoading = true.obs;
final RxDouble _lattitude = 0.0.obs;
final RxDouble _longitude = 0.0.obs;

////////////////////////////////
RxBool checkloading() => _isLoading;
RxDouble getLattitude() => _lattitude;
RxDouble getLongitude() => _longitude;


@override
void onInit(){
  if(_isLoading.isTrue){
   getLocation();
   }
  super.onInit();
}

  void getLocation() async{
    bool isServiceEnabled;
    LocationPermission locationPermission;
  isServiceEnabled = await Geolocator.isLocationServiceEnabled();
  if(!isServiceEnabled){
    return Future.error
    ("жайгашкан жер иштетилген эмес");
  }

 locationPermission = await Geolocator.checkPermission();
 if(locationPermission == LocationPermission.deniedForever){
   return Future.error
   ("жайгашкан жерди аныктоого уруксат биротоло четке кагылды");
 }
 else if(locationPermission == 
 LocationPermission.denied){
 locationPermission = 
 await Geolocator.requestPermission();
 if(locationPermission == 
 LocationPermission.denied){
  return Future.error
  ("жайгашкан жерди аныктоого уруксат берилбей жатат");
 }
 }

 // Текущее местоположение
 return await Geolocator.getCurrentPosition(
  desiredAccuracy: LocationAccuracy.high ).then((value) {
    //Кординаты высоты и долготы местоположение
    _lattitude.value = value.latitude;
    _longitude.value = value.longitude;
    _isLoading.value = false;
  });

  }



 
}