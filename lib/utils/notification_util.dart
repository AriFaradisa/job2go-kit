class NotificationUtils {
  static int generateNotificationId(String enums) {
    int result = 0;
    switch (enums) {
      case "kasbon":
        result = 10;
        break;
      case "leave_request":
        result = 11;
        break;
      case "leave_approval":
        result = 12;
        break;
      case "remainder":
        result = 13;
        break;
    }
    return result;
  }
}
