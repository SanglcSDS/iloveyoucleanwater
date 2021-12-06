import 'package:flutter/material.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:get/get.dart';

class BannerHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.only(top: 5),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bgmain1.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(
                    top: 0, right: 5, left: 80, bottom: 0),
                child: const Text(
                  "Chương trình “Mizuiku” là sáng kiến tuyên truyền, giáo dục ý thức bảo vệ tài nguyên nước cho học sinh bậc tiểu học được khởi xướng bởi Tập đoàn Suntory và đã triển khai thành công tại Nhật Bản từ năm 2004. Đến nay, chương trình đã thu hút sự tham gia của trên 154 nghìn học sinh tiểu học và phụ huynh, nhận được đánh giá cao từ cộng đồng và xã hội Nhật Bản.",
                  style: TextStyle(color: kGrey1),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Positioned(
              child: Container(
                  alignment: Alignment.center,
                  child: FlatButton(
                    height: 20,
                    color: Colors.blue[300],
                    child: Text(
                      'detail'.tr,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.blue)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
