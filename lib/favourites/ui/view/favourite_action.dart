import 'package:civstart/app/app.dart';
import 'package:flutter/material.dart';

class FavouriteAction extends StatelessWidget {
  const FavouriteAction({
    required this.isFavourited,
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  final bool isFavourited;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: CivColors.pink,
      icon: isFavourited ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
    );
  }
}
