import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptionHelper {
  static String encryptPassword(String password, String username) {
    final key = encrypt.Key.fromUtf8(username.padRight(16, '*').substring(0, 16));
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    return encrypter.encrypt(password, iv: iv).base64;
  }

  static String decryptPassword(String encryptedPassword, String username) {
    final key = encrypt.Key.fromUtf8(username.padRight(16, '*').substring(0, 16));
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    return encrypter.decrypt64(encryptedPassword, iv: iv);
  }
}
