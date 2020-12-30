import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomIcon {
  static Widget cropFile(context) =>
      _buildPlatformIcon(Icons.crop, CupertinoIcons.crop);

  static Widget datePicker(context) => Icon(PlatformIcons(context).time);

  static Widget refresh(context) => Icon(PlatformIcons(context).refresh);

  static Widget add(context) => Icon(PlatformIcons(context).add);

  static Widget back(context) => Icon(PlatformIcons(context).back);

  static Widget userAvatar(context) =>
      Icon(PlatformIcons(context).personOutline);

  /// use for clear data in form
  static Widget clear(context) => Icon(PlatformIcons(context).clear);

  static Widget map(context) =>
      _buildPlatformIcon(Icons.map, CupertinoIcons.map);

  static Widget list(context) =>
      _buildPlatformIcon(Icons.list_alt, CupertinoIcons.list_bullet);

  /// use for close screens
  static Widget closeScreen(context) =>
      _buildPlatformIcon(Icons.close, CupertinoIcons.return_icon);

  /// use for show filter screen
  static Widget filter(context) =>
      _buildPlatformIcon(Icons.filter, CupertinoIcons.color_filter);

  static Widget distancePicker(context) =>
      _buildPlatformIcon(Icons.circle, CupertinoIcons.circle);

  /// use for popupMenu buttons
  static Widget more(context) =>
      _buildPlatformIcon(Icons.more_vert, CupertinoIcons.table_badge_more);

  static Widget searchActivityBottomTab(context) =>
      Icon(PlatformIcons(context).search);

  static Widget settingsBottomTab(context) =>
      Icon(PlatformIcons(context).settings);

  static Widget myActivitiesBottomTab(context) =>
      Icon(PlatformIcons(context).home);

  static Widget _buildPlatformIcon(
      IconData materialData, IconData cupertinoData) {
    return PlatformWidget(
      material: (context, _) => Icon(materialData),
      cupertino: (context, _) => Icon(cupertinoData),
    );
  }
}
