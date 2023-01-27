import 'package:flutter/material.dart';

enum ButtonStatus { active, inactive, disabled }

class Job2GoSingleButton extends StatelessWidget {
  final BuildContext context;
  final String text;
  final double radius;
  final double padding;
  final Function onTap;
  final ButtonStatus status;
  final EdgeInsets? margin;
  final Widget? icon;
  final Color? buttonColorActive;
  final Color? textColorActive;
  final Color? buttonColorInactive;
  final Color? textColorInactive;
  final Color? buttonColorDisabled;
  final Color? textColorDisabled;
  const Job2GoSingleButton({
    Key? key,
    required this.context,
    this.text = "Submit",
    this.radius = 30,
    this.padding = 16,
    required this.onTap,
    this.status = ButtonStatus.active,
    this.margin =
        const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
    this.icon,
    this.buttonColorActive,
    this.textColorActive,
    this.buttonColorInactive,
    this.textColorInactive,
    this.buttonColorDisabled,
    this.textColorDisabled = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? borderColor;
    Color? bgColor;
    Color? actionColor;
    switch (status) {
      case ButtonStatus.active:
        borderColor =
            buttonColorActive ?? const Color.fromRGBO(209, 55, 45, 1.0);
        bgColor = buttonColorActive ?? const Color.fromRGBO(209, 55, 45, 1.0);
        actionColor = textColorActive ?? Colors.white;
        break;
      case ButtonStatus.inactive:
        borderColor =
            buttonColorInactive ?? const Color.fromRGBO(92, 104, 119, 1.0);
        bgColor = buttonColorInactive ?? Colors.transparent;
        actionColor =
            buttonColorInactive ?? const Color.fromRGBO(92, 104, 119, 1.0);
        break;
      case ButtonStatus.disabled:
        borderColor =
            buttonColorDisabled ?? const Color.fromRGBO(184, 184, 213, 1.0);
        bgColor =
            buttonColorDisabled ?? const Color.fromRGBO(184, 184, 213, 1.0);
        actionColor = buttonColorDisabled ?? Colors.white;
        break;
    }
    return Container(
      margin: margin,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(radius)),
        child: Material(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius),
          child: InkWell(
            splashColor:
                status == ButtonStatus.disabled ? Colors.transparent : null,
            borderRadius: BorderRadius.circular(radius),
            onTap: () {
              if (status != ButtonStatus.disabled) {
                onTap();
              }
            },
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    icon ?? Container(),
                    Flexible(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13,
                            color: actionColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

class Job2GoDoubleButton extends StatelessWidget {
  final BuildContext context;
  final String textRight;
  final String textLeft;
  final double radius;
  final double padding;
  final Function onTapRight;
  final Function onTapLeft;
  final ButtonStatus statusRight;
  final ButtonStatus statusLeft;
  final EdgeInsets? margin;
  final Color? buttonColorActiveDefault;
  final Color? textColorActiveDefault;
  final Color? buttonColorInactiveDefault;
  final Color? textColorInactiveDefault;
  final Color? buttonColorDisabledDefault;
  final Color? textColorDisabledDefault;
  final Color? buttonColorActiveRight;
  final Color? textColorActiveRight;
  final Color? buttonColorInactiveRight;
  final Color? textColorInactiveRight;
  final Color? buttonColorDisabledRight;
  final Color? textColorDisabledRight;
  final Color? buttonColorActiveLeft;
  final Color? textColorActiveLeft;
  final Color? buttonColorInactiveLeft;
  final Color? textColorInactiveLeft;
  final Color? buttonColorDisabledLeft;
  final Color? textColorDisabledLeft;
  final bool isLeftButtonTextOnly;
  final Color backgroundColor;
  const Job2GoDoubleButton({
    Key? key,
    required this.context,
    this.textRight = "Submit",
    this.textLeft = "Batal",
    this.radius = 30,
    this.padding = 16,
    required this.onTapRight,
    required this.onTapLeft,
    required this.statusRight,
    required this.statusLeft,
    this.margin,
    this.buttonColorActiveDefault,
    this.textColorActiveDefault,
    this.buttonColorInactiveDefault,
    this.textColorInactiveDefault,
    this.buttonColorDisabledDefault,
    this.textColorDisabledDefault,
    this.buttonColorActiveRight,
    this.textColorActiveRight,
    this.buttonColorInactiveRight,
    this.textColorInactiveRight,
    this.buttonColorDisabledRight,
    this.textColorDisabledRight,
    this.buttonColorActiveLeft,
    this.textColorActiveLeft,
    this.buttonColorInactiveLeft,
    this.textColorInactiveLeft,
    this.buttonColorDisabledLeft,
    this.textColorDisabledLeft,
    this.isLeftButtonTextOnly = false,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // button default
    Color? borderColorDefault;
    Color? bgColorDefault;
    Color? actionColorDefault;
    switch (statusRight) {
      case ButtonStatus.active:
        borderColorDefault =
            buttonColorActiveDefault ?? const Color.fromRGBO(209, 55, 45, 1.0);
        bgColorDefault =
            buttonColorActiveDefault ?? const Color.fromRGBO(209, 55, 45, 1.0);
        actionColorDefault = textColorActiveDefault ?? Colors.white;
        break;
      case ButtonStatus.inactive:
        borderColorDefault = buttonColorInactiveDefault ??
            const Color.fromRGBO(92, 104, 119, 1.0);
        bgColorDefault = buttonColorInactiveDefault ?? Colors.transparent;
        actionColorDefault = buttonColorInactiveDefault ??
            const Color.fromRGBO(92, 104, 119, 1.0);
        break;
      case ButtonStatus.disabled:
        borderColorDefault = buttonColorDisabledDefault ??
            const Color.fromRGBO(184, 184, 213, 1.0);
        bgColorDefault = buttonColorDisabledDefault ??
            const Color.fromRGBO(184, 184, 213, 1.0);
        actionColorDefault = buttonColorDisabledDefault ?? Colors.white;
        break;
    }
    return Container(
      margin: margin,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: borderColorDefault),
                borderRadius: BorderRadius.circular(radius)),
            child: Material(
              color: bgColorDefault,
              borderRadius: BorderRadius.circular(radius),
              child: InkWell(
                splashColor: statusRight == ButtonStatus.disabled
                    ? Colors.transparent
                    : null,
                borderRadius: BorderRadius.circular(radius),
                onTap: () {
                  if (statusRight != ButtonStatus.disabled) {
                    onTapRight();
                  }
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(padding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          textRight,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13,
                              color: actionColorDefault,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum Status { ACTIVE, INACTIVE, DISABLED }

class Job2GoRoundedButton extends StatelessWidget {
  final BuildContext context;
  final String text;
  final double radius;
  final double padding;
  final Function onTap;
  final Status status;
  final EdgeInsets? margin;
  final Widget? icon;
  final Color? color;
  final Color? textColor;

  Job2GoRoundedButton(
      {required this.context,
        required this.text,
        required this.radius,
        required this.padding,
        required this.onTap,
        required this.status,
        this.margin,
        this.icon,
        this.color,
        this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      margin ?? EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: status == Status.ACTIVE
                    ? color ?? Colors.red
                    : status == Status.DISABLED
                    ? Colors.grey[400]!
                    : textColor ?? Colors.red),
            borderRadius: BorderRadius.circular(radius)),
        child: Material(
          color: status == Status.ACTIVE
              ? color ?? Colors.red
              : status == Status.DISABLED
              ? Colors.grey[400]!
              : Colors.transparent,
          borderRadius: BorderRadius.circular(radius),
          child: InkWell(
            splashColor: status == Status.DISABLED ? Colors.transparent : null,
            borderRadius: BorderRadius.circular(radius),
            onTap: () {
              if (status != Status.DISABLED)
                onTap();
            },
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    icon ?? Container(),
                    Flexible(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13,
                            color: status == Status.ACTIVE
                                ? textColor ?? Colors.white
                                : status == Status.DISABLED
                                ? Colors.white
                                : status == Status.INACTIVE
                                ? textColor ?? Colors.grey
                                : Colors.red,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

class Job2GoSocialButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  final String image;
  final Color leftColor;
  final Color rightColor;
  const Job2GoSocialButton(
      {Key? key,
        required this.onTap,
        required this.buttonText,
        required this.image,
        required this.leftColor,
        required this.rightColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 12, 8, 12),
              decoration: BoxDecoration(
                  color: leftColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      bottomLeft: Radius.circular(100))),
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
          Container(
              padding: EdgeInsets.all(7.5),
              decoration: BoxDecoration(
                  color: rightColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100))),
              child: SizedBox(
                width: 23,
                height: 23,
                child: Image.asset(image),
              ))
        ],
      ),
    );
  }
}