// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test1/getx/coin_model.dart';

class GetXItemWidget extends StatelessWidget {
  final CoinModel model;

  const GetXItemWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  Widget _iconSlideAction(
      {String? caption, Color? color, IconData? icon, VoidCallback? onTap}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            caption ?? "",
            style: const TextStyle(color: Colors.white),
          ),
          Icon(
            icon,
            color: Colors.white,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(model.id ?? ""),
      background: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _iconSlideAction(
            caption: 'Archive',
            color: Colors.blue,
            icon: Icons.archive,
            onTap: () {},
          ),
          _iconSlideAction(
            caption: 'Share',
            color: Colors.red,
            icon: Icons.share,
            onTap: () => {},
          ),
        ],
      ),
      child: ListTile(
        leading: Card(
          shape: const CircleBorder(),
          elevation: 10,
          clipBehavior: Clip.antiAlias,
          surfaceTintColor: Colors.white,
          child: CachedNetworkImage(
            height: 60,
            width: 60,
            imageUrl: model.image ?? "",
          ),
        ),
        title: Text(
          model.getDisplayName(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          model.getCurrentPrice(),
          style:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              model.getHight24Hours(),
              style: const TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold),
            ),
            Text(
              model.getLow24Hours(),
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
