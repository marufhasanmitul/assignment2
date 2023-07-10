import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeScreenUI();
  }
}
class HomeScreenUI extends State<HomeScreen>{


  Map<String,dynamic>weatherData={};
  var currentTime="${DateTime.now().hour} : ${DateTime.now().minute } ";

  bool inProgress=false;






  
  
  


  @override
  void initState() {
    super.initState();
    getWeather();

  }



  void getWeather() async{
    inProgress=true;

    setState(() {});

    Response response=await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=25.743893&lon=89.275230&appid=a2993c7860fc7adb9a695772714bbc81'));
    final Map<String, dynamic> decodeResponse = jsonDecode(response.body);


    if(response.statusCode==200){

       var currentLocation=decodeResponse['name'];
       var currentWeatherConditions=decodeResponse['weather'][0]['main'];
       var icon=decodeResponse['weather'][0]['icon'];
       var temperature=decodeResponse['main']['temp'];
       var mintemperature=decodeResponse['main']['temp_min'];
       var maxtemperature=decodeResponse['main']['temp_max'];

       weatherData["currentLocation"]=currentLocation;
       weatherData["currentWeatherConditions"]=currentWeatherConditions;
       weatherData["icon"]="https://openweathermap.org/img/wn/${icon}.png";
       weatherData["temperature"]=temperature-273.15;
       weatherData["mintemperature"]=mintemperature-273.15;
       weatherData["maxtemperature"]=maxtemperature-273.15;

       inProgress=false;
       if(mounted){
         setState(() {

         });
       }



    }

  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),

        actions: [
          Icon(Icons.settings),
          SizedBox(width: 10,),
          Icon(Icons.add),

        ],

      ),
      body:inProgress? Center(child: CircularProgressIndicator(),):
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.red,
                ]
            )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(weatherData['currentLocation'],style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),),
              SizedBox(height: 15),
              Text("Updated Time ${currentTime}",style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
              ),),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Image.network(weatherData["icon"],),
                  Text("${weatherData['temperature'].round()}°C ",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                  ),),
                  Column(
                    children: [
                      Text("Min temp :${weatherData['mintemperature'].round()}°C ",style: TextStyle(
                          color: Colors.white
                      ),),
                      SizedBox(height: 5,),
                      Text("Max temp :${weatherData['mintemperature'].round()}°C ",style: TextStyle(color: Colors.white),)
                    ],
                  ),


                ],
              ),
              SizedBox(height: 20,),
              Text(weatherData["currentWeatherConditions"],style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),)
            ],
          ),
        ),
      ),





    );
  }










}

