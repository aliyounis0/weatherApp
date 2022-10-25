import 'package:flutter/material.dart';

class weatherModel{
 DateTime date;
 double temp;
 double maxTemp;
 double minTemp;
 String weatherState;
 String cityName;

weatherModel({
  required this.date,
  required this.temp,
  required this.maxTemp,
  required this.minTemp,
  required this.weatherState,
  required this.cityName,
});

factory weatherModel.fromJsone(dynamic jsone)
{
  var jsonePro=jsone['forecast']['forecastday'][0]['day'];
  return weatherModel(
      date: DateTime.parse(jsone['location']['localtime']),
      temp: jsonePro['avgtemp_c'],
      maxTemp: jsonePro['maxtemp_c'],
      minTemp: jsonePro['mintemp_c'],
      weatherState: jsonePro['condition']['text'],
      cityName: jsone['location']['name'],
  );
}

String? getImage(){
  if(weatherState == 'clear'|| weatherState=='Light Cloud'){
    return 'assets/images/clear.png';
  }
  else if(weatherState == 'Sleet'|| weatherState=='Snow'||weatherState=='Hail'){
    return 'assets/images/snow.png';
  }
  else if(weatherState == 'Heavy Cloud'){
    return 'assets/images/cloudy.png';
  }
  else if(weatherState == 'Light Rain'|| weatherState=='Heavy rain'||weatherState=='Showers'){
    return 'assets/images/rainy.png';
  }
  else if(weatherState == 'ThanderStorm'|| weatherState == 'Thander'){
    return 'assets/images/thunderstorm.png';
  }
  else {
  return 'assets/images/clear.png';
  }
}

 MaterialColor getTheme(){
   if(weatherState == 'clear'|| weatherState=='Light Cloud'){
     return Colors.amber;
   }
   else if(weatherState == 'Sleet'|| weatherState=='Snow'||weatherState=='Hail'){
     return Colors.blue;
   }
   else if(weatherState == 'Heavy Cloud'){
     return Colors.blueGrey;
   }
   else if(weatherState == 'Light Rain'|| weatherState=='Heavy rain'||weatherState=='Showers'){
     return Colors.grey;
   }
   else if(weatherState == 'ThanderStorm'|| weatherState == 'Thander'){
     return Colors.blueGrey;
   }
   else {
     return Colors.amber;
   }
 }



}