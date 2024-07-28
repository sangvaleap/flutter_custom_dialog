import 'package:custom_dialog/src/dialog_box.dart';
import 'package:custom_dialog/src/utils/app_constant.dart';
import 'package:flutter/material.dart';

class CustomConfirmDialog extends StatelessWidget {
  const CustomConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    this.onYes,
    this.onNo,
    this.assetLogo,
  });

  final String title;
  final String message;
  final Function()? onNo;
  final Function()? onYes;
  final String? assetLogo;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstant.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: DialogBox(
        assetLogo: assetLogo,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            const SizedBox(height: 15),
            Text(
              message,
              style: const TextStyle(fontSize: 15),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onNo?.call();
          },
          child: Text('No', style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onYes?.call();
          },
          child: const Text('Yes', style: TextStyle(fontSize: 16)),
        )
      ],
    );
  }
}
