import 'package:flutter/material.dart';

import '../colors.dart';

class KasbonUtil {
  static String religionLabel(String? religionId) {
    switch (religionId) {
      case "01":
        return "Islam";

      case "02":
        return "Kristen";

      case "03":
        return "Katolik";

      case "04":
        return "Hindu";

      case "05":
        return "Buddha";

      case "06":
        return "Konghuchu";

      default:
        return "Lainnya";
    }
  }

  static String purposeLabel(String? purposeId) {
    switch (purposeId) {
      case "01":
        return "Kebutuhan Hidup";

      case "02":
        return "Pembelian Konsumtif";

      case "03":
        return "Modal Kerja";

      case "04":
        return "Kesehatan";

      case "05":
        return "Pendidikan";

      case "06":
        return "Liburan";

      case "07":
        return "Biaya Kelahiran";

      case "08":
        return "Pernikahan";

      case "09":
        return "Renovasi Rumah";

      default:
        return "Lainnya";
    }
  }

  static String positionLabel(String? positionId) {
    switch (positionId) {
      case "01":
        return "Supervisor";

      case "02":
        return "Director";

      case "03":
        return "Manager";

      case "04":
        return "Staff";

      default:
        return "Lainnya";
    }
  }

  static String homeStatusLabel(String? homeStatusId) {
    switch (homeStatusId) {
      case "01":
        return "Milik Sendiri";

      case "02":
        return "Kontrak";

      case "03":
        return "Kontrak Jangka Pendek";

      case "04":
        return "Keluarga";

      case "05":
        return "Gadai";

      case "06":
        return "Perusahaan";

      default:
        return "Lainnya";
    }
  }

  static String relationLabel(String? relationId) {
    switch (relationId) {
      case "01":
        return "Pasangan";

      case "02":
        return "Orang Tua";

      case "03":
        return "Anak";

      case "04":
        return "Saudara laki-laki/perempuan";

      case "05":
        return "Saudara Kandung";

      case "06":
        return "Teman";

      case "07":
        return "Rekan Kerja";

      default:
        return "Lainnya";
    }
  }

  static String jobTypeLabel(String? jobTypeId) {
    switch (jobTypeId) {
      case "01":
        return "Wirausaha";

      case "02":
        return "Karyawan Swasta";

      case "03":
        return "PNS";

      case "04":
        return "Profesional";

      case "05":
        return "Sipil";

      case "06":
        return "Pelajar";

      case "07":
        return "Pencari Kerja";

      case "08":
        return "Honorer";

      default:
        return "Lainnya";
    }
  }

  static String convertMaritalStatus(String maritalStatus) {
    String result;
    switch (maritalStatus) {
      case "Lajang":
      case "Single":
        result = "01";
        break;
      case "Menikah":
        result = "02";
        break;
      case "Cerai":
      case "Pisah":
        result = "03";
        break;
      default:
        result = "05";
    }
    return result;
  }

  static String convertMaritalStatus1(String maritalStatus) {
    String result;
    switch (maritalStatus) {
      case "single":
        result = "Lajang";
        break;
      case "married":
        result = "Menikah";
        break;
      case "separated":
        result = "Cerai";
        break;
      default:
        result = "Lain-lain";
    }
    return result;
  }

  static String convertMaritalStatus2(String maritalStatus) {
    String result;
    switch (maritalStatus) {
      case "single":
        result = "01";
        break;
      case "married":
        result = "02";
        break;
      case "separated":
        result = "03";
        break;
      default:
        result = "05";
    }
    return result;
  }

  static String convertEducation(String degree) {
    String result;
    switch (degree) {
      case "SD":
        result = "02";
        break;
      case "SMP":
        result = "03";
        break;
      case "SMK":
      case "SMA/SMK":
      case "SMA":
        result = "04";
        break;
      case "D1":
        result = "06";
        break;
      case "D2":
        result = "07";
        break;
      case "D3":
        result = "08";
        break;
      case "S1":
        result = "09";
        break;
      case "S2":
        result = "10";
        break;
      case "S3":
        result = "11";
        break;
      default:
        result = "01";
    }
    return result;
  }

