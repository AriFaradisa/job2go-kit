import 'package:flutter/material.dart';

import 'colors.dart';

class SquareRoundCheckbox extends StatefulWidget {
  final bool value;
  final Function onTap;
  final double? size;
  final double? sizeChild;
  SquareRoundCheckbox(
      {required this.value, required this.onTap, this.size, this.sizeChild});
  @override
  _SquareRoundCheckboxState createState() => _SquareRoundCheckboxState();
}

class _SquareRoundCheckboxState extends State<SquareRoundCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Container(
          child: Container(
            height: widget.size ?? 16,
            width: widget.size ?? 16,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                    color: widget.value ? Colors.red : Colors.grey, width: 2),
                color: widget.value ? Job2goPalette.red : Colors.white),
            child: widget.value
                ? SizedBox(
                    height: widget.sizeChild ?? 12,
                    width: widget.sizeChild ?? 12,
                    child: Icon(Icons.check,
                        color: Colors.white, size: widget.sizeChild ?? 12),
                  )
                : Container(),
          ),
        ));
  }
}

class SquareRoundContainerCheckbox extends StatefulWidget {
  final bool value;
  final double? size;
  final double? sizeChild;
  SquareRoundContainerCheckbox(
      {required this.value, this.size, this.sizeChild});
  @override
  _SquareRoundContainerCheckboxState createState() =>
      _SquareRoundContainerCheckboxState();
}

class _SquareRoundContainerCheckboxState
    extends State<SquareRoundContainerCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
      padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
      child: Container(
        height: widget.size ?? 16,
        width: widget.size ?? 16,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            border: Border.all(
                color: widget.value ? Colors.red : Colors.grey, width: 2),
            color: widget.value ? Job2goPalette.red : Colors.white),
        child: widget.value
            ? SizedBox(
                height: widget.sizeChild ?? 12,
                width: widget.sizeChild ?? 12,
                child: Icon(Icons.check,
                    color: Colors.white, size: widget.sizeChild ?? 12),
              )
            : Container(),
      ),
    ));
  }
}

class SquareCheckbox extends StatefulWidget {
  final bool value;
  final Function onTap;
  final String title;
  SquareCheckbox(
      {required this.value, required this.onTap, required this.title});
  @override
  _SquareCheckboxState createState() => _SquareCheckboxState();
}

class _SquareCheckboxState extends State<SquareCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            // border: Border.all(color: Colors.grey[400]),
            color: widget.value ? Colors.grey[600] : Colors.transparent,
          ),
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: widget.value
                    ? Text(widget.title,
                        style: TextStyle(color: Colors.white, fontSize: 12))
                    : Text(widget.title,
                        style: TextStyle(
                            color: Job2goPalette.blackFont, fontSize: 12)),
              ),
            ),
          ),
        ));
  }
}

// class RoundedRadioNormal extends StatefulWidget {
//   final bool value;
//   final Function onTap;
//   final String title;
//   RoundedRadioNormal(
//       {required this.value, required this.onTap, required this.title});
//   @override
//   _RoundedRadioNormalState createState() => _RoundedRadioNormalState();
// }

// class _RoundedRadioNormalState extends State<RoundedRadioNormal> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () {
//           widget.onTap();
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(100),
//             // border: Border.all(color: Colors.grey[400]),
//             color: widget.value ? Colors.grey[600] : Colors.transparent,
//           ),
//           child: Container(
//             child: Padding(
//               padding: EdgeInsets.all(5.0),
//               child: Center(
//                 child: widget.value
//                     ? Text(widget.title,
//                         style: TextStyle(color: Colors.white, fontSize: 12))
//                     : Text(widget.title,
//                         style: TextStyle(
//                             color: Job2goPalette.blackFont, fontSize: 12)),
//               ),
//             ),
//           ),
//         ));
//   }
// }

class RoundedRadioOnly extends StatefulWidget {
  final bool value;
  final Function onTap;
  final double? size;
  RoundedRadioOnly({required this.value, required this.onTap, this.size});
  @override
  _RoundedRadioOnlyState createState() => _RoundedRadioOnlyState();
}

class _RoundedRadioOnlyState extends State<RoundedRadioOnly> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Row(
          children: [
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: widget.size != null ? widget.size : 24,
                    width: widget.size != null ? widget.size : 24,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.white,
                        border: Border.all(color: Colors.grey)),
                  ),
                  widget.value
                      ? Container(
                          height: widget.size != null ? widget.size! - 9.0 : 15,
                          width: widget.size != null ? widget.size! - 9.0 : 15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Job2goPalette.red),
                        )
                      : Container()
                ],
              ),
            ),
          ],
        ));
  }
}

class RoundedRadio extends StatefulWidget {
  final bool value;
  final Function onTap;
  final String text;
  RoundedRadio({required this.value, required this.onTap, required this.text});
  @override
  _RoundedRadioState createState() => _RoundedRadioState();
}

