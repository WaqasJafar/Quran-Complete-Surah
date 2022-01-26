import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:task_api/database_utils/database_helper.dart';
import 'package:task_api/model/loading_model.dart';

class SurahDetailController extends GetxController {
  RxList<AyaatModel> ayahdetail = RxList<AyaatModel>();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  String title = "";
  int surahdata;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      SurahModel dataModelList = Get.arguments;
      print(dataModelList.id.toString());
      title = dataModelList.name;
      getSurahDetail(dataModelList.id);
      surahdata = dataModelList.id;
    }
  }

  Future getSurahDetail(int index) async {
    final list = await _databaseHelper.getSurahAyat(index);
    ayahdetail.addAll(list);
  }

  Future getAyatTranslation(String text, int id) async {
    final list = await _databaseHelper.getAyatTranslation(text, id);
    // ayahdetail.addAll(list);
  }

  void updateMark(int index, AyaatModel ayaatModel) {
    ayaatModel.isFavourite == 0
        ? ayaatModel.isFavourite = 1
        : ayaatModel.isFavourite = 0;
    ayahdetail[index] = ayaatModel;
    _databaseHelper.updateMark(ayaatModel);
  }

  Future getSurahAyaatData(String translation) async {
    final list = await _databaseHelper.getSurahAyatData(translation, surahdata);
    ayahdetail.assignAll(list);
  }
}
