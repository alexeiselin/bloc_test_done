abstract class LoginRepository {
  /// requests sms for the provided @phone. Can throw error if server replies that phone is incorrect or unavailable for sending sms
  Future requestSms(String phone);

  /// asks server if the provided @code is the same as the one sent to the client with @phone. Returns String typed token if the codes are the same
  Future<String> checkCode(String phone, String code);
}
