import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iloveyoucleanwater/models/news/news_model.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:shimmer/shimmer.dart';

class HomeItemNewsWidgetView extends StatelessWidget {
  final NewModel news;
  HomeItemNewsWidgetView({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 7.0),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(5.0),
      //     border: Border.all(color: kGrey3, width: 1.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            height: 135.0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(5), topLeft: Radius.circular(5)),
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
          )),
          const SizedBox(height: 5.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
            child: Text(
              news.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: kTitleCard1,
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
            child: Text(
              news.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: kDetailContent,
            ),
          ),
          const SizedBox(height: 5.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 9.0, vertical: 15.0),
            child: Row(
              children: [
                const SizedBox(width: 5.0),
                const CircleAvatar(
                  radius: 5.0,
                  backgroundColor: kGrey1,
                ),
                const SizedBox(width: 10.0),
                Expanded(
                    child: Text(news.createdAt,
                        style: kDetailContent,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1))
              ],
            ),
          )
        ],
      ),
    );
  }
}
