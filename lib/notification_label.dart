import 'package:flutter/material.dart';
import 'package:job2go_kit/button.dart';

import 'colors.dart';

class NotifWarning extends StatelessWidget {
  final Widget child;
  final Color? overrideColor;
  final Color? overrideIconColor;
  final bool? hasButton;
  final String? btnText;
  final Function? onClick;
  final Function? onDetailClick;

  NotifWarning(
      {required this.child,
      this.overrideColor,
      this.overrideIconColor,
      this.hasButton,
      this.btnText,
      this.onClick,
      this.onDetailClick,
      });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Job2goPalette.greySecondary5,
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              GestureDetector(
                onTap: (){
                  onDetailClick!();
                },
                child: Container(
                  height: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 6,
                  ),
                  decoration: BoxDecoration(
                    color: overrideColor ?? Job2goPalette.greySecondary50,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                  child: Icon(
                    Icons.info_outline,
                    color: overrideIconColor ?? Job2goPalette.greySecondary200,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 8,
                  ),
                  child: child,
                ),
              ),
              if (hasButton ?? false)
                Flexible(
                  flex: 1,
                  child: Job2GoRoundedButton(
                      context: context,
                      text: btnText ?? "",
                      radius: 30,
                      padding: 10,
                      margin: EdgeInsets.all(8),
                      onTap: () {
                        onClick!();
                      },
                      status: Status.ACTIVE),
                )
            ],
          ),
        ),
      ),
    );
  }
}