  static Widget convertOrderStatus(String enums) {
    var result;
    switch (enums) {
      case "Ongoing Verification Process":
        result = Text(
          "Verifikasi Pinjaman",
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Job2goPalette.blackMedium),
        );
        break;
      case "Ongoing Disbursement Process":
        result = Text(
          "Pencairan Pinjaman",
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w400, color: Colors.blue),
        );
        break;
      case "Transaction is Complete":
        result = Text(
          "Selesai",
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w400, color: Colors.green),
        );
        break;
      case "Disbursement Failure. Please Check Destination Account":
        result = Text(
          "Pinjaman Gagal",
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w400, color: Colors.red),
        );
        break;
      case "Rejected":
        result = Text(
          "Pinjaman Ditolak",
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w400, color: Colors.red),
        );
        break;
      case "Transaction is Canceled":
        result = Text(
          "Pinjaman Dibatalkan",
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Job2goPalette.blackInactive),
        );
        break;

        //
      case "PENDING":
        result = Text(
          "Pinjaman Pending",
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.amber),
        );
        break;
      case "REJECTED":
        result = Text(
          "Pinjaman Ditolak",
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Job2goPalette.red),
        );
        break;
      case "APPROVED":
        result = Text(
          "Pinjaman Berhasil",
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Job2goPalette.greenSuccess),
        );
        break;
      case "RETURNED":
        result = Text(
          "Pinjaman Gagal",
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Job2goPalette.red),
        );
        break;
      case "CANCELED":
        result = Text(
          "Pinjaman Dibatalkan",
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.amber),
        );
        break;
      case "Delivered":
        result = Text(
          "Pinjaman Terkirim",
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.green),
        );
        break;
      case "Failed":
        result = Text(
          "Pinjaman Gagal",
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.red),
        );
        break;
      case "DISBURSEMENT_FAILED":
        result = Text(
          "Pinjaman Gagal",
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Job2goPalette.red),
        );
        break;
      case "ONGOING":
      case "In Process":
        result = Text(
          "Pinjaman Diproses",
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.blue),
        );
        break;
    //
      default:
        result = Text(
          enums,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        );
    }

    return result;
  }

  static Widget convertKancilOrderStatus(String enums) {
    var result;
    switch (enums) {
      case "completed":
        result = Text(
          "Dicairkan",
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Job2goPalette.greenSuccess),
        );
        break;
      case "paid":
        result = Text(
          "Dibayar",
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Job2goPalette.greenSuccess),
        );
        break;
      case "draft":
        result = Text(
          "Draft",
          style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Job2goPalette.blackMedium),
        );
        break;
      case "submitted":
        result = Text(
          "Diajukan",
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w400, color: Colors.blue),
        );
        break;
      case "approved":
        result = Text(
          "Disetujui",
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w400, color: Colors.green),
        );
        break;
      case "processed":
        result = Text(
          "Sedang diproses",
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w400, color: Colors.amber),
        );
        break;
      case "rejected":
        result = Text(
          "Ditolak",
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.w400, color: Colors.red),
        );
        break;
      default:
        result = Text(
          enums,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        );
    }

    return result;
  }

  static String convertKancilStatus(String enums) {
    var result;
    switch (enums) {
      case "active":
        result = 'Aktif';
        break;
      case "unpaid":
        result = 'Belum Dibayar';
        break;
      case "paid":
        result = 'Sudah Dibayar';
        break;
      case "done":
        result = 'Selesai';
        break;
      case "completed":
        result = 'Dicairkan';
        break;
      case "approved":
        result = 'Disetujui';
        break;
      case "submitted":
        result = 'Diajukan';
        break;
      case "rejected":
        result = 'Ditolak';
        break;
      default:
        result = enums;
    }
    return result;
  }

  static Color convertKancilStatusColor(String enums) {
    var result;
    switch (enums) {
      case "unpaid":
        result = Colors.orange;
        break;
      case "paid":
        result = Colors.green;
        break;
      case "completed":
      case "approved":
      case "active":
      case "done":
        result = Colors.green;
        break;
      case "submitted":
        result = Colors.blue;
        break;
      case "rejected":
        result = Colors.red;
        break;
      default:
        result = Colors.black;;
    }
    return result;
  }

  static Color convertKancilStatusBackgroundColor(String enums) {
    var result;
    switch (enums) {
      case "unpaid":
        result = Colors.orange.withOpacity(0.3);
        break;
      case "paid":
        result = Colors.green.withOpacity(0.3);
        break;
      case "completed":
      case "approved":
      case "done":
      case "active":
        result = Colors.green.withOpacity(0.3);
        break;
      case "submitted":
        result = Colors.blue.withOpacity(0.3);
        break;
      case "rejected":
        result = Colors.red.withOpacity(0.3);
        break;
      default:
        result = Colors.black.withOpacity(0.3);
    }
    return result;
  }

}
