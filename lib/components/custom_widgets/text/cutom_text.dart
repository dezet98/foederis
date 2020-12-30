import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomText {
  static Widget menuTitle(String text, {TextAlign textAlign}) =>
      Builder(builder: (context) {
        return Text(
          text,
          style: Theme.of(context).textTheme.headline3,
        );
      });

  static Widget errorText(String text, {TextAlign textAlign}) =>
      Builder(builder: (context) {
        return Text(
          text,
          style: Theme.of(context).textTheme.subtitle2,
        );
      });

  static Widget formText(String text, {TextAlign textAlign}) =>
      Builder(builder: (context) {
        return Text(
          text,
          style: Theme.of(context).textTheme.bodyText2,
        );
      });

  static Widget textButton(String text, {TextAlign textAlign}) =>
      Builder(builder: (context) {
        return Text(
          text,
          style: Theme.of(context).textTheme.button,
        );
      });

  static Widget tab(String text, {TextAlign textAlign}) =>
      Builder(builder: (context) {
        return Text(
          text,
          style: Theme.of(context).textTheme.headline3,
        );
      });

  static Widget secondaryText(String text, {TextAlign textAlign}) =>
      Builder(builder: (context) {
        return Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        );
      });

  static Widget listItem(String text, {TextAlign textAlign}) =>
      Builder(builder: (context) {
        return Text(
          text,
          style: Theme.of(context).textTheme.bodyText2,
        );
      });

  static Widget modalText(String text, {TextAlign textAlign}) =>
      Builder(builder: (context) {
        return Text(
          text,
          style: Theme.of(context).textTheme.bodyText2,
        );
      });

  static Widget bodyText(String text, {TextAlign textAlign}) =>
      Builder(builder: (context) {
        return Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        );
      });

  static Widget button(BuildContext das, String text, {TextAlign textAlign}) =>
      Builder(builder: (context) {
        return Text(
          text,
          style: Theme.of(context).textTheme.button,
        );
      });

  static Widget unavailableTextButton(String text, {TextAlign textAlign}) =>
      Builder(builder: (context) {
        return Text(
          text,
          style: Theme.of(context)
              .textTheme
              .button
              .copyWith(color: Colors.black26),
        );
      });

  static Widget pageTitle(String text, {TextAlign textAlign}) =>
      Builder(builder: (context) {
        return Text(
          text,
          style: Theme.of(context).textTheme.headline1,
        );
      });

  static Widget validFormTitle(String text, {TextAlign textAlign}) =>
      Builder(builder: (context) {
        return Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline3
              .copyWith(color: Colors.green),
        );
      });

  static Widget invalidFormTitle(String text, {TextAlign textAlign}) =>
      Builder(builder: (context) {
        return Text(
          text,
          style:
              Theme.of(context).textTheme.headline3.copyWith(color: Colors.red),
        );
      });
}
