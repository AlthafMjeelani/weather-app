class Weather {
  final List<WeatherData> weather;
  final Main main;
  final Wind wind;
  final Sys sys;
  final String name;

  Weather({
    required this.weather,
    required this.main,
    required this.wind,
    required this.sys,
    required this.name,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      weather: List<WeatherData>.from(
        json['weather'].map((e) => WeatherData.fromJson(e)),
      ),
      main: Main.fromJson(json['main']),
      wind: Wind.fromJson(json['wind']),
      sys: Sys.fromJson(json["sys"]),
      name: json["name"] ?? 'No Name',
    );
  }

  Map<String, dynamic> toJson() => {
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "name": name,
      };
}

class WeatherData {
  final String main;
  final String description;
  final String icon;

  WeatherData({
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      main: json['main'] ?? 'No main',
      description: json['description'] ?? 'No Descreption',
      icon: json['icon'] ?? 'No Icone',
    );
  }

  Map<String, dynamic> toJson() => {
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Main {
  final num temp;
  final num feelsLike;
  final num tempMin;
  final num tempMax;
  final num pressure;
  final num humidity;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json["temp"].toDouble() ?? 'No data',
      feelsLike: json["feels_like"].toDouble() ?? 'No data',
      tempMin: json["temp_min"].toDouble() ?? 'No data',
      tempMax: json["temp_max"] ?? 'No data',
      pressure: json["pressure"] ?? 'No data',
      humidity: json["humidity"] ?? 'No data',
    );
  }
}

class Wind {
  final num speed;

  Wind({
    required this.speed,
  });
  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'] ?? 'No Country',
    );
  }
}

class Sys {
  final String country;

  Sys({
    required this.country,
  });

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      country: json['country'] ?? 'No Country',
    );
  }
}
