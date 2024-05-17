// ignore_for_file: deprecated_member_use

import 'package:demoproject/component/commonfiles/appcolor.dart';
import 'package:demoproject/component/reuseable_widgets/apptext.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import 'package:velocity_x/velocity_x.dart';

class FillImageWithColor extends StatelessWidget {
  final String imageUrl;
  final Color fillColor;
  final Color baseColor;
  final int percentage;

  const FillImageWithColor({
    super.key,
    required this.imageUrl,
    required this.fillColor,
    required this.baseColor,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    final fillGradient = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        fillColor,
        fillColor.withOpacity(0),
      ],
      stops: [
        percentage / 100,
        percentage / 100,
      ],
    );

    return Stack(
      children: [
        SvgPicture.asset(
          imageUrl,
          color: baseColor,
        ),
        ShaderMask(
          shaderCallback: (bounds) => fillGradient.createShader(bounds),
          blendMode: BlendMode.srcATop,
          child: SvgPicture.asset(
            imageUrl,
            // color: fillColor,
          ),
        ),
        AppText(
                color: AppColors().whiteColor,
                fontWeight: FontWeight.w500,
                size: 12.sp,
                text: "$percentage%")
            .centered()
            .pOnly(left: 5.w, bottom: 2.h)
      ],
    );
  }
}
