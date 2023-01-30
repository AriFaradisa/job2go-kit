import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../colors.dart';
// import 'package:job2go/src/colors.dart';
// import 'package:job2go/src/models/point/history_point_response.dart' as history;
//
// import 'package:intl/intl.dart';

class CommonUtil {
  static bool validateKtp(String email) {
    String pattern =
        r"^(1[1-9]|21|[37][1-6]|5[1-3]|6[1-5]|[89][12])\d{2}\d{2}([04][1-9]|[1256][0-9]|[37][01])(0[1-9]|1[0-2])\d{2}\d{4}$";
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(email);
  }

  static bool validateEmail(String email) {
    String pattern = r"^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$";
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(email);
  }

  static bool validatePhoneNumber(String phoneNumber) {
    String pattern = r"8\d{7,14}";
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(phoneNumber);
  }

  static bool validatePhoneNumberE164(String phoneNumber) {
    String pattern = r"^\+?[1-9]\d{1,14}$";
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(phoneNumber);
  }

  static bool validateHomePhoneNumber(String phoneNumber) {
    String pattern = r"2\d{6,14}";
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(phoneNumber);
  }

  static bool validateStandardPhoneNumber(String phoneNumber) {
    String pattern = r"\+628\d{7,14}";
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(phoneNumber);
  }

  static bool hasPrefixPhoneNumber(String phoneNumber) {
    String pattern = r"\+62";
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(phoneNumber);
  }

  static bool isPhoneE164(String phoneNumber) {
    // String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    String pattern = r'(^\+?[1-9]\d{1,14}$)';
    RegExp regExp = new RegExp(pattern);
    if (phoneNumber.length == 0) {
      return false;
    }
    else if (!regExp.hasMatch(phoneNumber)) {
      return false;
    }
    return true;
  }

  static bool isDigitOnly(String string) {
    String pattern = r"^\+?[0-9]*$";
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(string);
  }

  static String convertToRupiah(dynamic value) {
    int val = 0;
    switch (value.runtimeType) {
      case int:
        val = value;
        break;
      case String:
        try {
          val = int.parse(value);
        } catch (x) {
          val = double.parse(value).floor();
        }
        break;
      case double:
        val = value.floor();
        break;
      default:
        val = 0;
    }
    final formatter = new NumberFormat("#,###", "id");
    return "Rp " + formatter.format(val);
  }

  static String typePaid(String value) {
    String val = value.toLowerCase();
    if (val == "prepaid") {
      return "Prabayar";
    }
    return "Pascabayar";
  }

  static String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  static String replaceCharAt(String oldString, int index, String newChar) {
    return oldString.substring(0, index) +
        newChar +
        oldString.substring(index + 1);
  }

  //+628776665
  static String cleanupPhoneNumber(String phoneNumbers) {
    debugPrint("phoneNumber: ${phoneNumbers}");
    var phone = phoneNumbers;
    if (phone.startsWith("0")) {
      phone = phone.replaceAll("00", "");
    }
    if (phone.startsWith("0")) {
      return replaceCharAt(phone, 0, "+62");
    } else if (phone.startsWith("8")) {
      return "+62" + phone;
    } else if (phone.startsWith("62")) {
      return "+" + phone;
    } else {
      return phone;
    }
  }

  //628776665
  static String cleanupPhoneNumberNoPlus(String phoneNumbers) {
    debugPrint("phoneNumber: ${phoneNumbers}");
    var phone = phoneNumbers;
    if (phone.startsWith("0")) {
      phone = phone.replaceAll("00", "");
    }
    if (phone.startsWith("0")) {
      return replaceCharAt(phone, 0, "62");
    }
    else if (phone.startsWith("8")) {
      return "62" + phone;
    }
    else if (phone.startsWith("62")) {
      return phone;
    }
    else {
      return phone;
    }
  }

  //8233556
  static String cleanupPhoneNumberNoPrefix(String phoneNumber) {
    if (phoneNumber.startsWith("8")) {
      return phoneNumber;
    } else if (phoneNumber.startsWith("2")) {
      return phoneNumber;
    } else if (phoneNumber.startsWith("+62")) {
      return phoneNumber.replaceRange(0, 3, "");
    } else if (phoneNumber.startsWith("62")) {
      return phoneNumber.replaceRange(0, 2, "");
    } else {
      return phoneNumber;
    }
  }

  //081234445
  static String cleanupPhoneNumberInverse(String phoneNumber) {
    if (phoneNumber.startsWith("8")) {
      return "0" + phoneNumber;
    } else if (phoneNumber.startsWith("2")) {
      return "0" + phoneNumber;
    } else if (phoneNumber.startsWith("+62")) {
      return phoneNumber.replaceRange(0, 3, "0");
    } else if (phoneNumber.startsWith("62")) {
      return phoneNumber.replaceRange(0, 2, "0");
    } else {
      return phoneNumber;
    }
  }

  static String cleanupPhoneNumberInverseWithoutZero(String phoneNumber) {
    if (phoneNumber.startsWith("0")) {
      return phoneNumber.replaceRange(0, 1, "");
    } else if (phoneNumber.startsWith("8")) {
      return phoneNumber;
    } else if (phoneNumber.startsWith("2")) {
      return phoneNumber;
    } else if (phoneNumber.startsWith("+62")) {
      return phoneNumber.replaceRange(0, 3, "");
    } else if (phoneNumber.startsWith("62")) {
      return phoneNumber.replaceRange(0, 2, "");
    } else {
      return phoneNumber;
    }
  }

  static String phoneNumberFormatter(String phoneNumber) {
    var result;
    if ((phoneNumber.length > 10) && (phoneNumber.length < 14)) {
      result = phoneNumber.substring(0, 4) +
          " " +
          phoneNumber.substring(4, 7) +
          " " +
          phoneNumber.substring(7);
    } else {
      result = "No. HP tidak valid";
    }
    return result;
  }

  static bool validateReferal(String referal) {
    String pattern = r"^[a-zA-Z0-9]+$";
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(referal);
  }

  static List<String> getRoleList(String role) {
    return role == '' ? [] : role.split(",");
  }

  static String convertRolesEnum(String value) {
    switch (value) {
      case "role_owner":
        return "Owner";
      case "role_employee":
        return "Employee";
      case "role_hr":
        return "HR";

      case "role_finance":
        return "Finance";
      case "role_manager":
        return "Manager";
      case "role_worker":
        return "Worker";
      case "role_admin":
        return "Admin";
      case "role_support":
        return "Support";
      default:
    }
    return "";
  }

