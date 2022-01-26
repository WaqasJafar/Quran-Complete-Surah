// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:task_api/pages/pagenot_found.dart';
import 'package:task_api/routes/app_pages.dart';
import 'package:task_api/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: AppPages.pages,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashpage,
      unknownRoute: GetPage(
          name: AppRoutes.pagenotfound, page: () => const PageNotFound()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Quran Surah App",
          style: TextStyle(
              fontFamily: "Noorehira",
              fontSize: 25.0,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[900],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 0.0, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Holy Quran",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Times New Roman",
                  color: Colors.green[900]),
            ),
            Center(
              child: Hero(
                tag: "profile-image",
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://i1.sndcdn.com/avatars-bceQcm9xz03JpQy1-ynjC6Q-t500x500.jpg"),
                  radius: 150.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 25),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green[900]),
              ),
              onPressed: () {
                Get.toNamed(AppRoutes.surahlist);
              },
              child: Text(
                "Quran Surah List ",
                style: TextStyle(fontSize: 25.0, fontFamily: "Noorehira"),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green[900]),
              ),
              onPressed: () {
                Get.toNamed(AppRoutes.surahlist);
              },
              child: Text(
                "Bookmark Ayaat  ",
                style: TextStyle(fontSize: 25.0, fontFamily: "Noorehira"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
