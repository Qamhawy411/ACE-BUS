import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController{
 LatLng _userlating = LatLng (25.354826, 51.183884);
  LatLng  get  getUserLating => _userlating;
  Future <void> userLocation()async{
    bool isDetails = await permission();
    if(isDetails){
      Position currentPos = await  Geolocator.getCurrentPosition();
        _userlating = LatLng(currentPos.altitude ,currentPos.longitude ) ;

   }}
        
     Future<bool>permission()async{
         LocationPermission permission  =  await   Geolocator.checkPermission();
      if(permission== LocationPermission.denied){
        permission= await Geolocator.requestPermission();
        if(permission== LocationPermission.denied){
          return false;
        }
        
      }

        bool service =  await Geolocator.isLocationServiceEnabled();
        if(!service){
          return false;
        }
        return true;   
     }
    

 Future<void>searchLocation(String address)async{
    bool isDone = await  permission();
    if(isDone){
   List<Location> searchedLocation = await locationFromAddress(address);
     _userlating= LatLng(searchedLocation[0].latitude, searchedLocation[0].longitude);
    }
}


}