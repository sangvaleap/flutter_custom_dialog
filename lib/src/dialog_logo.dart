import 'package:custom_dialog/src/utils/app_constant.dart';
import 'package:flutter/material.dart';

class DialogLogo extends StatelessWidget {
  const DialogLogo({super.key, this.assetLogo});
  final String? assetLogo;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: AppConstant.padding,
      right: AppConstant.padding,
      child: Container(
        width: AppConstant.dialogLogoSize,
        height: AppConstant.dialogLogoSize,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          shape: BoxShape.circle,
          color: Colors.white,
          image: assetLogo != null
              ? DecorationImage(
                  image: AssetImage(assetLogo!),
                  fit: BoxFit.contain,
                  onError: (exception, stackTrace) => const Placeholder(color: Colors.grey),
                )
              : null,
        ),
      ),
    );
  }
}
