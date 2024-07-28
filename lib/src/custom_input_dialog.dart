import 'package:custom_dialog/src/dialog_box.dart';
import 'package:custom_dialog/src/utils/app_constant.dart';
import 'package:flutter/material.dart';

class CustomInputDialog extends StatelessWidget {
  const CustomInputDialog({
    super.key,
    required this.title,
    required this.inputItems,
    required this.onSubmit,
    this.submitText = 'Submit',
    this.minWidth = 400,
    this.assetLogo,
  });
  final String title;
  final List<Widget> inputItems;
  final Function() onSubmit;
  final double minWidth;
  final String submitText;
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
        minWidth: minWidth,
        assetLogo: assetLogo,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            const SizedBox(height: 15),
            SingleChildScrollView(
              child: Column(
                children: inputItems,
              ),
            ),
            const SizedBox(height: 15),
            _buildActionButtons(context)
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
          },
          child: Text('Cancel', style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onSubmit.call();
          },
          child: Text(submitText, style: const TextStyle(fontSize: 16)),
        ),
      ],
    );
  }
}
