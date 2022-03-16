import 'package:flutter/material.dart';
import './iller.dart';
import 'get_data.dart';
import 'main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cityName = "İstanbul";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Sehır Seçin"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: liste.length,
          itemBuilder: (context, int index) {
            if (index % 2 == 0) {
              return Card(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueGrey[100])),
                  onPressed: () async {
                    setState(() {
                      cityName = liste[index].name.toString();
                    });
                    WeatherData weatherData = WeatherData(cityName: cityName);
                    await weatherData.getCurrentWeather();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainPage(
                                cityName,
                                weatherData.currentTemperature,
                                weatherData.weatherId)));
                  },
                  child: ListTile(
                    leading: Text(liste[index].plaka.toString()),
                    title: Text(liste[index].name.toString()),
                  ),
                ),
              );
            } else {
              return Card(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.white24)),
                  onPressed: () async {
                    setState(() {
                      cityName = liste[index].name.toString();
                    });
                    WeatherData weatherData = WeatherData(cityName: cityName);
                    await weatherData.getCurrentWeather();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainPage(
                                cityName,
                                weatherData.currentTemperature,
                                weatherData.weatherId)));
                  },
                  child: ListTile(
                    leading: Text(liste[index].plaka.toString()),
                    title: Text(liste[index].name.toString()),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
