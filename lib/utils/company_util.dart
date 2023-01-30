import 'package:flutter/material.dart';

import '../colors.dart';

class CompanyUtil {
  static String convertEnumToBankName(String bankEnum) {
    String bankName = '';
    switch (bankEnum) {
      case "gopay":
        bankName = "GO-PAY";
        break;
      case "bri":
        bankName = "PT. BANK RAKYAT INDONESIA (PERSERO)";
        break;
      case "bca":
        bankName = "PT. BANK CENTRAL ASIA TBK.";
        break;
      case "bni":
        bankName = "PT. BANK NEGARA INDONESIA (PERSERO)";
        break;
      case "mandiri":
        bankName = "PT. BANK MANDIRI (PERSERO) TBK.";
        break;
      case "cimb":
        bankName = "PT. BANK CIMB NIAGA TBK.";
        break;
      case "danamon":
        bankName = "PT. BANK DANAMON INDONESIA TBK.";
        break;
      case "panin":
        bankName = "PT. PANIN BANK TBK.";
        break;
      case "sinarmas":
        bankName = "PT. BANK SINARMAS";
        break;
      case "jatim":
        bankName = "PT. BANK PEMBANGUNAN DAERAH JAWA TENGAH";
        break;
      case "jateng":
        bankName = "PT. BANK PEMBANGUNAN DAERAH JAWA TENGAH";
        break;
      case "anz":
        bankName = "PT. BANK ANZ INDONESIA";
        break;
      case "dbs":
        bankName = "PT. BANK DBS INDONESIA";
        break;
      case "bukopin":
        bankName = "PT. BANK BUKOPIN TBK.";
        break;
      case "permata":
        bankName = "PT. BANK PERMATA TBK.";
        break;
      case "mega_tbk":
        bankName = "PT. BANK MEGA TBK.";
        break;
      case "btn":
        bankName = "PT. BANK TABUNGAN NEGARA (PERSERO)";
        break;
      case "hsbc":
        bankName = "PT. BANK HSBC INDONESIA";
        break;
      case "maybank":
        bankName = "PT. BANK MAYBANK INDONESIA TBK.";
        break;
      case "btpn":
        bankName = "PT. BANK BTPN";
        break;
      case "ocbc":
        bankName = "PT. BANK OCBC NISP TBK.";
        break;
      case "stanchard":
        bankName = "STANDARD CHARTERED BANK";
        break;
      default:
        bankName = bankEnum.toUpperCase();
    }
    return bankName;
  }

  static Widget convertEnumToBankIcon(String bankEnum) {
    Widget bankIcon;
    print("bankEnum: $bankEnum");
    switch (bankEnum) {
      case "gopay":
        bankIcon = Image.asset("assets/images/gopay.png");
        break;
      case "ovo":
        bankIcon = Image.asset("assets/images/ovo.png", height: 13,);
        break;
      case "bri":
        bankIcon = Image.asset("assets/images/bri.png");
        break;
      case "bca":
        bankIcon = Image.asset("assets/images/bca.png");
        break;
      case "bni":
        bankIcon = Image.asset("assets/images/bni.png");
        break;
      case "mandiri":
        bankIcon = Image.asset("assets/images/mandiri.png");
        break;
      case "danamon":
        bankIcon = Image.asset("assets/images/danamon.png");
        break;
      case "permata":
        bankIcon = Image.asset("assets/images/permata.png");
        break;
      case "maybank":
        bankIcon = Image.asset("assets/images/maybank.png");
        break;
      default:
        bankIcon = Image.asset("assets/images/bank_global.png", height: 40,);
    }
    return bankIcon;
  }

  static Color convertPayrollStatusColor(String status) {
    switch (status) {
      case 'manager_rejected':
      case 'finance_rejected':
        return Colors.red;
      case 'completed':
        return Colors.green;
      case 'draft':
        return Job2goPalette.yellowWaiting;
      case 'request_approval':
        return Job2goPalette.yellowWaiting;
      case 'manager_approved':
      case 'finance_approved':
      case 'processed':
        return Colors.blue;
      default:
        return Colors.black;
    }
  }

  static String convertPayrollStatusEnum(String status) {
    switch (status) {
      case 'manager_rejected':
        return "Ditolak Manager";
      case 'finance_rejected':
        return "Ditolak Finance";
      case 'processed':
        return "Diproses";
      case 'draft':
        return "Draft";
      case 'request_approval':
        return "Diajukan";
      case 'manager_approved':
        return "Disetujui Manager";
      case 'finance_approved':
        return "Disetujui Finance";
      case 'soft_deleted':
        return "Dibatalkan";
      case 'partial_completed':
        return "Sukses Sebagian";
      case 'completed':
        return "Selesai";
      case 'completed_skip_disbursement':
        return "Tanpa Disbursment";
      case 'queued':
        return "Dalam Antrian";
      case 'failed':
        return "Gagal";
      default:
        return status;
    }
  }

