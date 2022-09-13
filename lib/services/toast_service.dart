import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../theme/colors.dart';

class ToastNotificationService {
  // show notification
  static void showNotification(String? message) {
    Fluttertoast.showToast(
      msg: message ?? "",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 4,
      fontSize: 11.0,
      backgroundColor: Colors.cyan.shade700,
      textColor: kDefaultWhite,
      webShowClose: true,
    );
  }

  // show error notification
  static void showErrorNotification(String? message) {
    Fluttertoast.showToast(
      msg: message ?? "An error occured.",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 4,
      fontSize: 11.0,
      backgroundColor: kErrorRed,
      textColor: kDefaultWhite,
      webShowClose: true,
    );
  }

  // show warning notification
  static void showWarningNotification(String? message) {
    Fluttertoast.showToast(
      msg: message ?? "",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 4,
      fontSize: 11.0,
      backgroundColor: Colors.orange[800],
      textColor: kDefaultWhite,
      webShowClose: true,
    );
  }

  // show success notification
  static void showSuccessNotification(String? message) {
    Fluttertoast.showToast(
      msg: message ?? "Success.",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 4,
      fontSize: 11.0,
      backgroundColor: Colors.green.shade800,
      textColor: kDefaultWhite,
      webShowClose: true,
    );
  }
}
