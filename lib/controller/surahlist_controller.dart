import 'dart:async';
import 'package:get/get.dart';
import 'package:task_api/database_utils/database_helper.dart';
import 'package:task_api/model/loading_model.dart';

class SurahController extends GetxController {
  RxList<SurahModel> surah = RxList<SurahModel>();
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    getQuranAyaatData();
  }

  Future getQuranAyaatData() async {
    final list = await _databaseHelper.getSurah();
    surah.addAll(list);
  }

  Future getSurahNameData(String englishname) async {
    final list = await _databaseHelper.getSurahName(englishname);
    surah.assignAll(list);
  }
}
