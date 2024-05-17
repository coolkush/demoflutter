// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:demoproject/component/commonfiles/appcolor.dart';
import 'package:demoproject/component/reuseable_widgets/apptext.dart';
import 'package:demoproject/component/reuseable_widgets/customswitch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class CustumTextFeild extends StatefulWidget {
  final Widget? suxifIcon;
  final sufixIconOnTap;
  TextEditingController? controller;
  final GestureTapCallback onPressed;
  final String Function(String?)? validator;
  final Function(String)? onchangevalue;
  // Icon iconsuffix;
  // Icon iconPrefix;
  Function()? oneditingComplete;
  FocusNode? focusNod;
  final bool onlyNumbers;
  final String hintText;
  final String labtext;
  final bool password;
  final bool enable;
  bool showPass = true;
  final double contwidth;
  final double contheight;
  final int maxlenght;
  TextInputType? mydata = TextInputType.text;
  int? maxlenthcontroller = 100;
  CustumTextFeild({
    super.key,
    this.focusNod,
    this.sufixIconOnTap,
    this.suxifIcon,
    this.enable = true,
    this.labtext = "",
    this.mydata,
    this.oneditingComplete,
    required this.onPressed,
    this.maxlenthcontroller,
    this.controller,
    required this.password,
    required this.hintText,
    this.validator,
    this.onchangevalue,
    this.contwidth = 0,
    this.onlyNumbers = false,
    this.contheight = 0,
    this.maxlenght = 1,
  });

  @override
  State<CustumTextFeild> createState() => _CustumTextFeildState();
}

class _CustumTextFeildState extends State<CustumTextFeild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: theme.colorScheme.onPrimary,
        border: Border.all(
          color: AppColors().bgColor,
          width: 2,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      ),
      // height: widget.contheight == 0 ? 6.h : widget.contheight,
      width: widget.contwidth == 0 ? 100.w : widget.contwidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
              fontWeight: FontWeight.w400,
              size: 11.sp,
              color: AppColors().blackColor,
              text: widget.hintText),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                // color: Colors.amber ,
                width: widget.suxifIcon != null ? 80.w : 85.w,
                child: TextFormField(
                    focusNode: widget.focusNod,
                    maxLines: widget.maxlenght,
                    onEditingComplete: widget.oneditingComplete,
                    enabled: widget.enable,
                    controller: widget.controller,
                    obscureText: widget.password == true
                        ? widget.showPass
                        : widget.password,
                    inputFormatters: widget.onlyNumbers == true
                        ? [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            LengthLimitingTextInputFormatter(
                                widget.maxlenthcontroller)
                          ]
                        : [
                            LengthLimitingTextInputFormatter(
                                widget.maxlenthcontroller)
                          ],
                    validator: widget.validator,
                    onChanged: widget.onchangevalue,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: AppColors().blackColor,
                    ),
                    keyboardType: widget.mydata,
                    decoration: InputDecoration.collapsed(
                      hintText: widget.labtext,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      hintStyle: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12.sp,
                        color: AppColors().blackColor,
                      ),
                    ),
                    onTap: widget.onPressed),
              ),
              widget.suxifIcon ?? Container()
            ],
          ),
        ],
      ).pOnly(top: 1.h, bottom: 1.h, left: 2.w, right: 2.w),
    );
  }
}
