import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:iloveyoucleanwater/controllers/home/home_controller.dart';
import 'package:iloveyoucleanwater/models/library/library_detail_photo_model.dart';

import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:iloveyoucleanwater/views/shared/widgets/circle_button.dart';
import 'package:shimmer/shimmer.dart';

class LibraryDetailPhotoView extends StatelessWidget {
  final _Controller = Get.put(HomeController());
  final LibraryDetailPhotoModel news;
  final String title;
  final String datetime;
  LibraryDetailPhotoView(
      {required this.news, required this.title, required this.datetime});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 15.0, 18.0, 0),
              child: Row(
                children: [
                  CircleButton(
                    colors: kGrey1,
                    icon: Icons.arrow_back_ios,
                    onTap: () => Get.back(),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: [
            const SizedBox(height: 12.0),
            Container(
              height: 220.0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
                child: CachedNetworkImage(
                  imageUrl: (news.image.contains(Constants.URL_IMAGE)
                      ? news.image
                      : Constants.URL_IMAGE + news.image),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[400]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  fit: BoxFit.cover,
                ),
              ),

              // DecorationImage(
              //   image: (news.image.contains(Constants.URL_IMAGE)
              //       ? news.image
              //       : Constants.URL_IMAGE + news.image),
              //   fit: BoxFit.cover,
              // ),
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 15.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: kGrey3, width: 1.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),

                  // changeTabLibrary
                  child: InkWell(
                    onTap: () {
                      _Controller.changeTabLibraryDetail(3, 0);
                    },
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 5.0,
                          backgroundColor: kGrey3,
                        ),
                        const SizedBox(width: 6.0),
                        Text(
                          title,
                          style: kCategoryTitle,
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Status(
                  icon: Icons.remove_red_eye,
                  total: news.view.toString(),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Text(
              news.title,
              style: kTitleCard,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                const SizedBox(width: 3.0),
                const Icon(
                  Icons.date_range,
                  color: kGrey1,
                ),
                const SizedBox(width: 5.0),
                Expanded(
                    child: Text(
                        calculateTimeDifferenceBetween(stringTime: datetime),
                        style: kDetailContent,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1))
              ],
            ),
            Html(
              data: news.content,
              style: {
                "p": Style(
                  textAlign: TextAlign.justify,
                ),
                "img": Style(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.7)
              },
            ),
            const SizedBox(height: 15.0),
            Column(
              children: List.generate(news.listImages.length, (index) {
                var image = news.listImages[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Container(
                    height: 220.0,
                    child: CachedNetworkImage(
                      imageUrl: (image.link.contains(Constants.URL_IMAGE)
                          ? image.link
                          : Constants.URL_IMAGE + image.link),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[400]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 25.0)
          ],
        ),
      ),
    );
  }
}

class Status extends StatelessWidget {
  final IconData icon;
  final String total;
  Status({required this.icon, required this.total});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: kGrey2),
        const SizedBox(width: 4.0),
        Text(total, style: kDetailContent),
      ],
    );
  }
}
