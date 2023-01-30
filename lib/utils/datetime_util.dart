import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatetimeUtil {

  static String convertToYear(String date) {
    final f = new DateFormat('yyyy');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToMonthYear(String date) {
    final f = new DateFormat('MMMM yyyy');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToReadable(String date) {
    final f = new DateFormat('dd MMM yyyy');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToReadableFull(String date) {
    final f = new DateFormat('dd MMMM yyyy');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToReadableFullX(String date) {
    final f = new DateFormat('dd MMMM yyyy HH:mm');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToReadableFullXX(String date) {
    final f = new DateFormat('dd MMM yyyy HH:mm');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToReadableFullZ(String date) {
    if (date == "") {
      return "";
    }
    final f = new DateFormat('dd MMM yyyy');
    DateFormat dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ssZ");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToJsonTime(String date) {
    if (date == "") {
      return "";
    }
    final f = new DateFormat('yyyy-MM-ddTHH:mm:ssZ');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToReadableFullZKini(int millis) {
    var dt = DateTime.fromMillisecondsSinceEpoch(millis).toLocal();
    // print("local: "+dt.toString());
    // print(DateTime.parse('2018-09-07T17:29:12+02:00').isUtc);
    // var utc = DateTime.parse("2021-12-07T06:56:57+02:00");
    // print("Utc: "+utc.toString());
    // print("Local: "+utc.toLocal().toString());
    var d24 = DateFormat('dd MMM yyyy, hh:mm').format(dt);

    // final f = new DateFormat('dd MMM yyyy HH:mm');
    // DateFormat dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");
    // DateTime dateTime = dateFormat.parse(millis.toString()).toLocal();
    // return f.format(dateTime);
    return d24;
  }

  static String convertToReadableFullssZ(String date) {
    final f = new DateFormat('yyyy-mm-ddTHH:mm:ssZ');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToReadableWithoutTFullZ(String date) {
    final f = new DateFormat('dd MMM yyyy');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToReadableDayMonth(String date) {
    final f = new DateFormat('dd MMM');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToReadableWithoutTFullZToTime(String date) {
    if (date == null || date == "") {
      return "-";
    }
    final f = new DateFormat('HH:mm');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ssZ");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToReadableWithoutTFullsssZ(String date) {
    final f = new DateFormat('dd MMM yyyy');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSSZ");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToReadableWithoutTFullsssZWithTime(String date) {
    final f = new DateFormat('dd MMM yyyy - HH:mm');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSSZ");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToReadableWithTFullsssZWithTime(String date) {
    final f = new DateFormat('dd MMM yyyy - HH:mm');
    DateFormat dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToReadableWithoutTFullsssZx(String date) {
    debugPrint("dateUtil: ${date}");
    final f = new DateFormat('yyyy-MM-dd');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ssZ");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToReadableWithoutTFullsssZdm(String date) {
    final f = new DateFormat('dd MMM');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ssZ");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToReadableWithoutTFullsssZdmy(String date) {
    final f = new DateFormat('dd MMM yyyy');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ssZ");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToTime(String date) {
    final f = new DateFormat('HH:mm a');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToTime2(String date) {
    final f = new DateFormat('HH:mm');
    DateFormat dateFormat = DateFormat("HH:mm:ss");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToTimeNoSecond(String date) {
    final f = new DateFormat('HH:mm');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ssZ");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToTimeFront(String date) {
    final f = new DateFormat('HH');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToTimeBack(String date) {
    final f = new DateFormat('mm a');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToDefault(String date) {
    return date + " 00:00:00";
  }

  static String convertToDefaultFromDateTime(String date) {
    final f = new DateFormat('yyyy-MM-dd');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertWithMonthAndTime(String date) {
    final f = new DateFormat('dd MMM yyyy - HH:mm');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToDefaultFromDateTimeWithT(String date) {
    final f = new DateFormat('yyyy-MM-dd');
    DateFormat dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToYearMonth(String date) {
    final f = new DateFormat('yyyy-MM');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToDefaultFromFullDateTime(String date) {
    final f = new DateFormat('yyyy-MM-dd');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToDefaultFromDateTime2(String date) {
    final f = new DateFormat('yyyy-MM-ddTHH:mm:ss');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToDefaultTimezone(String date) {
    final f = new DateFormat('yyyy-MM-ddTHH:mm:ss.SSSSSS');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToDefaultTimezoneWithSSZ(String date) {
    final f = new DateFormat('yyyy-MM-ddTHH:mm:ss.SSZ');
    DateFormat dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS");
    DateTime dateTime = dateFormat.parse(date);
    return f.format(dateTime);
  }

  static String convertToDefaultTimezoneWithZ(String? date) {
    final f = new DateFormat('yyyy-MM-ddTHH:mm:ss.SSSZ');
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime dateTime = dateFormat.parse(date!);
    return f.format(dateTime);
  }

  static String convertToDayIndonesia(int day, {bool isShort = false}) {
    var result;
    switch (day) {
      case 1:
        result = isShort ? "Sen" : "Senin";
        break;
      case 2:
        result = isShort ? "Sel" : "Selasa";
        break;
      case 3:
        result = isShort ? "Rab" : "Rabu";
        break;
      case 4:
        result = isShort ? "Kam" : "Kamis";
        break;
      case 5:
        result = isShort ? "Jum" : "Jumat";
        break;
      case 6:
        result = isShort ? "Sab" : "Sabtu";
        break;
      case 7:
        result = isShort ? "Min" : "Minggu";
        break;
      default:
        result = "";
    }
    return result;
  }

  static String convertToMonthName(DateTime date) {
    String result = "";
    final f = new DateFormat('MMMM');
    final y = new DateFormat('yyyy');
    switch (f.format(date)) {
      case "January":
        result = "Januari";
        break;
      case "February":
        result = "Februari";
        break;
      case "March":
        result = "Maret";
        break;
      case "April":
        result = "April";
        break;
      case "May":
        result = "Mei";
        break;
      case "June":
        result = "Juni";
        break;
      case "July":
        result = "Juli";
        break;
      case "August":
        result = "Agustus";
        break;
      case "September":
        result = "September";
        break;
      case "October":
        result = "Oktober";
        break;
      case "November":
        result = "November";
        break;
      case "December":
        result = "Desember";
        break;
      default:
        f.format(date);
    }
    return result + " " + y.format(date);
  }

  static String convertIntToMonthName(int index) {
    String result = "";
    switch (index) {
      case 1:
        result = "Januari";
        break;
      case 2:
        result = "Februari";
        break;
      case 3:
        result = "Maret";
        break;
      case 4:
        result = "April";
        break;
      case 5:
        result = "Mei";
        break;
      case 6:
        result = "Juni";
        break;
      case 7:
        result = "Juli";
        break;
      case 8:
        result = "Agustus";
        break;
      case 9:
        result = "September";
        break;
      case 10:
        result = "Oktober";
        break;
      case 11:
        result = "November";
        break;
      case 12:
        result = "Desember";
        break;
      default:
        "-";
    }
    return result;
  }

  static String convertToSectionHeader(String date) {
    final f = new DateFormat('dd MMMM yyyy');
    var now = DateTime.now();
    var today = DateTime(now.year, now.month, now.day);
    var yesterday = DateTime(now.year, now.month, now.day - 1);
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime dateTime = dateFormat.parse(date);
    // final aDateTime = ...
    DateTime aDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
    if (aDate == today) {
      return "Hari Ini";
    } else if (aDate == yesterday) {
      return "Kemarin";
    } else {
      return f.format(dateTime);
    }
  }

  static String convertToDayDate(DateTime date) {
    final f = new DateFormat('dd MMMM yyyy : HH:mm');
    final day = convertToDayIndonesia(date.weekday);
    return '$day, ${f.format(date)}';
  }

  static bool isToday(DateTime dateTime) {
    final now = DateTime.now();
    // final now = DateTime.parse("2022-01-18T00:00:00");
    debugPrint("today: $now");
    debugPrint("cutoff: $dateTime");
    final today = DateTime(now.year, now.month, now.day);
    final dateToCheck = dateTime;
    final aDate =
        DateTime(dateToCheck.year, dateToCheck.month, dateToCheck.day);
    if (aDate == today) {
      return true;
    } else {
      return false;
    }
  }

  static int totalDaysInMonth(DateTime date){
    var firstDayThisMonth = new DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = new DateTime(firstDayThisMonth.year, firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }

  static String prefixMonth(DateTime date){
    if(int.parse(date.month.toString())<10){
      return "0${date.month.toString()}";
    }
    return "${date.month.toString()}";
  }

  static String convertMinuteToReadable(int duration) {
    var hour = duration % 60;
    var minute = ((duration / 60) - hour) % 10;
    return "$hour jam $minute menit";
  }

  static String durationToString(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')} jam ${parts[1].padLeft(2, '0')} menit';
  }

  static String durationInSecondToString(int duration) {
    int h, m, s;
    h = duration ~/ 3600;
    m = ((duration - h * 3600)) ~/ 60;
    s = duration - (h * 3600) - (m * 60);
    return '$h jam $m menit $s detik';
  }

  static String dateToTimeZ(DateTime date) {
    var formattedDate = DateFormat('yyyy-MM-dd').format(date);

    return formattedDate + 'T00:00:00Z';
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }
}
