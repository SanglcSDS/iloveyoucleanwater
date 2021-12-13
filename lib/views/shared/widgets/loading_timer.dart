import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/loading_widgets.dart';

class LoadingDialog {
  static void showLoadingDialogTimer(
    BuildContext context,
  ) {
    late Timer _timer;
    showDialog(
        context: context,
        builder: (BuildContext builderContext) {
          _timer = Timer(Duration(seconds: 2), () {
            Navigator.of(context).pop();
          });

          return LoadingWidget();
        }).then((val) {
      if (_timer.isActive) {
        _timer.cancel();
      }
    });
  }
}
