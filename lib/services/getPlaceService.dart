import 'dart:convert';

import 'package:foster/models/personModel.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class LocationService{
  static final locationService = LocationService();
  
  static LocationService get(){
    return locationService;
  }

  final String detailUrl = "https://maps.googleapis.com/maps/api/place/details/json?key=[your_google_places_api_key_here]]&placeid=";

  final String url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=100000&key=AIzaSyBsXwqtg0ZLOw13Bh6uyJKHV4prnhLowqk";

  Future<List<PersonDetail>> getNearbyDoctors() async{
    var response = await http.get(url,headers:{"Accept":"application/json"});
    print(response.body);
    List data = json.decode(response.body)["results"];
    print(data);
    var doctors = <PersonDetail>[];
    data.forEach((element) { 
      doctors.add(PersonDetail(element["place_id"],element["name"],element["icon"],element["rating"].toString(),element["vicinity"]));
    });
    return doctors;
  }

  Future getDoctor(String place_id)async{
    var response = await http.get(detailUrl+place_id, headers:{"Accept":"application/json"});
    var result = json.decode(response.body)["result"];

    List<String> weekdays=[];
    if(result["opening_hours"]!=null){
    weekdays = result["opening_hours"]["weekday_text"];
    return new PersonDetail(
        result["place_id"],
        result["name"],
        result["icon"],
        result["rating"].toString(),
        result["vicinity"],
        result["formatted_address"],
        result["international_phone_number"],
        weekdays
    );
    }
  }

 



}