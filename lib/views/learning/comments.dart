import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/comments_controller.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class CommentView extends GetView<CommentController> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentController>(
      builder: (_) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => controller.comments!.isEmpty
                    ? SizedBox()
                    : ListView.builder(
                        itemCount: controller.comments!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  "assets/images/avatar-user-default.png"),
                            ),
                            title: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Text(controller.comments![index].content),
                            ),
                            subtitle: Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Text(controller.comments![index].name),
                            ),
                          );
                        },
                      ),
              ),
            ),
            Theme(
              data: ThemeData(primarySwatch: kPrimaryMaterial),
              child: TextField(
                controller: textController,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(
                  hintText: "comment_input".tr,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () => {
                      controller.writeComment(textController.text),
                      textController.clear(),
                      FocusScope.of(context).requestFocus(FocusNode())
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