  static String convertDisplayEnum(String value) {
    switch (value) {
      case "top_shelf":
        return "Etalase Atas";
      case "in_shelf":
        return "Etalase Dalam";
      case "rack":
        return "Rak ";
      default:
    }
    return "";
  }

  static String convertMerchantCategoryEnum(String value) {
    switch (value) {
      case "store":
        return "Toko Kelontong";
      case "modern market":
        return "Minimarket";
      case "kiosk":
        return "Kios";
      case "hawker":
        return "Pedagang Kaki Lima";
      default:
    }
    return "";
  }

  static String convertEconRelationshipEnum(String value) {
    switch (value) {
      case "spouse":
        return "Pasangan";
      case "parent":
        return "Orang Tua";
      case "friend":
        return "Teman";
      case "colleagues":
        return "Rekan";
      case "neighbor":
        return "Tetangga";
      case "aunt":
        return "Tante";
      case "uncle":
        return "Paman";
      case "grandmother":
        return "Nenek";
      case "grandfather":
        return "Kakek";

      case "Saudara":
        return "Suadara";
      case "Ibu":
        return "Ibu";
      case "Ayah":
        return "Ayah";
      case "Pasangan":
        return "Pasangan";
      case "Kerabat":
        return "Kerabat";

      default:
    }
    return "";
  }

  static String cleanupCity(String value) {
    var cities = value.split(" ");
    if (cities.length > 1) {
      cities.removeWhere((element) => element.toLowerCase() == "kota");
      return cities[0];
    } else {
      return value;
    }
  }

  // static String formatDuration(Duration d) {
  //   String f(int n) {
  //     return n.toString().padLeft(2, '0');
  //   }

  //   d += Duration(microseconds: 999999);
  //   return "${f(d.inHours)}:${f(d.inMinutes % 60)}:${f(d.inSeconds % 60)}";
  // }

  static String durationToString(int second) {
    var hour = second ~/ 3600;
    var minute = (second - (hour * 3600)) ~/ 60;
    var seconds = second - (hour * 3600) - (minute * 60);
    return '${hour.toString().padLeft(2, '0')} : ${minute.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}';
  }

  static String durationToStringHourMinute(int second) {
    var hour = second ~/ 3600;
    var minute = (second - (hour * 3600)) ~/ 60;
    return '${hour.toString().padLeft(2, '0')}.${minute.toString().padLeft(2, '0')}.';
  }

  static String durationToStringSecond(int second) {
    var hour = second ~/ 3600;
    var minute = (second - (hour * 3600)) ~/ 60;
    var seconds = second - (hour * 3600) - (minute * 60);
    return '${seconds.toString().padLeft(2, '0')}';
  }

  static String leaveType(String value) {
    switch (value) {
      case "holiday_leave":
        return "Cuti Liburan";
        break;
      case "sick_leave":
        return "Cuti Saki";
        break;
      case "marital_leave":
        return "Cuti Menikah";
        break;
      case "maternity_leave":
        return "Cuti Melahirkan";
        break;
    }
    return "-";
  }

  static String bankNameToDetailName(String bankName) {
    Map<String, String> items = {
      "gopay": "Go-Pay",
      "bri": "PT. BANK RAKYAT INDONESIA (PERSERO)",
      "bca": "PT. BANK CENTRAL ASIA TBK.",
      "bni": "PT. BANK NEGARA INDONESIA (PERSERO)",
      "mandiri": "PT. BANK MANDIRI (PERSERO) TBK.",
      "cimb": "PT. BANK CIMB NIAGA TBK.",
      "danamon": "PT. BANK DANAMON INDONESIA TBK.",
      "panin": "PT. PANIN BANK TBK.",
      "sinarmas": "PT. BANK SINARMAS",
      "jatim": "PT. BANK PEMBANGUNAN DAERAH JAWA TENGAH",
      "jateng": "PT. BANK PEMBANGUNAN DAERAH JAWA TENGAH",
      "anz": "PT. BANK ANZ INDONESIA",
      "dbs": "PT. BANK DBS INDONESIA",
      "bukopin": "PT. BANK BUKOPIN TBK.",
      "permata": "PT. BANK PERMATA TBK.",
      "mega_tbk": "PT. BANK MEGA TBK.",
      "btn": "PT. BANK TABUNGAN NEGARA (PERSERO)",
      "hsbc": "PT. BANK HSBC INDONESIA",
      "maybank": "PT. BANK MAYBANK INDONESIA TBK.",
      "btpn": "PT. BANK BTPN",
      "ocbc": "PT. BANK OCBC NISP TBK.",
      "stanchard": "STANDARD CHARTERED BANK"
    };
    String detail = "";
    items.forEach((key, value) {
      if (key == bankName) {
        detail = value;
      }
    });
    return detail;
  }

  static String hintNoRekOrNoPhone(String bankKey) {
    if (bankKey == "gopay" || bankKey == "ovo") {
      return "No Handphone";
    }
    return "Nomer Rekening";
  }

  static String hintOwnerRekOrOwnerPhone(String bankKey) {
    if (bankKey == "gopay" || bankKey == "ovo") {
      return "Nama Pemilik Akun";
    }
    return "Pemilik Rekening";
  }

  static String convertEnumStatusKini(String value) {
    // String status = "-";
    switch (value.toLowerCase()) {
      case 'success':
        return 'Berhasil';
        break;
      case 'failed':
        return 'Gagal';
        break;
      case 'pending':
      case 'on_process':
      case 'processing':
        return 'Proses pending';
        break;
      case 'inquiry':
        return 'Proses inquiry';
        break;
      case 'pending':
        return 'Menunggu Mengajuan';
        break;
    }
    return value.toLowerCase();
  }

  static Color convertEnumStatusColorKini(String value) {
    switch (value.toLowerCase()) {
      case 'success':
        return Colors.green;
        break;
      case 'failed':
        return Colors.red;
        break;
      case 'inquiry':
        return Colors.orangeAccent;
        break;
      case 'on_process':
      case 'processing':
        return Colors.blue;
        break;
      case 'pending':
        return Colors.orangeAccent;
        break;
    }
    return Colors.grey;
  }

