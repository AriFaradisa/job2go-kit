import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job2go_kit/button.dart';
import 'package:job2go_kit/utils/common_util.dart';
import 'package:job2go_kit/utils/datetime_util.dart';
import 'package:timer_builder/timer_builder.dart';

import 'colors.dart';
// import 'package:job2go/src/colors.dart';
// import 'package:job2go/src/utils/common_util.dart';
// import 'package:job2go/src/utils/datetime_util.dart';
// import 'package:job2go/src/widgets/buttons.dart';
// import 'package:timer_builder/timer_builder.dart';

class AttendanceProgress extends StatefulWidget {
  final TimeOfDay? shiftIn;
  final TimeOfDay? shiftOut;
  final DateTime? clockIn;
  final DateTime? clockOut;
  final Function? onClick;
  final bool isActive;
  final String? status;
  final bool isLoading;
  final bool? inHasImage;
  final bool? outHasImage;
  const AttendanceProgress(
      {Key? key,
      required this.shiftIn,
      required this.shiftOut,
      this.clockIn,
      this.clockOut,
      this.onClick,
      required this.isActive,
      this.status,
      required this.isLoading,
      this.inHasImage,
      this.outHasImage})
      : super(key: key);

  @override
  _AttendanceProgressState createState() => _AttendanceProgressState();
}

