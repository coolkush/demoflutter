// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:demoproject/component/commonfiles/appcolor.dart';
import 'package:demoproject/component/reuseable_widgets/apptext.dart';
import 'package:demoproject/component/reuseable_widgets/customswitch.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class DropDownTextFeild extends StatefulWidget {
  var controller;
  final GestureTapCallback onPressed;
  final String Function(String?)? validator;
  final onChanged;
  final bool useonchange;
  void Function(Object?)? onchangevalue;
  // Icon iconsuffix;
  // Icon iconPrefix;
  final String hintText;
  final String labtext;
  final bool password;
  final bool enable;
  final double contwidth;
  final bool isobject;
  final List<String> myListData;

  TextInputType? mydata = TextInputType.text;
  int? maxlenthcontroller = 100;

  DropDownTextFeild({
    super.key,
    this.isobject = false,
    this.enable = true,
    this.onChanged,
    this.useonchange = false,
    required this.onchangevalue,
    this.labtext = "",
    this.mydata,
    required this.onPressed,
    this.maxlenthcontroller,
    required this.controller,
    required this.password,
    required this.hintText,
    this.validator,
    this.contwidth = 0,
    required this.myListData,
  });

  @override
  State<DropDownTextFeild> createState() => _DropDownTextFeildState();
}

class _DropDownTextFeildState extends State<DropDownTextFeild> {
  var myController;
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
              color: AppColors().bgColor,
              text: widget.hintText),
          FormField<String>(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
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
                isEmpty: false,
                child: DropdownButton(
                  underline: const SizedBox(),
                  isExpanded: true,
                  alignment: AlignmentDirectional.centerStart,
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors().bgColor,
                  ),
                  iconDisabledColor: AppColors().whiteColor,
                  iconEnabledColor: AppColors().whiteColor,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 11.sp,
                      color: AppColors().blackColor),
                  hint: AppText(
                      fontWeight: FontWeight.w600,
                      size: 12.sp,
                      text:
                          '${widget.controller}'), // Not necessary for Option 1
                  // value: myController,

                  onChanged: widget.onchangevalue,
                  items: widget.myListData.map((location) {
                    return DropdownMenuItem(
                      value: location,
                      child: Text(
                        location,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: AppColors().blackColor,
                            backgroundColor: AppColors().whiteColor),
                      ),
                    );
                  }).toList(),
                ).pSymmetric(h: 10),
              );
            },
          ),
        ],
      ).pOnly(top: .5.h, bottom: .5.h, left: 2.w, right: 2.w),
    );
  }
}
