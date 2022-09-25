import 'package:flutter/material.dart';

Widget currentWeather(
  IconData icon,
  String temp,
  String location,
  String climateDescription,
) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 64,
          color: Colors.orange,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          temp,
          style: const TextStyle(
            fontSize: 46,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          location,
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFF5a5a5a),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text('$climateDescription Climate'),
      ],
    ),
  );
}