class _RoundedRadioState extends State<RoundedRadio> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Container(
            margin: EdgeInsets.only(right: 10, top: 10, bottom: 5),
            padding: EdgeInsets.fromLTRB(16, 3, 16, 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Job2goPalette.red, width: 2),
                color: widget.value ? Job2goPalette.red : Colors.white),
            child: Center(
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: widget.value ? Colors.white : Job2goPalette.red,
                    fontSize: 13),
              ),
            )));
  }
}

class CircleStep extends StatefulWidget {
  final bool value;
  final Function onTap;
  final String text;
  CircleStep({required this.value, required this.onTap, required this.text});
  @override
  _CircleStepState createState() => _CircleStepState();
}

class _CircleStepState extends State<RoundedRadio> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Job2goPalette.red, width: 2),
                color: widget.value ? Job2goPalette.red : Colors.green),
            child: Center(
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            )));
  }
}

class RadioImage extends StatelessWidget {
  final bool value;
  final Function onTap;
  final String image;

  const RadioImage(
      {required Key key,
      required this.value,
      required this.onTap,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(
                    color: value ? Job2goPalette.red : Colors.transparent,
                    width: 2)),
            child: Center(
              child: Opacity(
                opacity: value ? 1.0 : 0.5,
                child: Image.asset(
                  image,
                ),
              ),
            )));
  }
}

class RoundedRadioNormal extends StatefulWidget {
  final bool value;
  final Function onTap;
  final String text;
  final double? size;
  RoundedRadioNormal(
      {required this.value,
      required this.onTap,
      required this.text,
      this.size});
  @override
  _RoundedRadioNormalState createState() => _RoundedRadioNormalState();
}

class _RoundedRadioNormalState extends State<RoundedRadioNormal> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Row(
          children: [
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 16,
                    width: 15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // color: Colors.white,
                        border: Border.all(color: Colors.grey)),
                  ),
                  widget.value
                      ? Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Job2goPalette.red),
                        )
                      : Container()
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              widget.text,
              style: TextStyle(fontSize: widget.size ?? 13),
            )
          ],
        ));
  }
}

class SquareCheckboxNormal extends StatefulWidget {
  final bool value;
  final Function onTap;
  final String text;
  SquareCheckboxNormal(
      {required this.value, required this.onTap, required this.text});
  @override
  _SquareCheckboxNormalState createState() => _SquareCheckboxNormalState();
}

class _SquareCheckboxNormalState extends State<SquareCheckboxNormal> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Row(
          children: [
            Container(
              child: widget.value
                  ? Container(
                      height: 19,
                      width: 19,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle, color: Colors.red),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 12,
                      ),
                    )
                  : Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          // color: Colors.white,
                          border: Border.all(color: Colors.grey)),
                    ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                widget.text,
                style: TextStyle(fontSize: 13),
              ),
            )
          ],
        ));
  }
}

class SubFilterCheckbox extends StatefulWidget {
  final bool value;
  final Function onTap;
  final String title;
  SubFilterCheckbox(
      {required this.value, required this.onTap, required this.title});
  @override
  _SubFilterCheckboxState createState() => _SubFilterCheckboxState();
}

class _SubFilterCheckboxState extends State<SubFilterCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey),
                color: widget.value ? Colors.grey[600] : Colors.transparent,
              ),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Center(
                    child: widget.value
                        ? Text(widget.title,
                            style: TextStyle(color: Colors.white, fontSize: 12))
                        : Text(widget.title,
                            style: TextStyle(
                                color: Job2goPalette.blackFont, fontSize: 12)),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class RoundedCheckboxText extends StatefulWidget {
  final bool value;
  final Function onTap;
  final String title;
  RoundedCheckboxText(
      {required this.value, required this.onTap, required this.title});
  @override
  _RoundedCheckboxTextState createState() => _RoundedCheckboxTextState();
}

class _RoundedCheckboxTextState extends State<RoundedCheckboxText> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: widget.value ? Colors.red : Job2goPalette.blackFont),
            borderRadius: BorderRadius.circular(100),
            color: widget.value ? Colors.red[100] : Colors.transparent,
          ),
          child: Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Center(
                child: widget.value
                    ? Text(widget.title,
                        style: TextStyle(color: Colors.red, fontSize: 13))
                    : Text(widget.title,
                        style: TextStyle(
                            color: Job2goPalette.blackFont, fontSize: 13)),
              ),
            ),
          ),
        ));
  }
}

class CheckboxSquare extends StatefulWidget {
  final bool? isChecked;
  final Function? onClick;

  CheckboxSquare({@required this.isChecked, this.onClick});

  @override
  _CheckboxSquareState createState() => _CheckboxSquareState();
}

class _CheckboxSquareState extends State<CheckboxSquare> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onClick!(!widget.isChecked!);
      },
      child: Container(
          height: 17,
          width: 17,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(width: 0.5, color: Colors.grey),
          ),
          child: widget.isChecked!
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 17,
                      width: 17,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(
                            width: 0.5, color: Job2goPalette.red),
                        color: Job2goPalette.red,
                      ),
                    ),
                    Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    )
                  ],
                )
              : null),
    );
  }
}