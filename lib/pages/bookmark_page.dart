import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_api/controller/bookmarkpage_controller.dart';
import 'package:task_api/controller/surahlist_controller.dart';
import 'package:task_api/model/loading_model.dart';
import 'package:task_api/pages/listitem_widget.dart';

class BookMark extends StatelessWidget {
  BookMarkController markcontroller = Get.put(BookMarkController());
  final List<SurahModel> surahs = Get.find<SurahController>().surah;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "BookMark Ayaat",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[900],
      ),
      body: Center(
        child: Obx(
          () => ListView.builder(
            itemCount: markcontroller.bookmarkayaat.length,
            itemBuilder: (BuildContext context, int index) {
              AyaatModel mark = markcontroller.bookmarkayaat[index];
              return ListitemWidget(
                text: mark.text,
                translation: mark.translation,
                surahId: mark.surahId,
                isFavourite: mark.isFavourite,
                index: index,
                onupdatemark: () =>
                    markcontroller.updateMark(index, mark),


              );
            },
          ),
        ),
      ),
    );
  }
}
