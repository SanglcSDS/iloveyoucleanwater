import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class TitleWidgetView extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  TitleWidgetView({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 0.0, top: 0, bottom: 0, right: 0.0),
        child: ElevatedButton(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 9,
                child: Text(title, style: kNonActiveTabStyles),
              ),
              const Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: null,
                    alignment: Alignment.centerRight,
                    icon: Icon(Icons.arrow_forward_ios, color: kBlue1),
                  )),
            ],
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.white;
                }
                return Colors.white;
              },
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

class TitleWidgetNextView extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  TitleWidgetNextView({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: ElevatedButton(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 9,
                  child: Text(
                    title,
                    style: kNonActiveTabStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: null,
                      alignment: Alignment.centerRight,
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: kGrey1,
                        size: 15,
                      ),
                    )),
              ],
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return kGrey3;
                  }
                  return Colors.white;
                },
              ),
            ),
            onPressed: onPressed,
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
    );
  }
}
