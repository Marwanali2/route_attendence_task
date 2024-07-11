import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:route_attendence_task/core/utils/assets_data.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: Lottie.asset(
            AssetsData.loadingLottie,
            animate: true,
            height: 100,
            width: 100,
          ),
          inAsyncCall: true,
          opacity: 0,
          child: const SizedBox(),
    );
  }
}