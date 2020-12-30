import 'dart:io';

import 'package:flutter/material.dart';

class CustomUserAvatar {
  static Widget fromUrl(String photoUrl) {
    return Image.network(photoUrl);
  }

  static Widget fromFile(File photoFile) {
    return Image.file(photoFile);
  }

  static Widget fromIcon(Widget customIcon) {
    return customIcon;
  }
}
