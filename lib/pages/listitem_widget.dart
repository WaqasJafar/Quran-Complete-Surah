import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:share/share.dart';
import 'package:task_api/controller/bookmarkpage_controller.dart';
import 'package:task_api/controller/surahdetail_controller.dart';
import 'package:task_api/model/loading_model.dart';
import 'package:task_api/routes/app_routes.dart';

class ListitemWidget extends StatelessWidget {
  String text;
  String ayaatdetail;
  String translation;
  int surahId;
  int isFavourite;
  SurahModel surahs;
  BookMarkController markcontroller;
  SurahDetailController controller;
  int index;
  ScaffoldState _scaffoldKey;
  String mark;
  final VoidCallback onupdatemark;
  String name;

  ListitemWidget({Key scaffoldKey,
    this.mark,
    this.translation,
    this.surahId,
    this.isFavourite,
    this.surahs,
    this.markcontroller,
    this.index,
    this.ayaatdetail,
    this.controller,
    this.name,
    this.text,
    this.onupdatemark})
      : super(key: scaffoldKey);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "${text}",
                  style: TextStyle(
                      fontFamily: "noorehira.ttf",
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.right,
                ),
                subtitle: Column(
                  children: [
                    Text(
                      "${translation}",
                      style: TextStyle(
                          fontFamily: "noorehira.ttf",
                          fontSize: 20.0,
                          color: Colors.black),
                    ),


                  ],
                ),
                onTap: () {
                  Get.toNamed(AppRoutes.surahdetail,
                      arguments: surahs == surahId - 1);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon:
                    Icon(isFavourite == 0 ? Icons.star_border : Icons.star),
                    onPressed: onupdatemark,
                  ),
                  SizedBox(
                    width: 70.0,
                  ),
                  IconButton(
                      icon: Icon(Icons.copy),
                      onPressed: () {
                        controller.ayahdetail;
                        _copyToClipboard(text + translation);
                      }),
                  SizedBox(
                    width: 70.0,
                  ),
                  IconButton(
                    icon: Icon(Icons.share),
                    onPressed: () {
                      Share.share(text + translation);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text("Selected Text is Copied")));
  }
}
