class ApiConsts {
  static const baseUrl = 'http://79.143.90.196/api/v1';

  /// login consts
  static const loginUrl = '$baseUrl/auth/login';

  /// getuser consts
  static const getUsers = '$baseUrl/users/getAll';

  static const getLockStatus = '$baseUrl/devices/getLockStatus';
  static const updateLockStatusBy = '$baseUrl/devices/updateLockStatusBy';
  static const updateLockStatus = '$baseUrl/devices/updateLockStatus';

  /// Notification

  static const notificationUrl = 'https://fcm.googleapis.com/fcm/send';
}
