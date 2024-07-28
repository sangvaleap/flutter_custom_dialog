import 'package:custom_dialog/src/custom_confirm_dialog.dart';
import 'package:custom_dialog/src/custom_input_dialog.dart';
import 'package:custom_dialog/src/custom_message_dialog.dart';
import 'package:custom_dialog/src/custom_selection_dailog.dart';
import 'package:custom_dialog/src/models/selection_dialog_option.dart';
import 'package:custom_dialog/src/utils/message_dialog_type.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  /// Displays a message dialog with a title, icon, message, and optional logo.
  ///
  /// The [type] parameter is used to specify the type of message dialog to display.
  /// The [showLogo] parameter is used to specify whether to show the logo in the message dialog.
  /// The [title] parameter is used to specify the title of the message dialog.
  /// If not provided, the default title will be used based on the [type].
  static Future<void> showMessageDialog(
    BuildContext context, {
    MessageDialogType type = MessageDialogType.info,
    String? title,
    String? message,
    String closeText = 'Close',
    String? assetDialogLogo,
    bool showIcon = true,
    barrierDismissible = true,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return CustomMessgeDialog(
          type: type,
          title: title,
          message: message,
          closeText: closeText,
          assetLogo: assetDialogLogo,
          showIcon: showIcon,
        );
      },
    );
  }

  // Displays a confirmation dialog with a title, message, optional logo, and yes/no buttons.
  ///
  /// The [title] parameter is used to specify the title of the confirmation dialog.
  /// The [message] parameter is used to specify the message of the confirmation dialog.
  /// The [onYes] parameter is a callback function that is called when the user clicks the "Yes" button.
  /// The [onNo] parameter is an optional callback function that is called when the user clicks the "No" button.
  /// The [showLogo] parameter is used to specify whether to show the logo in the confirmation dialog.
  static Future<void> showConfirmDialog(
    BuildContext context, {
    String title = 'Confirmation',
    required String message,
    required Function() onYes,
    Function()? onNo,
    String? assetDialogLogo,
    barrierDismissible = true,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return CustomConfirmDialog(
          title: title,
          message: message,
          onYes: onYes,
          onNo: onNo,
          assetLogo: assetDialogLogo,
        );
      },
    );
  }

  /// Displays a selection dialog with a list of options to choose from.
  ///
  /// The [options] parameter is a list of [SelectionDailogOption] objects that represent the options to choose from.
  /// Each option has a key, text, and optional icon.
  /// The [onSelected] parameter is a callback function that is called when an option is selected.
  /// The selected option's key is passed to the callback function.
  /// The [title] parameter is used to specify the title of the selection dialog.
  /// If not provided, the default title will be used.
  static Future<void> showSelectionDialog(
    BuildContext context, {
    String title = 'Select Option',
    required List<SelectionDialogOption> options,
    required Function(String) onSelected,
    String cancelText = 'Cancel',
    String? assetDialogLogo,
    barrierDismissible = true,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return CustomSelectionDialog(
          title: title,
          options: options,
          onSelected: onSelected,
          cancelText: cancelText,
          assetLogo: assetDialogLogo,
        );
      },
    );
  }

  /// Displays an input dialog with a list of input widgets to fill out.
  ///
  /// The [inputItems] parameter is a list of [Widget] objects that represent the input widgets to be filled out.
  /// The [title] parameter is used to specify the title of the selection dialog.
  /// If not provided, the default title will be used.
  static Future<void> showInputDialog(
    BuildContext context, {
    String title = 'Input Information',
    required List<Widget> inputItems,
    required Function() onSubmit,
    String submitText = 'Submit',
    String? assetDialogLogo,
    double minWidth = 400,
    barrierDismissible = true,
  }) async {
    await showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (BuildContext context) {
          return CustomInputDialog(
            title: title,
            inputItems: inputItems,
            onSubmit: onSubmit,
            submitText: submitText,
            assetLogo: assetDialogLogo,
            minWidth: minWidth,
          );
        });
  }
}
