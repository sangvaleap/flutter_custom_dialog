import 'package:custom_dialog/src/dialog_box.dart';
import 'package:custom_dialog/src/models/selection_dialog_option.dart';
import 'package:custom_dialog/src/utils/app_constant.dart';
import 'package:flutter/material.dart';

class CustomSelectionDialog extends StatelessWidget {
  const CustomSelectionDialog({
    super.key,
    required this.title,
    required this.options,
    required this.onSelected,
    this.cancelText = 'Cancel',
    this.assetLogo,
  });

  final String title;
  final List<SelectionDialogOption> options;
  final Function(String) onSelected;
  final String cancelText;
  final String? assetLogo;

  @override
  Widget build(BuildContext context) {
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
          children: [
            Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
            const SizedBox(height: 5),
            const Divider(),
            _buildOptions(context),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(cancelText, style: const TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptions(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, index) {
        var option = options[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: AppConstant.dialogPadding / 2),
          leading: option.icon != null ? Icon(option.icon) : null,
          title: Text(option.text, style: const TextStyle(fontSize: 15)),
          onTap: () {
            Navigator.of(context).pop();
            onSelected(option.key);
          },
        );
      },
      separatorBuilder: (_, __) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstant.dialogPadding / 2),
        child: Divider(height: 0),
      ),
      itemCount: options.length,
    );
  }
}
