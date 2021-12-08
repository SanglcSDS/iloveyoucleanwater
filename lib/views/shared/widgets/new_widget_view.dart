import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iloveyoucleanwater/models/news/news_model.dart';
import 'package:iloveyoucleanwater/service/news.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:intl/intl.dart';

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
            width: 90.0,
            height: 135.0,
            child: CachedNetworkImage(
              imageUrl: (news.image.contains(Constants.URL_IMAGE)
                  ? news.image
                  : Constants.URL_IMAGE + news.image),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  backgroundColor: Colors.cyanAccent,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
              fit: BoxFit.cover,
              width: 1000,
            ),

            // DecorationImage(
            //   image: (news.image.contains(Constants.URL_IMAGE)
            //       ? news.image
            //       : Constants.URL_IMAGE + news.image),
            //   fit: BoxFit.cover,
            // ),
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
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: kTitleCard,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    news.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: kDetailContent,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: Text(news.categoryTitle,
                            style: kDetailContent,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1),
                      ),
                      const SizedBox(width: 10.0),
                      const CircleAvatar(
                        radius: 5.0,
                        backgroundColor: kGrey1,
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Text(news.createdAt,
                            style: kDetailContent,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1),
                      )
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
