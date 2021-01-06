import 'dart:io';

import 'package:engineering_thesis/ui/components/custom_widgets/icon/custom_icon.dart';
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
      return getAvatar(
        image: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: photoUrl,
          imageErrorBuilder: (context, error, stackTrace) {
            if (errorWidget != null) return errorWidget;
            return fromIcon(CustomIcon.closeScreen, diameter);
          },
        ),
        diameter: diameter,
      );

    return fromIcon(CustomIcon.person, diameter);
  }

  static Widget fromFile(File imageFile, double diameter) {
    if (imageFile != null)
      return getAvatar(image: Image.file(imageFile), diameter: diameter);

    return fromIcon(CustomIcon.person, diameter);
  }

  static Widget fromIcon(Widget customIcon, double diameter) {
    return getAvatar(image: customIcon, diameter: diameter);
  }

  static Widget getAvatar({@required Widget image, @required double diameter}) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black87,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(diameter / 2),
        child: image,
      ),
    );
  }
}
