import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';

class CarouselItemWidget extends StatelessWidget {
  final String? imageData;

  const CarouselItemWidget({super.key, required this.imageData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppThemeExt.of.majorScale(4),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          AppThemeExt.of.majorScale(4),
        ),
        child: Image.network(
          imageData!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