  static String convertDisplayPPOB(String value) {
    switch (value) {
      case "cashout":
        return "Pinjaman";

      case "pdam":
        return "PDAM";
      case "token_listrik":
        return "Token";
      case "pln_pascabayar":
        return "Listrik";

      case "bpjs":
        return "BPJS";
      case "emoney":
        return "E-Wallet";
      case "belanja":
        return "Belanja";

      case "pulsa":
        return "Pulsa";
      case "pascabayar":
        return "Pascabayar";

      case "banking":
        return "Banking";
      case "edukasi":
        return "Edukasi";
      case "games":
        return "Games";
      case "streaming":
        return "Streaming";
      case "multifinance":
        return "Multifinance";
      case "asuransi":
        return "Asuransi";
      case "property":
        return "Property";
      case "pay_tv":
        return "TV";
      case "pajak":
        return "Pajak";
      default:
    }
    return "";
  }

  static String convertDisplayTitleHistoryKini(String value) {
    String val = value.toLowerCase();
    if (val.contains("pdam")) {
      return "PDAM";
    }
    if (val.contains("cashout")) {
      return "Pinjaman";
    }
    if (val.contains("gopay")) {
      return "Go-Pay";
    }
    if (val.contains("ovo")) {
      return "OVO";
    }
    if (val.contains("token_pln")) {
      return "Listrik";
    }
    if (val.contains("pln_pascabayar")) {
      return "Listrik Pascabayar";
    }
    if (val.contains("indosat") ||
        val.contains("xl") ||
        val.contains("telkomsel") ||
        val.contains("axis") ||
        val.contains("three") ||
        val.contains("smartfren") ||
        val.contains("tri")) {
      return "Pulsa";
    }
    return "";
  }

  static String convertDisplayTitleHistoryNewKini(String value) {
    String val = value.toLowerCase();
    if (val.contains("pdam")) {
      return "PDAM";
    }
    if (val.contains("cashout")||val.contains("cash_out")) {
      return "Tarik Tunai";
    }
    if (val.contains("gopay")) {
      return "Go-Pay";
    }
    if (val.contains("ovo")) {
      return "OVO";
    }
    if (val.contains("emoney")) {
      return "E-Wallet";
    }
    if (val.contains("token_pln")) {
      return "Token Listrik";
    }
    if (val.contains("pln_pascabayar")) {
      return "Listrik Pascabayar";
    }
    if (val.contains("telkomsel_pascabayar")) {
      return "Telkomsel Pascabayar";
    }
    if (val.contains("xl_pascabayar")) {
      return "XL Home";
    }
    if (val == "indosat" ||
        val == "xl" ||
        val == "pulsa" ||
        val == "telkomsel" ||
        val == "axis" ||
        val == "three" ||
        val == "smartfren" ||
        val == "tri") {
      return "Pulsa";
    }
    return val.toUpperCase().replaceAll("_", " ");
  }

  static String convertDisplayTitleProductKini(String value) {
    String val = value.toLowerCase();
    if (val == "pdam") {
      return "PDAM";
    }
    if (val == "kartu_pascabayar") {
      return "Kartu\nPascabayar";
    }
    if (val == "cashout") {
      return "Tarik Tunai";
    }
    if (val == "gopay") {
      return "Go-Pay";
    }
    if (val == "ovo") {
      return "OVO";
    }
    if (val == "token_pln") {
      return "Listrik";
    }
    if (val == "token_listrik") {
      return "Token Listrik";
    }
    if (val == "emoney") {
      return "E-Wallet";
    }
    if (val == "pln_pascabayar") {
      return "Listrik Pascabayar";
    }
    if (val == "pulsa") {
      return "Pulsa &\nPaket Data";
    }
    if (val == "indosat" ||
        val == "xl" ||
        val == "telkomsel" ||
        val == "axis" ||
        val == "three" ||
        val == "smartfren" ||
        val == "tri") {
      return "Pulsa";
    }
    if (val == "games") {
      return "Voucher\nGame";
    }
    if (val == "pajak") {
      return "Pajak";
    }
    if (val == "bpjs") {
      return "BPJS";
    }
    if (val == "streaming") {
      return "Streaming";
    }
    if (val == "multifinance") {
      return "Multi\nFinance";
    }
    if (val == "belanja") {
      return "Belanja";
    }
    if (val == "pascabayar") {
      return "Pascabayar";
    }
    if (val == "banking") {
      return "Banking";
    }
    if (val == "edukasi") {
      return "Edukasi";
    }
    if (val == "asuransi") {
      return "Asuransi";
    }
    if (val == "property") {
      return "Property";
    }
    if (val == "pay_tv") {
      return "Pay Tv";
    }
    if (val == "gas_negara") {
      return "Gas Negara";
    }
    if (val == "pln_postpaid") {
      return "Tagihan\nListrik";
    }
    if (val == "telkom_pascabayar") {
      return "Telkom";
    }
    if (val.toUpperCase() == "TELKOMSEL_PASCABAYAR") {
      return "Telkomsel\nPascabayar";
    }
    if (val.toUpperCase() == "XL_PASCABAYAR") {
      return "XL\nPascabayar";
    }
    if (val.toUpperCase() == "PLN_PASCABAYAR") {
      return "PLN\nPascabayar";
    }
    if (val.toUpperCase() == "GAS_NEGARA") {
      return "Gas Negara\nPascabayar";
    }
    if (val.toUpperCase() == "TELKOM_JASTEL") {
      return "Telkom";
    }
    return "";
  }

  static String convertDisplayLayananKini(String value) {
    String val = value.toLowerCase();
    print("layanan: $val");

    if (val.contains("pdam")) {
      return "PDAM";
    }
    if (val == "cashout") {
      return "Tarik Tunai";
    }
    if (val == "gopay") {
      return "Go-Pay";
    }
    if (val == "ovo") {
      return "OVO";
    }
    if (val == "dana") {
      return "DANA";
    }
    if (val == "token_pln") {
      return "Token Listrik";
    }
    if (val == "token_listrik") {
      return "Token Listrik";
    }
    if (val == "emoney") {
      return "E-Wallet";
    }
    if (val == "pln_pascabayar") {
      return "Tagihan Listrik";
    }
    if (val == "telkomsel_pascabayar") {
      return "Kartu Pascabayar";
    }
    if (val == "pulsa") {
      return "Pulsa & Paket Data";
    }
    if (val == "indosat"  ||
        val == "xl" ||
        val == "telkomsel" ||
        val == "axis" ||
        val == "three" ||
        val == "smartfren" ||
        val == "tri") {
      return "Pulsa";
    }
    if (val == "games") {
      return "Voucher\nGame";
    }
    if (val == "pajak") {
      return "Pajak";
    }
    if (val == "bpjs") {
      return "BPJS";
    }
    if (val == "streaming") {
      return "Streaming";
    }
    if (val == "multifinance") {
      return "Multi\nFinance";
    }
    if (val == "belanja") {
      return "Belanja";
    }
    if (val == "pascabayar") {
      return "Kartu Pascabayar";
    }
    if (val == "banking") {
      return "Banking";
    }
    if (val == "edukasi") {
      return "Edukasi";
    }
    if (val == "asuransi") {
      return "Asuransi";
    }
    if (val == "property") {
      return "Property";
    }
    if (val == "pay_tv") {
      return "Pay Tv";
    }
    if (val == "gas_negara") {
      return "Gas Negara";
    }
    if (val == "pln_postpaid") {
      return "Tagihan\nListrik";
    }
    if (val == "telkom_pascabayar") {
      return "Telkom";
    }
    return "";
  }

