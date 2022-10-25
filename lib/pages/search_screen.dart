import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class searchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String? cityName;
    return Scaffold(
      appBar: AppBar(
        title: Text("Search A City"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (name){
                cityName=name;
              },
              onSubmitted: (name) async
              {
                cityName=name;
             weatherService service =weatherService();
             weatherModel? weather= await service.getWeather(nameCity: cityName!);
             Provider.of<weatherProvider>(context,listen: false).weatherData=weather;

             Navigator.pop(context);
              },
              decoration: InputDecoration(
                label:Text("Search") ,
                hintText: "Enter a city",
                suffixIcon: IconButton(
                  icon:Icon(Icons.search_outlined),
                  onPressed:() async
                  {
                    weatherService service =weatherService();
                    weatherModel? weather= await service.getWeather(nameCity:cityName!);
                    Provider.of<weatherProvider>(context,listen: false).weatherData=weather;

                    Navigator.pop(context);
                  } ,),
                contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 15,),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
