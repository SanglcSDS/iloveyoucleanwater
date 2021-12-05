import 'package:flutter/material.dart';
import 'package:iloveyoucleanwater/service/news.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class NewWidgetView extends StatelessWidget {
  final News news;
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.0),
              image: DecorationImage(
                image: NetworkImage(news.image),
                fit: BoxFit.cover,
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
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: kTitleCard,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    news.subtitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: kDetailContent,
                  ),
                  const Spacer(),
                  Row(
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