  static String convertDisplayTitleCustomerId(String value) {
    String val = value.toLowerCase();
    debugPrint("convertDisplayTitleCustomerId: $val");
    if (val == "pdam") {
      return "Nomor Pelanggan";
    }
    if (val == "pajak") {
      return "No Tagihan/ID Pelanggan";
    }
    if (val == "games") {
      return "Username";
    }
    if (val == "bpjs") {
      return "No. BPJS";
    }
    if (val == "cashout") {
      return "Nomor Rekening";
    }
    if (val == "gopay") {
      return "Go-Pay";
    }
    if (val == "ovo") {
      return "OVO";
    }
    if (val == "token_pln") {
      return "Token Listrik";
    }
    if (val == "token_listrik") {
      return "No Meter/ID Pel";
    }
    if (val == "emoney") {
      return "E-Wallet";
    }
    if (val == "pln_pascabayar") {
      return "No Meter/ID Pel";
    }
    if (val == "pulsa") {
      return "Nomor Handphone";
    }
    if (val == "telkomsel_pascabayar") {
      return "Nomor Handphone";
    }
    if (val == "xl_pascabayar") {
      return "Nomor Handphone";
    }
    if (val == "indosat" ||
        val == "xl" ||
        val == "telkomsel" ||
        val == "axis" ||
        val == "three" ||
        val == "smartfren" ||
        val == "tri") {
      return "Pulsa";
    }
    if (val == "games") {
      return "Voucher\nGame";
    }
    if (val == "pajak") {
      return "Pajak";
    }
    if (val == "bpjs") {
      return "BPJS";
    }
    if (val == "streaming") {
      return "Streaming";
    }
    if (val == "multifinance") {
      return "Multi\nFinance";
    }
    if (val == "belanja") {
      return "Belanja";
    }
    if (val == "pascabayar") {
      return "Kartu Pascabayar";
    }
    if (val == "banking") {
      return "Banking";
    }
    if (val == "edukasi") {
      return "Edukasi";
    }
    if (val == "asuransi") {
      return "Asuransi";
    }
    if (val == "property") {
      return "Property";
    }
    if (val == "pay_tv") {
      return "Pay Tv";
    }
    if (val == "gas_negara") {
      return "Gas Negara";
    }
    if (val == "pln_postpaid") {
      return "Tagihan\nListrik";
    }
    if (val == "telkom_pascabayar") {
      return "Telkom";
    }
    return "";
  }

  static String convertDisplayTitleAppbarProductKini(String value) {
    String val = value.toLowerCase();
    if (val == "kartu_pascabayar") {
      return "Kartu Pascabayar";
    }
    if (val == "pdam") {
      return "PDAM";
    }
    if (val == "cashout") {
      return "Pinjaman";
    }
    if (val == "gopay") {
      return "Go-Pay";
    }
    if (val == "ovo") {
      return "OVO";
    }
    if (val == "token_pln") {
      return "Listrik";
    }
    if (val == "token_listrik") {
      return "Token Listrik";
    }
    if (val == "emoney") {
      return "E-Wallet";
    }
    if (val == "pln_pascabayar") {
      return "Listrik Pascabayar";
    }
    if (val == "pulsa") {
      return "Pulsa & Paket Data";
    }
    if (val == "indosat" ||
        val == "xl"||
        val == "telkomsel" ||
        val == "axis" ||
        val == "three" ||
        val == "smartfren" ||
        val == "tri") {
      return "Pulsa";
    }
    if (val == "games") {
      return "Voucher Game";
    }
    if (val == "pajak") {
      return "Pajak";
    }
    if (val == "bpjs") {
      return "BPJS";
    }
    if (val == "streaming") {
      return "Streaming";
    }
    if (val == "multifinance") {
      return "Multi Finance";
    }
    if (val == "belanja") {
      return "Belanja";
    }
    if (val == "pascabayar") {
      return "Kartu Pascabayar";
    }
    if (val == "banking") {
      return "Banking";
    }
    if (val == "edukasi") {
      return "Edukasi";
    }
    if (val == "asuransi") {
      return "Asuransi";
    }
    if (val == "property") {
      return "Property";
    }
    if (val == "pay_tv") {
      return "Pay Tv";
    }
    if (val == "gas_negara") {
      return "Gas Negara";
    }
    if (val == "pln_postpaid") {
      return "Tagihan Listrik";
    }
    if (val == "telkom_pascabayar") {
      return "Telkom";
    }
    if (val == "telkomsel_pascabayar") {
      return "Telkomsel Pascabayar";
    }
    return "";
  }

  static String convertImageProductKini(String value) {
    String val = value.toLowerCase();
    if (val == "kartu_pascabayar") {
      return "kini_pulsa_paket_data.png";
    }
    if (val == "pdam") {
      return "kini_pdam.png";
    }
    if (val == "cashout"||val == "cash_out") {
      return "kini_tarik_tunai.png";
    }
    if (val == "gopay") {
      return "Go-Pay";
    }
    if (val == "ovo") {
      return "OVO";
    }
    if (val == "token_pln") {
      return "kini_token_listrik.png";
    }
    if (val == "token_listrik") {
      return "kini_tagihan_listrik.png";
    }
    if (val == "emoney") {
      return "kini_e_wallet.png";
    }
    if (val == "pln_pascabayar") {
      return "kini_token_listrik.png";
    }
    if (val == "pulsa") {
      return "kini_pulsa_paket_data.png";
    }
    if (val == "pascabayar") {
      return "kini_pulsa_paket_data.png";
    }
    if (val == "indosat" ||
        val == "xl" ||
        val == "telkomsel" ||
        val == "axis" ||
        val == "three" ||
        val == "smartfren" ||
        val == "tri") {
      return "kini_token_listrik.png";
    }
    if (val == "games") {
      return "kini_voucher_game.png";
    }
    if (val == "pajak") {
      return "kini_pajak.png";
    }
    if (val == "bpjs") {
      return "kini_bpjs.png";
    }
    if (val == "streaming") {
      return "kini_streaming.png";
    }
    if (val == "multifinance") {
      return "kini_multifinance.png";
    }
    if (val == "belanja") {
      return "kini_belanja.png";
    }
    if (val == "gas_negara") {
      return "kini_gas_negara.png";
    }
    if (val == "pln_postpaid") {
      return "kini_token_listrik.png";
    }
    if (val == "telkom_pascabayar") {
      return "kini_telkom.png";
    }
    if (val.toUpperCase() == "TELKOMSEL_PASCABAYAR") {
      return "kini_pulsa_paket_data.png";
    }
    if (val.toUpperCase() == "TELKOM_JASTEL") {
      return "kini_telkom.png";
    }
    if (val.toUpperCase() == "GAS_NEGARA") {
      return "kini_gas_negara.png";
    }
    return "kini_pulsa_paket_data.png";
  }

