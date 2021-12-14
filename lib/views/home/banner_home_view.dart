import 'package:flutter/material.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/models/introduce/introduce_model.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:get/get.dart';

class BannerHomeView extends StatelessWidget {
  final _Controller = Get.put(HomeController());
  late IntroduceModel introduceModel;
  BannerHomeView({required this.introduceModel});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.0,
      width: double.infinity,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(
                    top: 10, right: 10, left: 10, bottom: 0),
                child: Text(
                  introduceModel.description,
                  style: TextStyle(color: kGrey1),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Positioned(
              child: Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  alignment: Alignment.center,
                  child: FlatButton(
                    height: 20,
                    color: Colors.blue[300],
                    child: Text(
                      'detail'.tr,
                      style: const TextStyle(
                        color: kGrey3,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      _Controller.changeTabIndex(2);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue[200]!)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
