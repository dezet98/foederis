import 'dart:io';

import 'package:engineering_thesis/components/custom_widgets/icon/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CustomUserAvatar {
  static Widget fromUrl(
    context,
    String photoUrl, {
    @required double diameter,
    Widget errorWidget,
  }) {
    if (photoUrl != null)
      return Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(diameter / 2),
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: photoUrl,
            imageErrorBuilder: (context, error, stackTrace) {
              if (errorWidget != null) return errorWidget;
              return fromIcon(CustomIcon.closeScreen);
            },
          ),
        ),
      );

    return _nullImage(context);
  }

  static Widget fromFile(context, File imageFile) {
    if (imageFile != null) return Image.file(imageFile);

    return _nullImage(context);
  }

  static Widget fromIcon(Widget customIcon) {
    return customIcon;
  }

  static Widget _nullImage(context) => CustomIcon.person;
}