  static String convertDisplayIconHistoryKini(String value) {
    String val = value.toLowerCase();
    if (val.contains("pdam")) {
      return "ic_ppob.png";
    }
    if (val.contains("cashout")) {
      return "ic_coin.png";
    }
    if (val.contains("gopay") || val.contains("ovo")) {
      return "ic_multifinance.png";
    }
    if (val.contains("token_pln")) {
      return "ic_token.png";
    }
    if (val.contains("pln_pascabayar")) {
      return "ic_token.png";
    }
    if (val.contains("indosat") ||
        val.contains("xl") ||
        val.contains("telkomsel") ||
        val.contains("axis") ||
        val.contains("three") ||
        val.contains("smartfren") ||
        val.contains("tri")) {
      return "ic_call_pulse.png";
    }
    return "ic_coin.png";
  }

  static String convertDisplayIconHistoryNewKini(String value) {
    String val = value.toLowerCase();
    if (val.contains("games")) {
      return "kini_voucher_game.png";
    }
    if (val.contains("pdam")) {
      return "kini_pdam.png";
    }
    if (val.contains("cashout")||val.contains("cash_out")) {
      return "kini_tarik_tunai.png";
    }
    if (val.contains("gopay") || val.contains("ovo")) {
      return "kini_e_wallet.png";
    }
    if (val.contains("token_pln")||val.contains("token_listrik")) {
      return "kini_tagihan_listrik.png";
    }
    if (val.contains("emoney")) {
      return "kini_e_wallet.png";
    }
    if (val.contains("pln_pascabayar")) {
      return "kini_tagihan_listrik.png";
    }
    if (val == "indosat" ||
        val == "pulsa" ||
        val == "xl" ||
        val == "telkomsel" ||
        val == "axis" ||
        val == "three" ||
        val == "smartfren" ||
        val == "smartfren" ||
        val == "tri" ||
        val == "telkomsel_pascabayar"
    ) {
      return "kini_pulsa_paket_data.png";
    }
    if (val.contains("bpjs")) {
      return "kini_bpjs.png";
    }
    if (val.contains("pajak")) {
      return "kini_pajak.png";
    }
    return "kini_e_wallet.png";
  }

  static String convertDisplayCustIdHistoryKini(String product, String custId) {
    String val = product.toLowerCase();

    if (val.contains("pdam")) {
      return custId;
    }
    if (val.contains("cashout")) {
      return custId;
    }
    if (val.contains("gopay") || val.contains("ovo")) {
      return custId;
    }
    if (val.contains("token_pln")) {
      return custId;
    }
    if (val.contains("pln_pascabayar")) {
      return custId;
    }
    if (val.contains("emoney")) {
      return custId;
    }
    if (val.contains("indosat") ||
        val.contains("xl") ||
        val.contains("telkomsel") ||
        val.contains("axis") ||
        val.contains("three") ||
        val.contains("smartfren")) {
      return CommonUtil.cleanupPhoneNumber(custId);
    }
    return "";
  }

  static String convertDisplayIconPPOB(String value) {
    switch (value) {
      case "cashout":
        return "ic_coin.png";
      case "pdam":
        return "ic_ppob.png";
      case "token_listrik":
        return "ic_token.png";
      case "pln_pascabayar":
        return "ic_token.png";
      case "bpjs":
        return "ic_bpjs.png";
      case "emoney":
        return "ic_multifinance.png";
      case "belanja":
        return "ic_coin.png";
      case "pulsa":
        return "ic_call_pulse.png";
      case "pascabayar":
        return "ic_call_pulse.png";
      case "banking":
        return "ic_bank.png";
      case "edukasi":
        return "ic_education.png";
      case "games":
        return "ic_game.png";
      case "streaming":
        return "ic_streaming.png";
      case "multifinance":
        return "ic_multifinance.png";
      case "asuransi":
        return "ic_asuransi.png";
      case "property":
        return "ic_property.png";
      case "pay_tv":
        return "ic_tv_kabel.png";
      case "pajak":
        return "ic_pajak.png";
      default:
    }
    return "ic_call_pulse.png";
  }

  static String convertDisplayIconPulsaType(String value) {
    String val = value.toLowerCase().toString();
    print("Pulsa Type: $val");
    if (val.contains("indosat")) {
      return "ic_indosat.png";
    }
    if (val.contains("xl")) {
      return "ic_xl.png";
    }
    if (val.contains("telkomsel")) {
      return "ic_telkom.png";
    }
    if (val.contains("telkom")) {
      return "ic_telkom.png";
    }
    if (val.contains("smartfren")) {
      return "ic_smartfren.png";
    }
    if (val.contains("axis")) {
      return "ic_axis.png";
    }
    if (val.contains("three")||val.contains("tri")) {
      return "ic_tri.png";
    }
    return "";
  }

