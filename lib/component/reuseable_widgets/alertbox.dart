import 'package:demoproject/component/commonfiles/appcolor.dart';
import 'package:demoproject/component/reuseable_widgets/apppara.dart';
import 'package:demoproject/component/reuseable_widgets/apptext.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:velocity_x/velocity_x.dart';

class AlertBox extends StatefulWidget {
  const AlertBox({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _AlertBoxState createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: SizedBox(
          // color: Colors.red,
          width: 70.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              2.h.heightBox,
              AppText(
                fontWeight: FontWeight.w600,
                size: 13.sp,
                text: "Alert",
                color: AppColors().blackColor,
              ),
              3.h.heightBox,
              AppPara(
                      align: TextAlign.center,
                      fontWeight: FontWeight.w400,
                      size: 12.sp,
                      color: AppColors().blackColor,
                      text: widget.title)
                  .pOnly(top: 4.sp, bottom: 4.sp, left: 4.w, right: 4.w),
              3.h.heightBox,
              Container(
                height: 7.h,
                width: 60.w,
                decoration: BoxDecoration(
                    color: AppColors().bgColor,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: kElevationToShadow[2]),
                child: Center(
                  child: AppText(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    size: 12.sp,
                    text: "Ok",
                  ),
                ),
              ).onTap(() {
                Navigator.of(context).pop();
              }),
              3.h.heightBox
            ],
          ),
        ));
  }
}
