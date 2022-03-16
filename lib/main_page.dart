import 'package:flutter/material.dart';

import 'icon.dart';

class MainPage extends StatefulWidget {
  final String? currentCity;
  final double? currentTemperature;
  final String? iconId;
  const MainPage(this.currentCity, this.currentTemperature, this.iconId,
      {Key? key})
      : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Icon? currentIcon;

  void chooseIcon(String idIcon, int temperature) {
    int id = int.parse(idIcon);
    if (id == 800) {
      if (temperature < 7) {
        currentIcon = kBulutlu;
      } else {
        currentIcon = kGunesli;
      }
    } else if (id > 800) {
      currentIcon = kBulutlu;
    } else if (id > 600 && id < 700) {
      currentIcon = kKarli;
    } else if (id > 500 && id < 600) {
      currentIcon = kYagmurlu;
    } else if (id > 300 && id < 400) {
      currentIcon = kAzYagmurlu;
    } else if (id > 600 && id < 700) {
      currentIcon = kKarli;
    } else {
      currentIcon = kRuzgar;
    }
  }

  @override
  Widget build(BuildContext context) {
    chooseIcon(widget.iconId.toString(), widget.currentTemperature!.toInt());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Hava durumu"),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.green,
                Colors.blueAccent,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 65,
              ),
              currentIcon as Icon,
              const SizedBox(
                height: 25,
              ),
              Center(
                child: Text(
                  " ${widget.currentTemperature.toString()}°",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 60, color: Colors.white, letterSpacing: 2),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                widget.currentCity.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 30, color: Colors.white, letterSpacing: 5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
