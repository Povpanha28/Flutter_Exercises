import 'package:flutter/material.dart';

enum Cities {
  phnompenh(
    city: "Phnom Penh",
    minTemp: "10°C",
    maxTemp: "20°C",
    currTemp: "12.2°C",
    img: "assets/ex4/cloudy.png",
    colors: [Colors.lightBlue, Colors.blueAccent],
  ),
  paris(
    city: "Paris",
    minTemp: "10°C",
    maxTemp: "40°C",
    currTemp: "22.2°C",
    img: "assets/ex4/sunnyCloudy.png",
    colors: [Colors.deepOrange, Colors.orangeAccent],
  ),
  rome(
    city: "Rome",
    minTemp: "10°C",
    maxTemp: "40°C",
    currTemp: "45.2°C",
    img: "assets/ex4/sunny.png",
    colors: [Colors.orangeAccent, Colors.yellow],
  ),
  siemreap(
    city: "Siem Reap",
    minTemp: "10°C",
    maxTemp: "40°C",
    currTemp: "45.2°C",
    img: "assets/ex4/veryCloudy.png",
    colors: [Colors.deepPurple, Colors.purpleAccent],
  );

  final String city;
  final String minTemp;
  final String maxTemp;
  final String currTemp;
  final String img;
  final List<Color> colors;

  const Cities({
    required this.city,
    required this.minTemp,
    required this.currTemp,
    required this.maxTemp,
    required this.img,
    this.colors = const [Colors.purpleAccent, Colors.purple],
  });
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        body: Container(
          height: double.infinity,
          color: Colors.grey,
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: 15),
              WeatherCard(cities: Cities.phnompenh),
              SizedBox(height: 15),
              WeatherCard(cities: Cities.paris),
              SizedBox(height: 15),
              WeatherCard(cities: Cities.rome),
              SizedBox(height: 15),
              WeatherCard(cities: Cities.siemreap),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final Cities cities;
  const WeatherCard({super.key, required this.cities});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 0.8,
      borderRadius: BorderRadius.circular(5),
      shadowColor: Colors.black45,

      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: cities.colors,
              ),
            ),
            child: Column(
              children: [
                Row(
                  spacing: 10,
                  children: [
                    CircleAvatar(backgroundImage: AssetImage(cities.img)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cities.city,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Min ${cities.minTemp}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          "Max ${cities.maxTemp} ",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          Positioned(
            top: 20,
            right: 30,
            child: Text(
              cities.currTemp,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Positioned(
            top: -10,
            right: -40,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    cities.colors.first.withOpacity(0.3),
                    Colors.transparent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(80),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
