import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:task_api/controller/surahdetail_controller.dart';
import 'package:task_api/controller/surahlist_controller.dart';
import 'package:task_api/database_utils/database_helper.dart';
import 'package:task_api/model/loading_model.dart';
import 'package:task_api/pages/listitem_widget.dart';

class SurahDetail extends StatelessWidget {
  SurahDetail({Key key}) : super(key: key);
  SurahDetailController controllers = Get.put(SurahDetailController());
  SurahController ayaatController = Get.put(SurahController());
  DatabaseHelper databaseHelper = DatabaseHelper();
  TextEditingController _textController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          controllers.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
        centerTitle: true,
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
                onChanged: (translation) {
                  controllers.getSurahAyaatData(
                      translation);
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
                  size: 35.0,),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.green,width: 4.0
                    ),
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
                itemCount: controllers.ayahdetail.length,
                itemBuilder: (BuildContext context, int index) {
                  AyaatModel ayaatdetail = controllers.ayahdetail[index];

                  return ListitemWidget(
                    text: ayaatdetail.text,
                    translation: ayaatdetail.translation,
                    surahId: ayaatdetail.surahId,
                    isFavourite: ayaatdetail.isFavourite,
                    controller: controllers,
                    onupdatemark: () =>
                        controllers.updateMark(index, ayaatdetail),
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
