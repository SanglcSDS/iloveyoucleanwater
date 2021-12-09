import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MsgDialog {
  static void showMsgDialogs(
      BuildContext context, String title, String msg, Function okFunction) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(MsgDialog),
            child: const Text('Cancel'),
          ),
          TextButton(
              onPressed: () => {
                    Navigator.of(context).pop(MsgDialog),
                    okFunction(),
                  },
              child: const Text('OK'))
        ],
      ),
    );
  }
}
