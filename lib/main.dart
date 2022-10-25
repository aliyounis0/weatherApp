import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context)=>weatherProvider(),
      child: WeatherApp()));
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:Provider.of<weatherProvider>(context).weatherData ==null?Colors.blue: Provider.of<weatherProvider>(context).weatherData!.getTheme() ,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}