  static String convertPayrollStatusEnumAction(String status) {
    switch (status) {
      case 'manager_rejected':
      case 'finance_rejected':
        return "Tolak";
      case 'draft':
        return "Kembali ke draft";
      case 'request_approval':
        return "Ajukan";
      case 'manager_approved':
      case 'finance_approved':
        return "Setuju";
      case 'soft_deleted':
        return "Batalkan";
      case 'completed_skip_disbursement':
        return "Tanpa Disbursment";
      case "processed":
        return "Disburse";
      default:
        return status;
    }
  }

  static String convertLeaveTypeEnum(String status) {
    switch (status) {
      case "sick_leave":
        return "Cuti Sakit";
      case "holiday_leave":
        return "Cuti Tahunan";
      case "marital_leave":
        return "Cuti Menikah";
      case "maternity_leave":
        return "Cuti Melahirkan";
      default:
        return status;
    }
  }

  static String convertLeaveStatusEnum(String status) {
    switch (status) {
      case "submitted":
        return "Menunggu Approval";
      case "rejected":
        return "Ditolak";
      case "approved":
        return "Disetujui";
      case "cancelled":
        return "Dibatalkan";
      default:
        return status;
    }
  }

  static Color convertLeaveStatusColor(String status) {
    switch (status) {
      case "submitted":
        return Colors.orange;
      case "rejected":
        return Colors.red;
      case "approved":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  static String convertEmploymentType(String type) {
    var paymentType;
    switch (type) {
      case "EMP_FULLTIME":
        paymentType = "FULL-TIME";
        break;
      case "EMP_DAILY":
        paymentType = "HARIAN LEPAS";
        break;
      case "EMP_SEASONAL":
        paymentType = "MUSIMAN";
        break;
      case "FULL_TIME":
        paymentType = "FULL-TIME";
        break;
      case "PART_TIME":
        paymentType = "HARIAN LEPAS";
        break;
      case "FREELANCE":
        paymentType = "MUSIMAN";
        break;
      case "EMP_PROJECT":
        paymentType = "PER PROJECT";
        break;
      case "EMP_CONTRACTOR":
        paymentType = "PER UNIT TUGAS";
        break;
      case "EMP_PARTTIME":
        paymentType = "PART-TIME";
        break;
      default:
        paymentType = "";
        break;
    }
    return paymentType;
  }

  static String convertTextToCommutingEnum(String filter) {
    var result;
    switch (filter) {
      case "Kantoran":
        result = "COMM_OFFICE";
        break;
      case "Remote":
        result = "COMM_REMOTE";
        break;
      default:
        result = "";
        break;
    }
    return result;
  }

  static String convertEnumToAppliedStatus(String filter) {
    var result;
    switch (filter.toUpperCase()) {
      case "NEW_APPLICANT":
      case "APPLIED":
      case "FORWARDED":
      case "READ":
        result = "Telah dilamar";
        break;
      case "HIRED":
        result = "Diterima kerja";
        break;
      case "NOT_QUALIFIED":
        result = "Tidak sesuai kualifikasi";
        break;
      case "REJECTED":
        result = "Lamaran ditolak";
        break;
      case "JOBFINISHED":
        result = "Pekerjaan selesai";
        break;
      case "SHORTLISTED":
        result = "Kandidat terpilih";
        break;
      case "EXPIRED":
        result = "Lowongan ditutup";
        break;
      case "RECOMMENDED":
        result = "Direkomendasikan";
        break;
      default:
        result = "-";
        break;
    }
    return result;
  }

  static Color convertEnumToAppliedColor(String filter) {
    var result;
    switch (filter.toUpperCase()) {
      case "NEW_APPLICANT":
      case "APPLIED":
        result = Job2goPalette.whiteHigh;
        break;
      case "SHORTLISTED":
      case "FORWARDED":
      case "READ":
        result = Job2goPalette.whiteHigh;
        break;
      case "HIRED":
        result = Job2goPalette.whiteHigh;
        break;
      case "NOT_QUALIFIED":
      case "REJECTED":
        result = Job2goPalette.whiteHigh;
        break;
      case "JOBFINISHED":
      case "EXPIRED":
        result = Job2goPalette.whiteHigh;
        break;
      case "RECOMMENDED":
        result = Colors.white;
        break;
      default:
        result = Colors.teal;
        break;
    }
    return result;
  }

  static Color convertEnumToAppliedBgColor(String filter) {
    var result;
    switch (filter.toUpperCase()) {
      case "NEW_APPLICANT":
      case "APPLIED":
        result = Job2goPalette.yellowWaiting;
        break;
      case "SHORTLISTED":
      case "FORWARDED":
      case "READ":
        result = Job2goPalette.greenSuccess;
        break;
      case "HIRED":
        result = Colors.blue;
        break;
      case "NOT_QUALIFIED":
      case "REJECTED":
        result = Job2goPalette.red;
        break;
      case "JOBFINISHED":
      case "EXPIRED":
        result = Job2goPalette.greyBg;
        break;
      case "RECOMMENDED":
        result = Colors.blue;
        break;
      default:
        result = Colors.teal;
        break;
    }
    return result;
  }

}
