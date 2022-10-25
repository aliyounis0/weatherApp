

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

  class weatherService {
    String baseurl ="http://api.weatherapi.com/v1";
    String apikey="3f6d1f5bed9840b18da161230222110";


  Future<weatherModel?> getWeather({required String nameCity}) async
  {
    weatherModel? weather;
   try{
     Uri url = Uri.parse('$baseurl/forecast.json?key=$apikey&q=$nameCity&day=5');
     http.Response response= await http.get(url);
     Map<String,dynamic> data=jsonDecode(response.body);
     weather =weatherModel.fromJsone(data);
   }catch(e){
     print(e);
   }
   return weather;
  }

  }

