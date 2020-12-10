import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';

enum SnackBarType {
  error,
  info,
  loading,
}

class CustomSnackBar {
  static show(BuildContext context, SnackBarType type, String text) {
    switch (type) {
      case SnackBarType.error:
        _errorSnackBar(text)..show(context);
        break;
      case SnackBarType.info:
        _infoSnackBar(text)..show(context);
        break;
      case SnackBarType.loading:
        _loadingSnackBar(text)..show(context);
        break;
    }
  }

  static Flushbar _errorSnackBar(String text) {
    return FlushbarHelper.createError(
      message: text,
      title: 'Error',
      duration: Duration(seconds: 3),
    );
  }

  static Flushbar _loadingSnackBar(String text) {
    return FlushbarHelper.createLoading(
      message: text,
      linearProgressIndicator: LinearProgressIndicator(),
      title: 'title',
      duration: Duration(seconds: 2),
    );
  }

  static Flushbar _infoSnackBar(String text) {
    return FlushbarHelper.createSuccess(
      message: text,
      duration: Duration(seconds: 2),
    );
  }
}
