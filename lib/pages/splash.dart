import 'package:flutter/material.dart';
import 'package:task_api/main.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.network(
          'https://w0.peakpx.com/wallpaper/394/121/HD-wallpaper-quraan-beautiful-blak-dark-islamic-muslims-quran-red.jpg',
          fit: BoxFit.cover,
        ),
      ),


    );

  }
}