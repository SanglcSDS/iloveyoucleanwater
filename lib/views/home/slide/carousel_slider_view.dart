import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iloveyoucleanwater/models/home/banner_model.dart';

import 'package:iloveyoucleanwater/models/home/carousel.dart';
import 'package:iloveyoucleanwater/utils/constants.dart';

class CarouselSliderView extends StatefulWidget {
  final List<BannerModel> bannerList;
  const CarouselSliderView(this.bannerList);

  @override
  _CarouselSliderViewState createState() => _CarouselSliderViewState();
}

class _CarouselSliderViewState extends State<CarouselSliderView> {
  int _current = 0;
  late List<Widget> imageSlider;

  @override
  void initState() {
    imageSlider = widget.bannerList
        .map((e) => Container(
              margin: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: e.image,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                        ),
                      ),
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
                    // Positioned(
                    //   bottom: 0,
                    //   left: 0,
                    //   right: 0,
                    //   child: Container(
                    //     padding: const EdgeInsets.all(10),
                    //     child: const Text(
                    //       '',
                    //       style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 20,
                    //           fontWeight: FontWeight.bold),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider(
              items: imageSlider,
              options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  // enlargeCenterPage: true,
                  aspectRatio: 16 / 6,
                  viewportFraction: 1,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  })),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.bannerList.map((e) {
              int index = widget.bannerList.indexOf(e);
              return Container(
                width: 7,
                height: 7,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index ? kGrey3 : kBlue1,
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
