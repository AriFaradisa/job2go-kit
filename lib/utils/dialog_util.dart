import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtil {
  static Future showWarningDialog(
      BuildContext context, String content, Function onClose,
      {required String btnText, bool isDimissable = false}) {
    return showDialog(
        context: context,
        barrierDismissible: isDimissable,
        builder: (context) {
          if (Platform.isIOS) {
            return CupertinoAlertDialog(
              title: Text("Peringatan"),
              content: Text(content),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () {
                    if (onClose != null) {
                      onClose();
                    }
                    Get.back();
                  },
                  child: Text(btnText == null ? "Oke" : btnText),
                )
              ],
            );
          } else {
            return AlertDialog(
              content: Text(content),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    if (onClose != null) {
                      onClose();
                    }
                    Get.back();
                  },
                  child: Text(btnText == null ? "Oke" : btnText),
                )
              ],
            );
          }
        });
  }

  static Future showWarningDialogForce(
      BuildContext context, String content, Function onClose,
      {required String btnText, bool isDimissable = false}) {
    return showDialog(
        context: context,
        barrierDismissible: isDimissable,
        builder: (context) {
          if (Platform.isIOS) {
            return WillPopScope(
              onWillPop: null,
              child: CupertinoAlertDialog(
                title: Text("Peringatan"),
                content: Text(content),
                actions: <Widget>[
                  CupertinoDialogAction(
                    onPressed: () {
                      if (onClose != null) {
                        onClose();
                      }
                      Get.back();
                    },
                    child: Text(btnText == null ? "Oke" : btnText),
                  )
                ],
              ),
            );
          } else {
            return WillPopScope(
              onWillPop: null,
              child: AlertDialog(
                content: Text(content),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      if (onClose != null) {
                        onClose();
                      }
                      Get.back();
                    },
                    child: Text(btnText == null ? "Oke" : btnText),
                  )
                ],
              ),
            );
          }
        });
  }

  static Future showNotificationDialog(
      BuildContext context,
      String content,
      Function onPositive,
      Function onNegative,
      String positiveText,
      String negativeText,
      {String iOSCaption = ""}) {
    return showDialog(
        context: context,
        builder: (context) {
          if (Platform.isIOS) {
            return CupertinoAlertDialog(
              content: Text(content),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () {
                    Get.back();
                    onNegative();
                  },
                  child: Text(negativeText),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    Get.back();
                    onPositive();
                  },
                  child: Text(positiveText),
                )
              ],
            );
          } else {
            return AlertDialog(
              content: Text(content),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Get.back();
                    onNegative();
                  },
                  child: Text(negativeText),
                ),
                FlatButton(
                  onPressed: () {
                    Get.back();
                    onPositive();
                  },
                  child: Text(positiveText),
                )
              ],
            );
          }
        });
  }

  static Future showNotificationDialogForce(
      BuildContext context,
      String content,
      Function onPositive,
      Function onNegative,
      String positiveText,
      String negativeText,
      {String iOSCaption = ""}) {
    return showDialog(
        context: context,
        builder: (context) {
          if (Platform.isIOS) {
            return WillPopScope(
              onWillPop: null,
              child: CupertinoAlertDialog(
                content: Text(content),
                actions: <Widget>[
                  CupertinoDialogAction(
                    onPressed: () {
                      Get.back();
                      onNegative();
                    },
                    child: Text(negativeText),
                  ),
                  CupertinoDialogAction(
                    onPressed: () {
                      Get.back();
                      onPositive();
                    },
                    child: Text(positiveText),
                  )
                ],
              ),
            );
          } else {
            return WillPopScope(
              onWillPop: null,
              child: AlertDialog(
                content: Text(content),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Get.back();
                      onNegative();
                    },
                    child: Text(negativeText),
                  ),
                  FlatButton(
                    onPressed: () {
                      Get.back();
                      onPositive();
                    },
                    child: Text(positiveText),
                  )
                ],
              ),
            );
          }
        });
  }
}
