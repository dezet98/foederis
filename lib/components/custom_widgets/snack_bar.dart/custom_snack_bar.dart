import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';

enum SnackBarType {
  error,
  info,
  loading,
}

class CustomSnackBar {
  static void showErrorSnackBar(BuildContext context,
      {String title, String message}) {
    _errorSnackBar(title: title, message: message)..show(context);
  }

  static void showLoadingSnackBar(BuildContext context,
      {String title, String message}) {
    _loadingSnackBar(title: title, message: message)..show(context);
  }

  static void showInfoSnackBar(BuildContext context,
      {String title, String message}) {
    _infoSnackBar(title: title, message: message)..show(context);
  }

  static Flushbar _errorSnackBar({String title, String message}) {
    return FlushbarHelper.createError(
      title: title,
      message: message,
      duration: Duration(seconds: 3),
    );
  }

  static Flushbar _loadingSnackBar({String title, String message}) {
    return FlushbarHelper.createLoading(
      message: message,
      linearProgressIndicator: LinearProgressIndicator(),
      title: title,
      duration: Duration(seconds: 2),
    );
  }

  static Flushbar _infoSnackBar({String title, String message}) {
    return FlushbarHelper.createSuccess(
      message: message,
      title: title,
      duration: Duration(seconds: 2),
    );
  }
}
