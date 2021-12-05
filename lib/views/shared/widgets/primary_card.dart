import 'package:flutter/material.dart';
import 'package:iloveyoucleanwater/service/news.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class PrimaryCard extends StatelessWidget {
  final News news;
  PrimaryCard({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: kGrey3, width: 1.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Hero(
              tag: news.seen,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: NetworkImage(news.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Text(
              news.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: kTitleCard,
            ),
          ),
          const SizedBox(height: 5.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(news.category,
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
                    child: Text(news.time,
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
