import 'package:flutter/material.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';
import 'package:shimmer/shimmer.dart';

class CarouselLoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: kGrey3,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: const BoxDecoration(
                color: kGrey1,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: kGrey1,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 8,
                width: 8,
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, color: kGrey3),
              ),
              const SizedBox(
                width: 3,
              ),
              Container(
                height: 8,
                width: 8,
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, color: kGrey3),
              ),
              const SizedBox(
                width: 3,
              ),
              Container(
                height: 8,
                width: 8,
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, color: kGrey3),
              ),
              const SizedBox(
                width: 3,
              ),
              Container(
                height: 8,
                width: 8,
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, color: kGrey3),
              ),
              const SizedBox(
                width: 3,
              ),
              Container(
                height: 8,
                width: 8,
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, color: kGrey3),
              ),
              const SizedBox(
                width: 3,
              ),
            ],
          )
        ],
      ),
    );
  }
}
