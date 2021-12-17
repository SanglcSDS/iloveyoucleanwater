import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iloveyoucleanwater/models/news/news_model.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:shimmer/shimmer.dart';

class NewWidgetView extends StatelessWidget {
  final NewModel news;
  NewWidgetView({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: kGrey3,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 100.0,
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
                width: 1000,
              ),
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: kTitleCard,
                  ),
                  const SizedBox(height: 4.0),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(
                        Icons.date_range,
                        color: kGrey1,
                      ),
                      const SizedBox(width: 5.0),
                      Expanded(
                          child: Text(
                              calculateTimeDifferenceBetween(
                                  stringTime: news.createdAt),
                              style: kDetailContent,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