  static Color convertPPOBColorKini(String value) {
    switch (value) {
      case 'pascabayar':
        return Colors.greenAccent.withOpacity(0.2);
        break;
      case 'pulsa':
        return Colors.greenAccent.withOpacity(0.2);
        break;
      case 'token':
        return Colors.yellowAccent.withOpacity(0.2);
        break;
      case 'token_listrik':
        return Colors.yellowAccent.withOpacity(0.2);
        break;
      case 'pln_pascabayar':
        return Colors.yellowAccent.withOpacity(0.2);
        break;
      case 'pdam':
        return Colors.blueAccent.withOpacity(0.2);
        break;
      //
      case 'pajak':
        return Colors.blueAccent.withOpacity(0.2);
        break;
      case 'games':
        return Colors.greenAccent.withOpacity(0.2);
        break;
      case 'multifinance':
        return Colors.yellowAccent.withOpacity(0.2);
        break;
      case 'streaming':
        return Colors.greenAccent.withOpacity(0.2);
        break;
      case 'property':
        return Colors.greenAccent.withOpacity(0.2);
        break;
      case 'emoney':
        return Colors.yellowAccent.withOpacity(0.2);
        break;
      case 'asuransi':
        return Colors.blueAccent.withOpacity(0.2);
        break;
      case 'pay_tv':
        return Colors.blueAccent.withOpacity(0.2);
        break;
      case 'bpjs':
        return Colors.yellowAccent.withOpacity(0.2);
        break;
      case 'banking':
        return Colors.blueAccent.withOpacity(0.2);
        break;
    }
    return Colors.grey.withOpacity(0.1);
  }

  static String convertIndustryToView(String industy) {
    switch (industy.toLowerCase()) {
      case "architecture_and_engineering":
        return "Arsitek Dan Enginer";
        break;
      case "automotive":
        return "Otomotive";
        break;
      case "bank":
        return "Bank";
        break;
      case "bpo":
        return "BPO";
        break;
      case "chemical":
        return "Kimia";
        break;
      case "consultant":
        return "Konsultan";
        break;
      case "coal":
        return "Batu Bara";
        break;
      case "contractor":
        return "Kontraktor";
        break;
      case "distribution":
        return "Distribusi";
        break;
      case "e-commerce":
        return "Perdagangan Elektronik";
        break;
      case "education":
        return "Pembelajaran Formal";
        break;
      case "education_informal":
        return "Pembelajaran Informal";
        break;
      case "energy":
        return "Sumber/Energi";
        break;
      case "event":
        return "Acara/Moment";
        break;
      case "fashion":
        return "Gaya Hidup";
        break;
      case "financial":
        return "Keuangan";
        break;
      case "fintech":
        return "Keuangan Digital";
        break;
      case "fcmg":
        return "";
        break;
      case "food_and_beverages":
        return "Makanan dan Minuman";
        break;
      case "hospitality":
        return "Rumah Sakit";
        break;
      case "human_resources":
        return "Sumber Daya Manusia";
        break;
      case "investmen":
        return "Investasi/Modal";
        break;
      case "insurance":
        return "Asuransi";
        break;
      case "it":
        return "Teknologi Informasi";
        break;
      case "legal":
        return "Legal";
        break;
      case "technology":
        return "Teknologi";
        break;
      case "logistic":
        return "Logistik";
        break;
      case "manufacture":
        return "Manufaktur";
        break;
      case "media":
        return "Media";
        break;
      case "medical":
        return "Pengobatan";
        break;
      case "mining":
        return "Mining";
        break;
      case "outsource":
        return "Out Source";
        break;
      case "pharmacy":
        return "Farmasi";
        break;
      case "plantation":
        return "Perkebunan";
        break;
      case "property":
        return "Property";
        break;
      case "retail":
        return "Retail";
        break;
      case "services":
        return "Pelayanan";
        break;
      case "startup":
        return "Startup";
        break;
      case "telco":
        return "Telekomunikasi";
        break;
      case "other":
        return "Lainnya";
        break;

      default:
        return "Industri lain";
    }
    return "";
  }

  static String adjustCommType(String commType) {
    var result;
    switch(commType){
      case "comm_office":
        result = "office";
        break;
      case "comm_remote":
        result = "remote";
        break;
      default:
        result = commType;
    }
    return result;
  }

  static String adjustCommTypeValue(String commType) {
    var result;
    switch(commType.toUpperCase()){
      case "OFFICE":
        result = "Kantor";
        break;
      case "REMOTE":
        result = "Remote/Hybrid";
        break;
      default:
        result = 'Site';
    }
    return result;
  }

  static String adjustEmpType(String empType) {
    var result;
    switch(empType){
      case "emp_fulltime":
        result = "full_time";
        break;
      case "emp_parttime":
        result = "part_time";
        break;
      case "freelance":
        result = "freelance";
        break;
      case "freelance":
        result = "freelance";
        break;
      case "full_time":
        result = "full_time";
        break;
      case "part_time":
        result = "part_time";
        break;
      default:
        result = empType;
    }
    return result;
  }

  static String adjustEmpTypeValue(String empType) {
    var result;
    switch(empType.toLowerCase()){
      case "emp_fulltime":
        result = "Fulltime";
        break;
      case "emp_parttime":
        result = "Parttime";
        break;
      case "freelance":
        result = "Freelance";
        break;
      case "full_time":
        result = "Fulltime";
        break;
      case "part_time":
        result = "Partime";
        break;
      default:
        result = empType;
    }
    return result;
  }

  static String convertIndustry(String industry) {
    var result;
    print("convertIndustry:: ${industry.toLowerCase()}");
    switch(industry.toLowerCase()){
      case "human_resources":
        result = "Human Resources";
        break;
      case "technology":
        result = "IT Teknologi";
        break;
      case "food_and_beverages":
        result = "Food and Beverages";
        break;
      case "fashion":
        result = "Fashion";
        break;
      case "logistic":
        result = "Logistik";
        break;
      case "media":
        result = "Media";
        break;
      case "retail":
        result = "Retail";
        break;
      case "financial":
        result = "Keuangan";
        break;
        case "finance":
        result = "Keuangan";
        break;
        case "accounting":
        result = "Keuangan";
        break;
      case "technology":
        result = "IT Teknologi";
        break;
      case "education":
        result = "Pendidikan";
        break;
      case "hospitality":
        result = "Rumah Sakit";
        break;
      case "technology":
        result = "Teknologi";
        break;
      case "mining":
        result = "Mining";
        break;
      case "telco":
        result = "Telekomunikasi";
        break;
      case "automotive":
        result = "Otomotif";
        break;
      case "it":
        result = "IT Teknologi";
        break;
      case "property":
        result = "Properti";
        break;
      case "legal":
        result = "Legal";
        break;
      case "energy":
        result = "Energi";
        break;
      case "e-commerce":
        result = "E-Commerce";
        break;
      case "manufacture":
        result = "Manufaktur";
        break;
      case "pharmacy":
        result = "Farmasi";
        break;
      case "outsource":
        result = "Outsource";
        break;
      case "education_informal":
        result = "Pembelajaran Informal";
        break;
      case "contractor":
        result = "Kontraktor";
        break;
      case "consultant":
        result = "Konsultan";
        break;
      case "plantation":
        result = "Perkebunan";
        break;
      case "services":
        result = "Services";
        break;
      case "architecture_and_engineering":
        result = "Arsitektur dan Enginering";
        break;
      case "chemical":
        result = "Kimia";
        break;
      case "distribution":
        result = "Distribusi";
        break;
      case "medical":
        result = "Kesehatan";
        break;
      case "event":
        result = "Event";
        break;
      case "general_management":
        result = "General Management";
        break;
      case "operation":
        result = "Operasi";
        break;
      case "other":
        result = "Lainnya";
        break;
      case "semua":
        result = "Lainnya";
        break;
      default:
        result = "Lainnya";
    }
    return result;
  }

