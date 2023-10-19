import 'dart:convert';

import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';

class DataImageWidget extends StatelessWidget {
  final String? imageData;
  final double? width;
  final double? height;
  final BorderRadius borderRadius;

  const DataImageWidget({
    super.key,
    required this.imageData,
    this.width,
    this.height,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.of.grayColor[300],
        ),
        child: imageData == null
            ? null
            : Image.memory(
                base64Decode(imageData!),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
