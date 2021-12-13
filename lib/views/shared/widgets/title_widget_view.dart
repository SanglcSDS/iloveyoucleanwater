import 'package:flutter/material.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class TitleWidgetNextView extends StatelessWidget {
  final String title;
  final int index;
  // final TabController onPressed;
  TitleWidgetNextView(
      {required this.title,

      // required this.onPressed,

      required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   onPressed.animateTo(index);
      // },
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
                        alignment: Alignment.centerRight,
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: kBlue1,
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
  final String title;
  final VoidCallback onPressed;
  TitleWidgetNextPhotoVideo({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed:
        onPressed;
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
                        alignment: Alignment.centerRight,
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: kBlue1,
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
