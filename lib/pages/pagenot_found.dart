import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_api/routes/app_routes.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Page Not Found",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green[900]),
                ),
                onPressed: () {
                  Get.offAllNamed(AppRoutes.splash);
                },
                child: Text("Back To Home"))
          ],
        ),
      ),
    );
  }
}
