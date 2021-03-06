import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/models/news/category_news_modell.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class TitleWidgetNextView extends StatelessWidget {
  final _Controller = Get.put(HomeController());
  final CategoryNewsModel news;
  final int index;

  // final TabController onPressed;
  TitleWidgetNextView(
      {required this.news,

      // required this.onPressed,

      required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _Controller.changeTabNews(index, news.item);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1.0,
                  color: kGrey3,
                ),
              ),
            ),
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 9,
                    child: Text(
                      news.title.toUpperCase(),
                      style: kNonActiveTabStyles,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const Expanded(
                      flex: 1,
                      child: IconButton(
                        padding: EdgeInsets.only(left: 5),
                        onPressed: null,
                        alignment: Alignment.centerRight,
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: primaryColor,
                          size: 15,
                        ),
                      )),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1.0,
                  color: kGrey3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleWidgetNextPhotoVideo extends StatelessWidget {
  final _Controller = Get.put(HomeController());
  final String title;
  final int index;
  final int index1;
  TitleWidgetNextPhotoVideo(
      {required this.title, required this.index, required this.index1});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _Controller.changeTabLibrary(index, index1);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1.0,
                  color: kGrey3,
                ),
              ),
            ),
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 9,
                    child: Text(
                      title.toUpperCase(),
                      style: kNonActiveTabStyles,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: null,
                        padding: EdgeInsets.only(left: 5),
                        alignment: Alignment.centerRight,
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: primaryColor,
                          size: 15,
                        ),
                      )),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1.0,
                  color: kGrey3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
