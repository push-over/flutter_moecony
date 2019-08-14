import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MTCacheNetworkImageWidget extends StatelessWidget {
  final String url;
  final double width;
  final double height;

  MTCacheNetworkImageWidget(
      {Key key,@required this.url, this.width, @required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return CachedNetworkImage(
      width: width ?? screenWidth,
      height: height,
      fadeOutDuration: const Duration(milliseconds: 300),
      fadeInDuration: const Duration(milliseconds: 700),
      fit: BoxFit.fill,
      imageUrl: url,
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
