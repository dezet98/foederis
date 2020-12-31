import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomIcon {
  static Widget get cropFile => Builder(builder: (context) {
        return _buildPlatformIcon(Icons.crop, CupertinoIcons.crop);
      });

  static Widget get datePicker => Builder(builder: (context) {
        return Icon(PlatformIcons(context).time);
      });

  static Widget get refresh => Builder(builder: (context) {
        return Icon(PlatformIcons(context).refresh);
      });

  static Widget get add => Builder(builder: (context) {
        return Icon(PlatformIcons(context).add);
      });

  static Widget get back => Builder(builder: (context) {
        return Icon(PlatformIcons(context).back);
      });

  static Widget get person => Builder(builder: (context) {
        return Icon(PlatformIcons(context).person);
      });

  static Widget get userAvatar => Builder(builder: (context) {
        return Icon(PlatformIcons(context).personOutline);
      });

  /// use for clear data in form
  static Widget get clear => Builder(builder: (context) {
        return Icon(PlatformIcons(context).clear);
      });

  static Widget get map => Builder(builder: (context) {
        return _buildPlatformIcon(Icons.map, CupertinoIcons.map);
      });

  static Widget get list => Builder(builder: (context) {
        return _buildPlatformIcon(Icons.list_alt, CupertinoIcons.list_bullet);
      });

  /// use for close screens
  static Widget get closeScreen => Builder(builder: (context) {
        return _buildPlatformIcon(Icons.close, CupertinoIcons.return_icon);
      });

  /// use for show filter screen
  static Widget get filter => Builder(builder: (context) {
        return _buildPlatformIcon(Icons.filter, CupertinoIcons.color_filter);
      });

  static Widget get distancePicker => Builder(builder: (context) {
        return _buildPlatformIcon(
            Icons.navigation_rounded, CupertinoIcons.news);
      });

  /// use for popupMenu buttons
  static Widget get more => Builder(builder: (context) {
        return _buildPlatformIcon(
            Icons.more_vert, CupertinoIcons.table_badge_more);
      });

  static Widget get searchActivityBottomTab => Builder(builder: (context) {
        return Icon(PlatformIcons(context).search);
      });

  static Widget get settingsBottomTab => Builder(builder: (context) {
        return Icon(PlatformIcons(context).settings);
      });

  static Widget get myActivitiesBottomTab => Builder(builder: (context) {
        return Icon(PlatformIcons(context).home);
      });

  static Widget get guestInfoBottomTab => Builder(builder: (context) {
        return Icon(PlatformIcons(context).info);
      });

  static Widget _buildPlatformIcon(
      IconData materialData, IconData cupertinoData) {
    return PlatformWidget(
      material: (context, _) => Icon(materialData),
      cupertino: (context, _) => Icon(cupertinoData),
    );
  }
}
