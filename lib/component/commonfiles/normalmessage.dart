// ignore_for_file: unnecessary_string_escapes, use_build_context_synchronously, deprecated_member_use, unused_local_variable

import 'package:demoproject/component/reuseable_widgets/alertbox.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NormalMessage {
  NormalMessage._();

  static final NormalMessage _instance = NormalMessage._();

  factory NormalMessage() {
    return _instance;
  }
  static NormalMessage get instance => _instance;

  String returnTimeStamp(String messageTimeStamp) {
    // log(messageTimeStamp.toString());
    if (messageTimeStamp != "") {
      String resultString = '';
      var formatc = DateFormat('EEEE, MMMM d, yyyy');
      var format = DateFormat('hh:mm');
      var format1 = DateFormat('EEE');
      var format2 = DateFormat('d MMM');
      var today = DateTime.now().millisecond;
      var currentdate = formatc.format(DateTime.now());
      var date = DateTime.parse(messageTimeStamp);
      var chack = formatc.format(DateTime.now());
      Duration diff = DateTime.now().difference(date);
      if (diff.inDays > 7) return format2.format(date);
      if (diff.inDays > 0) {
        return format2.format(date);
      }
      //  return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
      if (diff.inMinutes < 60) {
        return "${diff.inMinutes} ${diff.inMinutes == 1 ? "min" : "minutes"} ago";
      }
      if (diff.inHours < 24) {
        return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"}";
      } else {
        return "just now";
      }

      // return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
    } else {
      return "";
    }
  }

  String passwordMessage =
      "Password should be Between 8-16 characters long. And it should contain Atleast One Number, One Special Character,One Uppercase and One Lowercase.";
  String emailMessage = "Please enter valid Email ID";
  String phoneoremailMessage =
      "Please enter valid email address or phone number.";
  String firstNameEmpty = "Please enter Name";
  String emailEmpty = "Please enter Email ID.";
  String addremark = "Please enter remark content.";
  String queryEmpty = "Please enter query.";
  String emailorPhoneEmpty = "Please enter email id or phone no.";
  String phoneEmpty = "Please enter phone number";
  String holdernameEmpty = "Please enter card holder name";
  String cardnumberEmpty = "Please enter card number";
  String expireEmpty = "Please enter expiry date";
  String cvvEmpty = "Please enter cvv number";
  String phoneMessage = "Contact number should be between 6 to 15 digits.";
  String passwordEmpty = "Please enter password";
  String newpasswordEmpty = "Please enter new password";
  String confirmpasswordEmpty = "Please enter confirm password";
  String oldpasswordEmpty = "Please enter old password";
  String confirmpasswordValidation =
      "New Password & Confirm Password must be same.";
  String mainconfirmpasswordValidation =
      "New Password & Confirm Password must be same.";
  var phoneoremail = RegExp(
      '^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})|(^[0-9]{10-16})+\$');
  String onlycharvalidation =
      "Name should not contain any special characters or numbers!";
  RegExp validateEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp firstName = RegExp(r"^[A-Za-z,a-zA-Z]{1,15}$");
  RegExp validationName = RegExp(r'^[A-Z a-z]+$');

  RegExp validatePassword =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,16}$');
  bool checkemail(String email) {
    if (validateEmail.hasMatch(email) == true) {
      List data = email.split("@");
      List data1 = data[1].toString().split(".");

      if (data1.length > 2) {
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  final RegExp phoneNumberRegex = RegExp(r'^(\+)?[0-9]{6,15}$');
  // String baseUrl = "https://dev.webmobrildemo.com/parqd";
  // String baseUrl = "http://44.217.173.175";
// RegExp validateNumber = RegExp(r'[0-9]{10,12}$)');
  RegExp fullname = RegExp(r'^(?=.*[A-Za-z]).{2,}');
  RegExp phonenumbervalidate = RegExp(r'^[0-9]');
  String connecting = "Connecting...";
  String loading = "Please wait...";
  String serverError = "Server not responding, Please retry";
  String unauthenticatedError = "Unauthenticated";
  String somethingWentWrong = "Something went wrong.";
  String unableToParse = "Issue in Response Parsing";
  String endPointError = "Method end point is in-correct";
  String successfullyParse = "done";
  String internetConnectionError =
      "You have no internet connection. Please enable Wi-fi or Mobile Data and try again";
  String unauthenticatedmessage =
      "You have been logged out of the app. Please try logging in again.";
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  normalerrorstate(BuildContext context, String message) {
    if (message == "Null check operator used on a null value" ||
        message == "Throw of null.") {
      showDialog(
          context: context, builder: (_) => AlertBox(title: serverError));
    } else if (message ==
            "type 'String' is not a subtype of type 'Map<String, dynamic>'" ||
        message ==
            "type '_TypeError' is not a subtype of type 'DioException' in type cast" ||
        message ==
            "type '_TypeError' is not a subtype of type 'DioException' in type cast") {
      showDialog(
          context: context,
          builder: (_) => const AlertBox(title: "Something went wrong"));
    } else {
      showDialog(context: context, builder: (_) => AlertBox(title: message));
    }
  }
}
