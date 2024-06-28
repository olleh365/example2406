import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _WeatherScreen(),
    );
  }
}

class _WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<_WeatherScreen> {
  String weatherData = '';
  bool isLoading = false;

  void fetchWeather() async {
    setState(() {
      isLoading = true;
    });
    try {
      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=37.5511543&lon=126.9727751&appid=fe8f9cb8d0946ab928eea3124790e656');
      var response = await http.get(url);


      if (response.statusCode == 200) {
        setState(() {
          weatherData = response.body;
        });
      } else {
        setState(() {
          weatherData = '호출 실패 - Status Code: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        weatherData = '예외 발생: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if(isLoading)
                const CircularProgressIndicator()
              else
                Text(weatherData),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: fetchWeather,
                child: const Text('날씨 호출'),
              ),
            ],
          ),
        ),
      );
    }
  }