class _AttendanceProgressState extends State<AttendanceProgress>
    with TickerProviderStateMixin {
  String shiftIn = "0.0";
  String shiftOut = "0.0";
  String clockIn = "0.0";
  String clockOut = "0.0";
  double time = 0;
  bool isInRightTop = false;
  bool isInRightBottom = false;
  bool isInLeftTop = false;
  bool isInLeftBottom = false;
  bool isOutRightTop = false;
  bool isOutRightBottom = false;
  bool isOutLeftTop = false;
  bool isOutLeftBottom = false;
  bool isBuilding = false;
  int durationInSecond = 0;

  late Animation<double> animation;
  late Animation<double> animation2;

  // late AnimationController controller;
  // late AnimationController controller2;

  writePanel() {
    double unit = double.parse(shiftOut) - double.parse(shiftIn);
    double calcUnit = 6.28 / (unit * 60);

    double clockInMinutes = 0.0; // BERES
    if (double.parse(clockIn) != 0) {
      if (double.parse(clockIn) > double.parse(shiftIn)) {
        clockInMinutes = (double.parse(clockIn) - double.parse(shiftIn)) * 60;
      } else {
        clockInMinutes = -(double.parse(shiftIn) - double.parse(clockIn)) * 60;
      }
      var locateClockIn = (-pi / 2) + (calcUnit * clockInMinutes);
      if (locateClockIn > 3.15) {
        locateClockIn = locateClockIn - 6.28;
        calcIn(locateClockIn);
      } else if (locateClockIn < -3.15) {
        locateClockIn = locateClockIn + 6.28;
        calcIn(locateClockIn);
      } else {
        //standart
        calcIn(locateClockIn);
      }
    }

    double clockOutMinutes = 0.0; //BENER
    clockOutMinutes = (double.parse(clockOut) - double.parse(shiftOut)) * 60;
    var locateClockOut = (-pi / 2) + (calcUnit * clockOutMinutes);
    if (locateClockOut > 3.15) {
      locateClockOut = locateClockOut - 6.28;
      calcOut(locateClockOut);
    } else if (locateClockOut < -3.15) {
      locateClockOut = locateClockOut + 6.28;
      calcOut(locateClockOut);
    } else {
      //standart
      calcOut(locateClockOut);
    }
  }

  calcOut(double locateClockOut) {
    isOutRightTop = false;
    isOutRightBottom = false;
    isOutLeftTop = false;
    isOutLeftBottom = false;
    if (locateClockOut <= 0 && locateClockOut > -1.5) {
      isOutRightTop = true;
    }
    if (locateClockOut <= -1.6 && locateClockOut >= -3.15) {
      isOutLeftTop = true;
    }
    if (locateClockOut > 1.6 && locateClockOut < 3.15) {
      isOutLeftBottom = true;
    }
    if (locateClockOut > 0 && locateClockOut < 1.57) {
      isOutRightBottom = true;
    }
  }

  calcIn(double locateClockIn) {
    isInRightTop = false;
    isInRightBottom = false;
    isInLeftTop = false;
    isInLeftBottom = false;
    if (locateClockIn <= 0 && locateClockIn > -1.5) {
      isInRightTop = true;
    }
    if (locateClockIn <= -1.6 && locateClockIn >= -3.15) {
      isInLeftTop = true;
    }
    if (locateClockIn > 1.6 && locateClockIn < 3.15) {
      isInLeftBottom = true;
    }
    if (locateClockIn > 0 && locateClockIn <= 1.57) {
      isInRightBottom = true;
    }
  }

  @override
  void dispose() {
    // controller.dispose();
    // controller2.dispose();
    super.dispose();
  }

  String twoDigits(int n) {
    if (n > 9) {
      return n.toString();
    } else {
      return "0" + n.toString();
    }
  }

  int getSystemTimeHour() {
    var now = new DateTime.now().toLocal();
    return int.parse(new DateFormat("H").format(now));
  }

  int getSystemTimeMinute() {
    var now = new DateTime.now().toLocal();
    return int.parse(new DateFormat("m").format(now));
  }

  int getSystemTimeSecond() {
    var now = new DateTime.now().toLocal();
    return int.parse(new DateFormat("s").format(now));
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      if (widget.shiftIn != null || widget.shiftOut != null) {
        shiftIn = widget.shiftIn!.hour.toString() +
            "." +
            twoDigits(widget.shiftIn!.minute).toString();
        shiftOut = widget.shiftOut!.hour.toString() +
            "." +
            twoDigits(widget.shiftOut!.minute).toString();
      }
      clockIn = widget.clockIn == null
          ? "0.0"
          : widget.clockIn!.hour.toString() +
              "." +
              twoDigits(widget.clockIn!.minute).toString();
      clockOut = widget.clockOut == null
          ? "0.0"
          : widget.clockOut!.hour.toString() +
              "." +
              twoDigits(widget.clockOut!.minute).toString();
      if (widget.clockIn != null) {
        if (DatetimeUtil.isToday(widget.clockIn!)) {
          time = double.parse(TimeOfDay.now().hour.toString() +
              "." +
              twoDigits(TimeOfDay.now().minute).toString());
        } else {
          time = 0;
        }
      }
      writePanel();
      if (widget.clockIn != null) {
        if (time > 0) {
          if (widget.clockOut != null) {
            durationInSecond =
                widget.clockOut!.difference(widget.clockIn!).inSeconds;
          } else {
            durationInSecond =
                DateTime.now().toLocal().difference(widget.clockIn!).inSeconds;
          }
        } else {
          if (widget.clockOut != null) {
            durationInSecond =
                widget.clockOut!.difference(widget.clockIn!).inSeconds;
          } else {
            DateTime si = DateTime(
                widget.clockIn!.year,
                widget.clockIn!.month,
                widget.clockIn!.day,
                widget.shiftIn!.hour,
                widget.shiftIn!.minute);
            DateTime so = DateTime(
                widget.clockIn!.year,
                widget.clockIn!.month,
                widget.clockIn!.day,
                widget.shiftOut!.hour,
                widget.shiftOut!.minute);
            var diff = so.difference(si).inSeconds;
            var news = so.add(Duration(seconds: (diff ~/ 2)));
            debugPrint(news.toString());
            durationInSecond = news.difference(widget.clockIn!).inSeconds;
          }
        }
      } else {
        durationInSecond = 0;
      }
    } else {
      shiftIn = "0.0";
      shiftOut = "0.0";
      clockIn = "0.0";
      clockOut = "0.0";
      time = 0;
      isInRightTop = false;
      isInRightBottom = false;
      isInLeftTop = false;
      isInLeftBottom = false;
      isOutRightTop = false;
      isOutRightBottom = false;
      isOutLeftTop = false;
      isOutLeftBottom = false;
      isBuilding = false;
    }
    return Container(
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (widget.isLoading) ? "Memuat..." : "$shiftIn",
                  style:
                      TextStyle(fontSize: 16, color: Job2goPalette.blackFont),
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: CustomPaint(
                    foregroundPainter: CircularProgress(
                        time,
                        double.parse(shiftIn),
                        double.parse(shiftOut),
                        double.parse(clockIn),
                        double.parse(clockOut),
                        1.0, // TODO add animation later
                        1.0), // TODO add animation later
                    child: Container(
                      height: 240,
                      width: 240,
                      child: Center(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if ((clockIn != "0.0" && clockOut == "0.0") &&
                              time > 0)
                            TimerBuilder.periodic(Duration(seconds: 1),
                                builder: (context) {
                              if (widget.clockIn != null) {
                                durationInSecond++;
                                // debugPrint("duration in second = " +
                                //     CommonUtil.durationToString(
                                //         durationInSecond));
                              }
                              // return Container();
                              return RichText(
                                text: TextSpan(
                                  text:
                                      '${CommonUtil.durationToStringHourMinute(durationInSecond)}',
                                  style: TextStyle(
                                    fontSize: 36,
                                    color: Job2goPalette.blackSecondary500,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          '${CommonUtil.durationToStringSecond(durationInSecond)}',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Job2goPalette.blackSecondary500,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                          if ((clockIn == "0.0" && clockOut == "0.0") ||
                              (clockIn != "0.0" && clockOut != "0.0") ||
                              ((clockIn != "0.0" && clockOut == "0.0") &&
                                  time == 0))
                            RichText(
                              text: TextSpan(
                                text:
                                    '${CommonUtil.durationToStringHourMinute(durationInSecond)}',
                                style: TextStyle(
                                  fontSize: 36,
                                  color: Job2goPalette.blackSecondary500,
                                  fontWeight: FontWeight.w400,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        '${CommonUtil.durationToStringSecond(durationInSecond)}',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Job2goPalette.blackSecondary500,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          SizedBox(
                            height: 18,
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Flexible(
                                child: Job2GoRoundedButton(
                                    context: context,
                                    text: widget.status == "in"
                                        ? "Clock In"
                                        : "Clock Out",
                                    radius: 20,
                                    padding: 5,
                                    onTap: () {
                                      if (widget.isActive) {
                                        widget.onClick!();
                                      }
                                    },
                                    margin: EdgeInsets.zero,
                                    status: widget.isActive
                                        ? Status.ACTIVE
                                        : Status.DISABLED),
                              ),
                              Spacer(),
                            ],
                          )
                        ],
                      )),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (isInLeftTop && clockIn != "0")
                                Container(
                                  child: Row(
                                    children: [
                                      if (widget.inHasImage!)
                                        Icon(
                                          Icons.image,
                                          size: 12,
                                          color: Colors.grey,
                                        ),
                                      Icon(
                                        Icons.pin_drop,
                                        size: 12,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        "$clockIn",
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                              if (isOutLeftTop && clockOut != "0")
                                Container(
                                  child: Row(
                                    children: [
                                      if (widget.outHasImage!)
                                        Icon(
                                          Icons.image,
                                          size: 12,
                                          color: Colors.grey,
                                        ),
                                      Icon(
                                        Icons.pin_drop,
                                        size: 12,
                                        color: Colors.grey,
                                      ),
                                      Text("$clockOut",
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 13)),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (isInRightTop && clockIn != "0")
                                Container(
                                  child: Row(
                                    children: [
                                      Text("$clockIn",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 13)),
                                      if (widget.inHasImage!)
                                        Icon(
                                          Icons.image,
                                          size: 12,
                                          color: Colors.grey,
                                        ),
                                      Icon(
                                        Icons.pin_drop,
                                        size: 12,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              if (isOutRightTop && clockOut != "0")
                                Container(
                                  child: Row(
                                    children: [
                                      Text("$clockOut",
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 13)),
                                      if (widget.outHasImage!)
                                        Icon(
                                          Icons.image,
                                          size: 12,
                                          color: Colors.grey,
                                        ),
                                      Icon(
                                        Icons.pin_drop,
                                        size: 12,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (isInLeftBottom && clockIn != "0")
                                Container(
                                  child: Row(
                                    children: [
                                      if (widget.inHasImage!)
                                        Icon(
                                          Icons.image,
                                          size: 12,
                                          color: Colors.grey,
                                        ),
                                      Icon(
                                        Icons.pin_drop,
                                        size: 12,
                                        color: Colors.grey,
                                      ),
                                      Text(
                                        "$clockIn",
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                              if (isOutLeftBottom && clockOut != "0")
                                Container(
                                  child: Row(
                                    children: [
                                      if (widget.outHasImage!)
                                        Icon(
                                          Icons.image,
                                          size: 12,
                                          color: Colors.grey,
                                        ),
                                      Icon(
                                        Icons.pin_drop,
                                        size: 12,
                                        color: Colors.grey,
                                      ),
                                      Text("$clockOut",
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 13)),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (isInRightBottom && clockIn != "0")
                                Container(
                                  child: Row(
                                    children: [
                                      Text("$clockIn",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 13)),
                                      if (widget.inHasImage!)
                                        Icon(
                                          Icons.image,
                                          size: 12,
                                          color: Colors.grey,
                                        ),
                                      Icon(
                                        Icons.pin_drop,
                                        size: 12,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              if (isOutRightBottom && clockOut != "0")
                                Container(
                                  child: Row(
                                    children: [
                                      Text("$clockOut",
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 13)),
                                      if (widget.outHasImage!)
                                        Icon(
                                          Icons.image,
                                          size: 12,
                                          color: Colors.grey,
                                        ),
                                      Icon(
                                        Icons.pin_drop,
                                        size: 12,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CircularProgress extends CustomPainter {
  double shiftIn = 0;
  double shiftOut = 0;
  double clockIn = 0;
  double clockOut = 0;
  double time = 0;
  double increase = 1.0;
  double increase2 = 1.0;

  CircularProgress(this.time, this.shiftIn, this.shiftOut, this.clockIn,
      this.clockOut, this.increase, this.increase2);

  @override
  void paint(Canvas canvas, Size size) {
    double unit = shiftOut - shiftIn;
    double calcUnit = 6.28 / (unit * 60);

    double clockInMinutes = 0.0; // BERES
    if (clockIn > shiftIn) {
      clockInMinutes = (clockIn - shiftIn) * 60;
    } else {
      clockInMinutes = -(shiftIn - clockIn) * 60;
    }

    double clockOutMinutes = 0.0; //BENER
    clockOutMinutes = (clockOut - shiftOut) * 60;

    Paint outerCircle = Paint()
      ..strokeWidth = 25
      ..color = Job2goPalette.blueBg
      ..style = PaintingStyle.stroke;

    Paint startArch = Paint()
      ..strokeWidth = 25
      ..color = Colors.black45
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    Paint clockInArch = Paint()
      ..strokeWidth = 25
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    Paint clockOutArch = Paint()
      ..strokeWidth = 25
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    Paint redArch = Paint()
      ..strokeWidth = 25
      ..color = Job2goPalette.redPaleCircle
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    Paint blueArch = Paint()
      ..strokeWidth = 25
      ..color = Job2goPalette.greenPaleCircle
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    Paint greenArch = Paint()
      ..strokeWidth = 25
      ..color = Job2goPalette.greenCircle
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    Paint yellowArc = Paint()
      ..strokeWidth = 25
      ..color = Job2goPalette.yellowCircle.withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    // Paint yellowTransArc = Paint()
    //   ..strokeWidth = 25
    //   ..color = Job2goPalette.yellowCircle.withOpacity(0.4)
    //   ..style = PaintingStyle.stroke
    //   ..strokeCap = StrokeCap.butt;

    Paint whiteLayerTransArc = Paint()
      ..strokeWidth = 25
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;

    Offset offset = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(offset, radius, outerCircle);

    double barSize = 0.0;
    if (time > 0) {
      if (clockOut > 0) {
        barSize = calcUnit * ((clockOut - clockIn) * 60);
      } else {
        barSize = calcUnit * ((time - clockIn) * 60);
      }
    } else {
      if (clockOut > 0) {
        if (clockIn < shiftIn) {
          barSize = calcUnit * ((clockOut - shiftIn) * 60);
        } else {
          barSize = calcUnit * ((clockOut - clockIn) * 60);
        }
      } else {
        barSize = calcUnit * ((shiftOut - clockIn) * 60);
      }
    }

    double barSizeAdv = 0.0;
    if (time > 0) {
      if (clockOut > 0) {
        barSizeAdv = calcUnit * ((clockIn - clockOut) * 60);
      } else {
        barSizeAdv = calcUnit * ((clockIn - shiftIn) * 60);
      }
    } else {
      barSizeAdv = calcUnit * ((clockIn - shiftIn) * 60);
    }
    double barSizeOver = calcUnit * ((clockOut - shiftOut) * 60);
    double barSizeLate = calcUnit * ((clockIn - shiftIn) * 60);
    double barSizeNoCo = calcUnit * (((shiftOut - shiftIn) / 2) * 60);

    if (clockIn > 0) {
      if (time > 0) {
        if (clockIn > shiftIn) {
          canvas.drawArc(
              Rect.fromCircle(center: offset, radius: radius),
              (-pi / 2) + (calcUnit * clockInMinutes),
              barSize * increase,
              false,
              greenArch);
        } else {
          canvas.drawArc(
              Rect.fromCircle(center: offset, radius: radius),
              (-pi / 2) + (calcUnit * clockInMinutes),
              barSize * increase,
              false,
              greenArch);
        }
      } else {
        if (clockIn > shiftIn) {
          canvas.drawArc(
              Rect.fromCircle(center: offset, radius: radius),
              (-pi / 2) + (calcUnit * clockInMinutes),
              barSize * increase,
              false,
              greenArch);
        } else {
          canvas.drawArc(Rect.fromCircle(center: offset, radius: radius),
              (-pi / 2), barSize * increase2, false, greenArch);
        }
      }
    }

    double barSizeAdv2 = 0.0;
    if (time > 0) {
      if (clockOut > 0) {
        barSizeAdv2 = calcUnit * ((clockIn - clockOut) * 60);
      } else {
        if (time < shiftIn) {
          barSizeAdv2 = calcUnit * ((clockIn - time) * 60);
        } else {
          barSizeAdv2 = calcUnit * ((clockIn - shiftIn) * 60);
        }
      }
    } else {
      barSizeAdv2 = calcUnit * ((clockIn - shiftIn) * 60);
    }

    if (clockIn > 0 && (clockIn < shiftIn)) {
      canvas.drawArc(
          Rect.fromCircle(center: offset, radius: radius),
          (-pi / 2) + (calcUnit * clockInMinutes),
          -barSizeAdv * increase,
          false,
          whiteLayerTransArc);
      canvas.drawArc(
          Rect.fromCircle(center: offset, radius: radius),
          (-pi / 2) + (calcUnit * clockInMinutes),
          -barSizeAdv2 * increase,
          false,
          blueArch);
    }

    if (time > 0) {
      if ((clockIn > 0) && (clockOut > 0)) {
        if (clockOut > shiftOut) {
          canvas.drawArc(Rect.fromCircle(center: offset, radius: radius),
              (-pi / 2), barSizeOver * increase2, false, yellowArc);
        }
      }
    } else {
      if (clockOut <= 0) {
        if (clockIn != 0) {
          canvas.drawArc(Rect.fromCircle(center: offset, radius: radius),
              (-pi / 2), barSizeNoCo * increase2, false, yellowArc);
        }
      } else {
        if ((clockIn > 0) && (clockOut > 0)) {
          if (clockOut > shiftOut) {
            canvas.drawArc(Rect.fromCircle(center: offset, radius: radius),
                (-pi / 2), barSizeOver * increase2, false, yellowArc);
          }
        }
      }
    }

    if (clockIn > shiftIn) {
      canvas.drawArc(Rect.fromCircle(center: offset, radius: radius), (-pi / 2),
          barSizeLate * increase2, false, redArch);
    }

    // if ((clockIn > shiftIn) &&
    //     (clockOut > shiftOut) &&
    //     ((clockOut - shiftOut) > (clockIn - shiftIn))) {
    // canvas.drawArc(Rect.fromCircle(center: offset, radius: radius), (-pi / 2),
    //     barSizeAdv * increase2, false, whiteLayerTransArc);
    //   canvas.drawArc(Rect.fromCircle(center: offset, radius: radius), (-pi / 2),
    //       barSizeAdv * increase2, false, yellowTransArc);
    // }

    canvas.drawArc(Rect.fromCircle(center: offset, radius: radius),
        (-pi / 2) + 0, 0.01, false, startArch);

    if (clockIn > 0) {
      canvas.drawArc(Rect.fromCircle(center: offset, radius: radius),
          (-pi / 2) + (calcUnit * clockInMinutes), 0.01, false, clockInArch);
    }

    if (clockOut > 0) {
      canvas.drawArc(Rect.fromCircle(center: offset, radius: radius),
          (-pi / 2) + (calcUnit * clockOutMinutes), 0.01, false, clockOutArch);
    }
  }

  @override
  bool shouldRepaint(covariant CircularProgress oldDelegate) => true;
}
