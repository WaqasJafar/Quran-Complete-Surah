// @dart=2.9
class SurahModel{
  int  id;
  String name;
  String englishname;
  String englishNameTranslation;
  int numberOfAyahs;
  SurahModel({
      this.id,
      this.name,
      this.englishNameTranslation,
      this.numberOfAyahs,
      this.englishname});

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['englishNameTranslation'] = englishNameTranslation;
    map['numberOfAyahs'] = numberOfAyahs;
    map['englishname'] = englishname;


    return map;
  }

  // Extract a Note object from a Map object
  SurahModel.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.englishname = map['englishname'];
    this.numberOfAyahs = map['numberOfAyahs'];
    this.englishNameTranslation =map['englishNameTranslation'];
  }
}




class AyaatModel{
  int  id;
  int surahId;
  String text;
  int isFavourite;
  String translation;

  AyaatModel({
    this.id,
    this.surahId,
    this.text,
    this.isFavourite,
    this.translation
  });

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['surahId'] = surahId;
    map['text'] = text;
    map['isFavourite'] = isFavourite;
    map['translation'] = translation;

    return map;
  }

  // Extract a Note object from a Map object
  AyaatModel.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.surahId = map['surahId'];
    this.text = map['text'];
    this.isFavourite = map['isFavourite'];
    this.translation =map['translation'];


  }
}


