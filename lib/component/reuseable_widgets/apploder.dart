import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class AppLoader extends StatelessWidget {
  double contHeight;
  double contWidth;
  String? loader = "";
  Color? color = Colors.black.withOpacity(0.5);
  AppLoader(
      {Key? key,
      this.loader,
      this.color,
      this.contHeight = 0,
      this.contWidth = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        // color: AppColors().blackColor.withOpacity(0.5),
        height: contHeight == 0 ? 100.h : contHeight,
        width: contWidth == 0 ? 100.w : contWidth,
        child: Center(child: LottieBuilder.asset("assets/loading.json")

            /* ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors().bgColor,
              ),
              height: 8.h,
              width: 50.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  3.w.widthBox,
                  SizedBox(
                      width: 4.h,
                      height: 4.h,
                      child: CircularProgressIndicator(
                        color: AppColors().whiteColor,
                        strokeWidth: 2,
                        backgroundColor: AppColors().bgColor,
                      )),
                  AppText(
                      fontWeight: FontWeight.w400,
                      size: 1.5.h,
                      color: AppColors().whiteColor,
                      text: NormalMessage().loading),
                  3.w.widthBox,
                ],
              ),
            ),
          ),
         */
            ),
      ),
    );
  }
}
