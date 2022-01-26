// @dart=2.9
import 'package:get/get.dart';
import 'package:task_api/database_utils/database_helper.dart';
import 'package:task_api/model/loading_model.dart';

class BookMarkController extends GetxController {
  RxList<AyaatModel> bookmarkayaat = RxList<AyaatModel>();
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    getupdateMark();
  }

  Future getupdateMark() async {
    final list = await databaseHelper.getbookMark();
    bookmarkayaat.assignAll(list);
  }

  void updateMark(int index, AyaatModel ayaatModel) async {
    ayaatModel.isFavourite == 0
        ? ayaatModel.isFavourite = 1
        : ayaatModel.isFavourite = 0;
    bookmarkayaat[index] = ayaatModel;
    await databaseHelper.updateMark(ayaatModel);
    getupdateMark();
  }
}
