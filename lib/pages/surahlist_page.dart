// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_api/controller/surahlist_controller.dart';
import 'package:task_api/database_utils/database_helper.dart';
import 'package:task_api/model/loading_model.dart';
import 'package:task_api/routes/app_routes.dart';

class SurahList extends StatelessWidget {
  SurahController controller = Get.put(SurahController());
  TextEditingController _textController = TextEditingController();
  DatabaseHelper databaseHelper = DatabaseHelper();
  final List =[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.bookmark),
            icon: Icon(Icons.bookmark),
          ),
        ],
        title: Text(
          "Surha List",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green[900],
      ),
      body: Column(
        children: [
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 10, 4, 4),
              child: TextField(
                controller: _textController,
                onChanged: (value) {
                  controller.getSurahNameData(value);
                },
                decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search Surah Name Here",
                  hintStyle: TextStyle(
                    color: Colors.green[900],
                    fontWeight: FontWeight.bold,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.green[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                  prefixIcon: Icon(Icons.search,
                      color: Colors.green[900],
                      size: 35.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green,width: 4.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),

                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.surah.length,
                itemBuilder: (BuildContext context, int index) {
                  SurahModel surah = controller.surah[index];
                  print(surah.toString());

                  return Column(
                    children: [
                      Card(
                        child: ListTile(
                          onTap: () {
                            Get.toNamed(AppRoutes.surahdetail,
                                arguments: surah);
                          },
                          title: Text(
                            surah.name,
                            style: TextStyle(
                                fontFamily: "noorehira.ttf",
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            surah.englishNameTranslation,
                          ),
                          trailing: Text(
                            surah.name,
                            style: TextStyle(
                              fontFamily: "Noorehira",
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                          leading: Text(surah.id.toString()),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
