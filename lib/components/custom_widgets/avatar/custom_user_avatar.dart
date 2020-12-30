import 'dart:io';

import 'package:engineering_thesis/components/custom_widgets/icon/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CustomUserAvatar {
  static Widget fromUrl(String photoUrl, {Widget errorWidget}) {
    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: photoUrl,
      imageErrorBuilder: (context, error, stackTrace) {
        if (errorWidget != null) return errorWidget;
        return fromIcon(CustomIcon.closeScreen(context));
      },
    );
  }

  static Widget fromFile(File imageFile) {
    return FadeInImage(
      image: FileImage(imageFile),
      placeholder: MemoryImage(imageFile.readAsBytesSync()),
    );
  }

  static Widget fromIcon(Widget customIcon) {
    return customIcon;
  }
}
