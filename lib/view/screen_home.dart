import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'package:weatherapp/service/exception.dart';
import 'package:weatherapp/service/weater_service.dart';
import 'package:weatherapp/view/screen_home_support.dart';
import 'package:weatherapp/view/screen_support.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFf9f9f9),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFf9f9f9),
          title: const Text(
            'Weather App',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<Weather>(
          future: WeatherService().getWeather(),
          builder: (BuildContext context, AsyncSnapshot<Weather> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return errorHandle(snapshot.error);
            } else if (snapshot.hasData) {
              if (snapshot.data == null) {
                return const Center(
                  child: Text('No Data'),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  currentWeather(
                    Icons.wb_sunny_rounded,
                    snapshot.data!.main.temp.toString(),
                    '${snapshot.data!.name}, ${snapshot.data!.sys.country}',
                    snapshot.data!.weather[0].description,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  addditionalInfirmation(
                    snapshot.data!.wind.speed.toString(),
                    snapshot.data!.main.humidity.toString(),
                    snapshot.data!.main.pressure.toString(),
                    snapshot.data!.main.feelsLike.toString(),
                  ),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.none) {
              return const Center(
                child: Text('Server is down, please try again Later'),
              );
            } else {
              return const Center(
                child: Text('Something Error'),
              );
            }
          },
        ),
      ),
    );
  }

  errorHandle(error) {
    if (error is NetWorkException) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error.massage),
            IconButton(
              onPressed: () async {
                try {
                  await WeatherService().getWeather();
                } catch (e) {
                  log(e.toString());
                }
                setState(() {});
              },
              icon: const Icon(Icons.refresh_outlined),
            )
          ],
        ),
      );
    } else if (error is NoserviceException) {
      return Center(
        child: Text(error.massage),
      );
    }
    if (error is ConnectionTimeOutException) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(error.massage),
            IconButton(
              onPressed: () async {
                try {
                  await WeatherService().getWeather();
                } catch (e) {
                  log(e.toString());
                }
                setState(() {});
              },
              icon: const Icon(Icons.refresh_outlined),
            )
          ],
        ),
      );
    } else if (error is BadRequestException) {
      return Center(
        child: Text(error.massage),
      );
    } else if (error is UnAuthirizedException) {
      return Center(
        child: Text(error.massage),
      );
    } else if (error is NoteFound) {
      return Center(
        child: Text(error.massage),
      );
    } else if (error is FetchDataException) {
      return Center(
        child: Text(error.massage),
      );
    } else {
      return Center(
        child: Text(
          error.toString(),
        ),
      );
    }
  }
}
