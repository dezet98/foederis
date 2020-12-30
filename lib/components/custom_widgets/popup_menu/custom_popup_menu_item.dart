import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/components/bloc_builders/send_with_validator/send_builder_button.dart';
import 'package:flutter/material.dart';

class CustomPopupMenuItem {
  static PopupMenuItem sendButton(SendBloc sendBloc, String sendButtonText) {
    return PopupMenuItem(
      child: SendBuilderButton(
        sendBloc: sendBloc,
        sendButtonText: sendButtonText,
      ),
    );
  }
}
