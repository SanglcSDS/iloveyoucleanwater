import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/learning/comments_controller.dart';
import 'package:iloveyoucleanwater/models/learning/comment.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class CommentView extends StatelessWidget {
  final commentController = Get.put(CommentController());
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommentController>(
      init: CommentController(),
      builder: (_) => SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(child: _rederListComment(commentController.comments)),
            Theme(
              data: ThemeData(primarySwatch: kPrimaryMaterial),
              child: TextField(
                controller: textController,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(
                  hintText: "Type a messages...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () => {
                      commentController.writeComment(textController.text),
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

  Widget _rederListComment(List<Comment> comments) {
    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return TextMessage(
          comment: comments[index],
        );
      },
    );
  }
}

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    this.comment,
  }) : super(key: key);

  final Comment? comment;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage("assets/images/avatar-user-default.png"),
      ),
      title: Container(
        margin: const EdgeInsets.only(left: 10),
        child: Text(comment!.comment),
      ),
      subtitle: Container(
        margin: const EdgeInsets.only(left: 10),
        child: Text(comment!.time),
      ),
    );
  }
}