  static String convertEnumToCategoryName(String enumText) {
    var result;
    print("convertEnumToCategoryName: $enumText");
    switch (enumText.toUpperCase()) {
      case "GENERAL_AFFAIR":
        result = "General Affair";
        break;
      case "SALES_MARKETING":
        result = "Sales & Marketing";
        break;
      case "HUMAN_RESOURCE":
        result = "Human Resource";
        break;
      case "HUMAN_RESOURCES":
        result = "Human Resource";
        break;
      case "INFORMATION_TECHNOLOGY":
        result = "Information Technology";
        break;
      case "OPERATION":
        result = "Operation";
        break;
      case "FINANCE":
        result = "Finance";
        break;
      case "DIGITAL_ARMY":
        result = "Digital Army";
        break;
      case "FNB_STAFF":
        result = "Staf Toko, Warung, dan Resto";
        break;
      case "ADMINISTRATIVE_WORK":
        result = "Staf Perkantoran";
        break;
      case "AUTOMOTIVE":
        result = "Staf Otomotif";
        break;
      case "HOSPITALITY_STAFF":
        result = "Staf Perhotelan";
        break;
      case "CARPENTRY_STAFF":
        result = "Staf Pertukangan";
        break;
      case "STORE_STAFF":
        result = "Staf Pergudangan";
        break;
      case "EVENT_ORGANIZER":
        result = "Staf Event";
        break;
      case "FARM_WORKER":
        result = "Staf Pertanian";
        break;
      case "CREATIVE_WORK":
        result = "Staf Kreatif";
        break;
      case "BUSINESS_WORK":
        result = "Staf Bisnis";
        break;
      case "ACCOUNTING_FINANCE":
        result = "Accounting";
        break;
      case "ACCOUNTING":
        result = "Accounting";
        break;
      case "PRODUCT":
        result = "Product";
        break;
      case "PURCHASING":
        result = "Purchasing";
        break;
      case "RND":
        result = "RnD";
        break;
      case "SALES":
        result = "Sales";
        break;
      case "COMMERCIAL":
        result = "Commercial";
        break;
      case "CUSTOMER_SERVICE":
        result = "Custommer Service";
        break;
      case "COLLECTION":
        result = "Collection";
        break;
      case "PRODUCT":
        result = "Product";
        break;
      case "RECRUITMENT":
        result = "Recruiter";
        break;
      case "GENERAL_MENAGER":
        result = "General Management";
        break;
      case "general_management":
        result = "General Management";
        break;
      case "GENERAL_MENAGEMENT":
        result = "General Management";
        break;
      case "MARKETING":
        result = "Marketing";
        break;
      case "OPERATION":
        result = "Operation";
        break;
      case "COLLECTION":
        result = "Collection";
        break;
      case "TECHNOLOGY":
        result = "Teknology";
        break;
      default:
        result = enumText;
    }
    return result;
  }

  static String convertEnumToPay(String pay) {
    print("convertEnumToPay: $pay");

    var result;
    switch (pay.toLowerCase()) {
      case "pay_periodical":
        result = "Bulanan";
        break;
      case "pay_performance":
        result = "Harian";
        break;
      case "pay_probono":
        result = "Probono";
        break;
      case "pay_project":
        result = "Per Project";
        break;
      default:
        result = "-";
    }
    return result;
  }

  static String convertIndustryJsonValue(String industry) {
    var result;
    switch(industry){
      case "Human Reasource":
        result = "human_resources";
        break;
      case "Administrasi":
        result = "administrative_work";
        break;
      case "IT Teknologi":
        result = "technology";
        break;
      case "Food and Beverages":
        result = "food_and_beverages";
        break;
      case "Fashion":
        result = "fashion";
        break;
      case "Logistik":
        result = "logistic";
        break;
      case "Media":
        result = "media";
        break;
      case "Retail":
        result = "retail";
        break;
      case "Keuangan":
        result = "financial";
        break;
      case "IT Teknologi":
        result = "technology";
        break;
      case "Pendidikan":
        result = "education";
        break;
      case "Rumah Sakit":
        result = "hospitality";
        break;
      case "Teknologi":
        result = "technology";
        break;
      case "Mining":
        result = "mining";
        break;
      case "Telekomunikasi":
        result = "telco";
        break;
      case "Otomotif":
        result = "automotive";
        break;
    // case "it":
    //   result = "IT Teknologi";
    //   break;
      case "Properti":
        result = "property";
        break;
      case "Legal":
        result = "legal";
        break;
      case "Energi":
        result = "energy";
        break;
      case "E-Commerce":
        result = "e-commerce";
        break;
      case "Manufaktur":
        result = "manufacture";
        break;
      case "Farmasi":
        result = "pharmacy";
        break;
      case "Outsource":
        result = "outsource";
        break;
      case "Pembelajaran Informal":
        result = "education_informal";
        break;
      case "Kontraktor":
        result = "contractor";
        break;
      case "Konsultan":
        result = "consultant";
        break;
      case "Perkebunan":
        result = "plantation";
        break;
      case "Services":
        result = "services";
        break;
      case "Arsitektur dan Enginering":
        result = "architecture_and_engineering";
        break;
      case "Kimia":
        result = "chemical";
        break;
      case "Distribusi":
        result = "distribution";
        break;
      case "Kesehatan":
        result = "medical";
        break;
      case "Event":
        result = "event";
        break;
      case "Lainnya":
        result = "other";
        break;
      default:
        result = "other";
    }
    return result;
  }

