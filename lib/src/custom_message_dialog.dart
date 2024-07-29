import 'package:custom_dialog/src/dialog_box.dart';
import 'package:custom_dialog/src/utils/app_constant.dart';
import 'package:custom_dialog/src/utils/message_dialog_type.dart';
import 'package:flutter/material.dart';

class CustomMessgeDialog extends StatelessWidget {
  const CustomMessgeDialog({
    super.key,
    this.title,
    this.message,
    this.closeText = 'Close',
    this.assetLogo,
    this.showIcon = true,
    this.type = MessageDialogType.success,
  });

  final String? title;
  final String? message;
  final String closeText;
  final String? assetLogo;
  final bool showIcon;
  final MessageDialogType type;

  @override
  Widget build(BuildContext context) {
    _DialogModel dialogType = _getDialogType(type);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstant.dialogPadding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: DialogBox(
        assetLogo: assetLogo,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title ?? dialogType.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            if (showIcon)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: dialogType.icon,
              ),
            if (message != null)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  message!,
                  style: const TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(height: 15),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(closeText, style: const TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _DialogModel _getDialogType(MessageDialogType type) => switch (type) {
        MessageDialogType.success => _DialogModel(
            title: 'Success',
            icon: const Icon(Icons.check_circle, color: Colors.green, size: 50),
          ),
        MessageDialogType.error => _DialogModel(
            title: 'Error',
            icon: const Icon(Icons.error, color: Colors.red, size: 50),
          ),
        MessageDialogType.warning => _DialogModel(
            title: 'Warning',
            icon: const Icon(Icons.warning, color: Colors.amber, size: 50),
          ),
        _ => _DialogModel(
            title: 'Info',
            icon: const Icon(Icons.info, color: Colors.blue, size: 50),
          ),
      };
}

class _DialogModel {
  String title;
  Widget icon;
  _DialogModel({
    required this.title,
    required this.icon,
  });
}
