import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class NetworkCatchImage extends StatelessWidget {
  var imagekey;
  String image;
  double height;
  double? width;
  BoxFit? boxfit;
  NetworkCatchImage(
      {required this.imagekey,
      required this.image,
      required this.height,
      this.width,
      this.boxfit = BoxFit.fitHeight,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CachedNetworkImage(
        key: Key(imagekey),
        imageUrl: image,
        imageBuilder: (context, imageProvider) => Container(
          width: width != null ? width : MediaQuery.of(context).size.width,
          height: height,
          //child: Image(image: imageProvider),
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider, fit: boxfit
                //colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                ),
          ),
        ),
        placeholder: (context, url) => SizedBox(
          height: height,
          child: Shimmer(
            duration: const Duration(seconds: 3), //Default value
            interval: const Duration(
                seconds: 0), //Default value: Duration(seconds: 0)
            color: const Color.fromARGB(255, 109, 105, 105), //Default value
            colorOpacity: 0, //Default value
            enabled: true, //Default value
            direction: const ShimmerDirection.fromLTRB(), //Default Value
            child: Container(
              color: const Color.fromARGB(255, 248, 248, 250),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          height: height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled-1150x647.png'))),
        ),
      ),
    );
  }
}