  static convertMaritalStatus(String maritalStatus) {
    var result;
    print("convertMaritalStatus: ${maritalStatus.toLowerCase()}");

    switch(maritalStatus.toLowerCase()){
      case "single":
        result = "Lajang";
        break;
      case "married":
        result = "Menikah";
        break;
      case "complicated":
        result = "Rumit";
        break;
      case "prefer_not_to_say":
        result = "Tidak Diberitahukan";
        break;
      case "separated":
        result = "Berpisah";
        break;

      case "lajang":
        result = "single";
        break;
      case "menikah":
        result = "married";
        break;
      case "pisah":
        result = "separate";
        break;
      default:
        result = "Tidak Dikatakan";
    }
    return result;
  }

  static convertWorkType(String empType) {
    var result;
    switch(empType){
      case "fulltime":
        result = "full_time";
        break;
      case "parttime":
        result = "part_time";
        break;
      case "freelance":
        result = "freelance";
        break;
      case "harian lepas":
        result = "freelance";
        break;
      default:
        result = 'full_time';
    }
    return result;
  }

  static categoryWork(String jobCategory) {
    var result;
    switch(jobCategory.toLowerCase()){
      case "fulltime":
        result = "full_time";
        break;
      case "parttime":
        result = "part_time";
        break;
      case "harian lepas":
        result = "freelance";
        break;
      default:
        result = 'full_time';
    }
    return result;
  }

  static String convertDisplayIconPoint(String value) {
    debugPrint("provider: $value");
    String val = value.toLowerCase();
    if (val.contains("mandiri")) {
      return "mandiri.png";
    }
    if (val.contains("bca")) {
      return "bca.png";
    }
    if (val.contains("permata")) {
      return "permata.png";
    }
    if (val.contains("bni")) {
      return "bni.png";
    }
    if (val.contains("bri")) {
      return "bri.png";
    }
    if (val.contains("id_ovo")) {
      return "ovo.png";
    }
    if (val.contains("id_dana")) {
      return "dana.png";
    }
    return "ic_coin.png";
  }

  static String convertEnumStatusHistoryPoint(String status) {
    var result;
    switch (status.toLowerCase()) {
      case "job_post":
        result = "Posting Pekerjaan";
        break;
      case "user_topup":
        result = "Top Up Point";
        break;
      case "admin_topup":
        result = "Top Up Point By Admin";
        break;
      case "talent_scouting":
        result = "Melihat Kandidat/Dowload CV";
        break;
      default:
        result = status;
    }
    return result;
  }

  static Color convertEnumStatusColorHistoryPoint(String stat) {
    String status = stat.toLowerCase();
    switch (status) {
      case 'job_post':
        return Colors.red;
        break;
      case 'talent_scouting':
        return Colors.red;
        break;
      case 'failed':
        return Colors.red;
        break;
      case 'pending':
        return Colors.red;
        break;
      case 'cancelled':
        return Colors.red;
        break;
      case 'expired':
        return Colors.red;
        break;
      case 'success':
        return Colors.green;
        break;
      case 'process':
        return Job2goPalette.yellowWaiting;
        break;
      default:
        return Colors.green;
    }
  }

  // static String convertEnumStatusDescPoint(history.Datum data) {
  //   var result;
  //   if(data.method!.toLowerCase()=="job_post"){
  //     return "Lowongan: ${data.jobTitle??""}";
  //   }
  //   if(data.method!.toLowerCase()=="talent_scounting"){
  //     return "Pelamar: ${data.workerFullName??""}";
  //   }
  //   if(data.method!.toLowerCase()=="user_topup"){
  //     return data.amount==null?"": "${convertToRupiah(data.amount)}";
  //   }
  //   return "-";
  // }

  static String convertEmpType(String data) {
    if(data.toLowerCase()=="full_time"){
      return "Full Time";
    }
    if(data.toLowerCase()=="part_time"){
      return "Part Time";
    }
    if(data.toLowerCase()=="freelance"){
      return "Freelance";
    }
    return "-";
  }

  static String convertPaymentType(String data) {
    if(data.toLowerCase()=="pay_performance"){
      return "Performence Fee";
    }
    if(data.toLowerCase()=="pay_periodical"){
      return "Periodical (Salary)";
    }
    if(data.toLowerCase()=="pay_project"){
      return "Project Based";
    }
    if(data.toLowerCase()=="pay_duration"){
      return "Duration";
    }
    if(data.toLowerCase()=="pay_probono"){
      return "Pro Bono (Volunteer)";
    }
    if(data.toLowerCase()=="PAY_PERIODICAL"){
      return "Periodical (Salary)";
    }
    if(data.toLowerCase()=="PAY_PERFORMANCE"){
      return "Performence Fee";
    }
    return "-";
  }

  static String convertCommutingType(String data) {
    if(data.toLowerCase()=="office"){
      return "Kantor";
    }
    if(data.toLowerCase()=="remote"){
      return "Remote";
    }
    if(data.toLowerCase()=="site"){
      return "Penempatan";
    }
    return "-";
  }

  static String convertDisplayIconGame(String val) {
    if (val=="FREE_FIRE") {
      return "ic_game_free_fire.png";
    }
    if (val=="AOV") {
      return "ic_game_aov.png";
    }
    if (val=="BIG_CAT_COINS") {
      return "ic_game_big_cat.png";
    }
    if (val=="CALL_OF_DUTY") {
      return "ic_game_cod.png";
    }
    if (val=="LOVE_NIKKI_DIAMONDS") {
      return "ic_game_love_nikki.png";
    }
    if (val=="LOVE_NIKKI") {
      return "ic_game_love_nikki.png";
    }
    if (val=="MINECRAFT") {
      return "ic_game_minicraft.png";
    }
    if (val=="MOBILE_LEGENDS_BANG_BANG") {
      return "ic_game_mobile_legend.png";
    }
    if (val=="MOBILE_LEGENDS_DIAMOND") {
      return "ic_game_mobile_legend.png";
    }
    if (val=="PUBG_LITE") {
      return "kini_voucher_game.png";
    }
    if (val=="PUBG") {
      return "kini_voucher_game.png";
    }
    if (val=="RAGNAROK") {
      return "kini_voucher_game.png";
    }
    return "kini_voucher_game.png";
  }

}

extension StringExtension on String {
  String capitalizeWord() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class NumericTextFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.end;
      final f = new NumberFormat("#,###", "id");
      int num = int.parse(newValue.text.replaceAll(f.symbols.GROUP_SEP, ''));
      final newString = f.format(num);
      return new TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
            offset: newString.length - selectionIndexFromTheRight),
      );
    } else {
      return newValue;
    }
  }
}

