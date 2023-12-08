// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:test1/getx/coin_model.dart';

class GetXItemWidget extends StatelessWidget {
  final CoinModel model;

  const GetXItemWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(model.image),
      title: Text(
        model.getDisplayName(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        model.getCurrentPrice(),
        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
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
            style:
                const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
