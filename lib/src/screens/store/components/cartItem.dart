import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String image;
  final String tagline;
  final String price;
  const CartItem(
      {Key? key,
      required this.image,
      required this.tagline,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      /// mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          image,
          fit: BoxFit.contain,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                tagline,
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                price,
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
