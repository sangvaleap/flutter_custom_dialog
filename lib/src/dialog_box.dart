import 'dart:io';

import 'package:custom_dialog/src/dialog_logo.dart';
import 'package:custom_dialog/src/utils/app_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    super.key,
    required this.child,
    this.assetLogo,
    this.minWidth,
    this.maxWidth = 500,
  });
  final Widget child;
  final String? assetLogo;
  final double? minWidth;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return _checkContent(context);
  }

  Widget _checkContent(BuildContext context) {
    return assetLogo != null
        ? Stack(
            children: <Widget>[
              _buildContent(context),
              DialogLogo(assetLogo: assetLogo),
            ],
          )
        : _buildContent(context);
  }

  Widget _buildContent(context) {
    var bottomPadding =
        !kIsWeb && (Platform.isIOS || Platform.isAndroid) ? AppConstant.dialogPadding / 2 : AppConstant.dialogPadding;
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: minWidth ?? 200, maxWidth: maxWidth),
      child: Container(
        padding: EdgeInsets.fromLTRB(
          AppConstant.dialogPadding,
          assetLogo != null ? (AppConstant.dialogLogoSize / 2) + AppConstant.dialogPadding : AppConstant.dialogPadding,
          AppConstant.dialogPadding,
          bottomPadding,
        ),
        margin: const EdgeInsets.only(top: (AppConstant.dialogLogoSize / 2)),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(AppConstant.dialogPadding),
          boxShadow: const [
            BoxShadow(color: Colors.black38, offset: Offset(0, 10), blurRadius: 10),
          ],
        ),
        child: child,
      ),
    );
  }
}
