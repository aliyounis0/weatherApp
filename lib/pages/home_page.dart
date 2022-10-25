

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/pages/search_screen.dart';

import '../providers/weather_provider.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weather=Provider.of<weatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
              onPressed: ()
              {
                Navigator.push(context, MaterialPageRoute(builder:(context)=>searchScreen()),);
              },
              icon:Icon(Icons.search_outlined) ,
          ),
        ],
      ),

      body:weather ==null?
      Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ) :
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              weather.getTheme(),
              weather!.getTheme()[300]!,
              weather!.getTheme()[100]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
          child: Column(
       mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Spacer(flex: 3,),
          Text(weather!.cityName,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,

            ),),
          Text('Updated at: ${weather.date.hour.toString()}:${weather.date.minute.toString()}',
            style: TextStyle(
              fontSize: 18,
            ),),
          Spacer(flex: 1,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              Image.asset('${weather!.getImage()}'),
              Text('${weather.temp.toInt()}',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,

                ),),
              Column(
                children: [
                  Text('maxTep: ${weather!.maxTemp.toInt()}',
                    style: TextStyle(
                    fontSize: 15,
                  ),),
                  Text('minTemp: ${weather!.minTemp.toInt()}',
                    style: TextStyle(
                      fontSize: 15,
                    ),),
                ],
              ),
            ],
          ),
          Spacer(flex: 1,),
          Text(weather?.weatherState ?? "",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,

            ),),
          Spacer(flex: 5,)
        ],
      )),
    );
  }
}
