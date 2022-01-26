import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:task_api/database_utils/database_helper.dart';
import 'package:task_api/model/loading_model.dart';
import 'package:task_api/model/surahdetail_model.dart';
import 'package:task_api/model/surahlist_model.dart';

class LoadingPageController extends GetxController {
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    getAyaatTranslation();
  }

  Future getQuranAyaatData() async {
    var response = await Dio().get("http://api.alquran.cloud/v1/surah");
    final list = List<DataModelList>.from(
        response.data["data"].map((e) => DataModelList.fromJson(e)));
    await _insertSurah(list);

    for (int i = 1; i <= list.length; i++) {
      var response = await Dio().get("http://api.alquran.cloud/v1/surah/$i");
      final listayaat = List<Ayah>.from(
          response.data["data"]["ayahs"].map((e) => Ayah.fromJson(e)));
      await _insertAyaat(listayaat, i);
    }
  }

  Future<void> _insertSurah(List<DataModelList> datamodel) async {
    for (DataModelList dataModelList in datamodel) {
      SurahModel surahmodel = SurahModel(
          name: dataModelList.name,
          englishname: dataModelList.englishName,
          englishNameTranslation: dataModelList.englishNameTranslation,
          numberOfAyahs: dataModelList.numberOfAyahs);
      int result = await databaseHelper.insertSurah(surahmodel);
      print(result);
    }
  }

  Future<void> _insertAyaat(List<Ayah> ayahmodel, int surahId) async {
    for (Ayah dataModelList in ayahmodel) {
      AyaatModel ayaatModel = AyaatModel(
        surahId: surahId,
        text: dataModelList.text,
        isFavourite: 0,
      );

      await databaseHelper.insertAyaat(ayaatModel);
    }
  }

  Future getAyaatTranslation() async {
    for (int j = 1; j <= 114; j++) {
      var response =
          await Dio().get("http://api.alquran.cloud/v1/surah/$j/en.asad");
      final listayaat = List<Ayah>.from(
          response.data["data"]["ayahs"].map((e) => Ayah.fromJson(e)));
      await insertAyatTranslation(listayaat);
    }
  }

  Future<void> insertAyatTranslation(List<Ayah> ayaatTranslation) async {
    for (Ayah dataModelList in ayaatTranslation) {
      int number = await databaseHelper.getAyatTranslation(
          dataModelList.text, dataModelList.number);
      print(number);
    }
  }
}
