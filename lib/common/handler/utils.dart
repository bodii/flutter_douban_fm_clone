import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class Utils {
  static void toast(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  static String generateRandomString(int len) {
    const int lowerStartNumber = 97;
    const int caseStartNumber = 65;

    final random = Random();
    final result = String.fromCharCodes(List.generate(len, (index) {
      bool lowerOrcase = random.nextBool();
      int number = lowerOrcase ? lowerStartNumber : caseStartNumber;
      return random.nextInt(26) + number;
    }));
    return result;
  }

  static String generateToken(String str) {
    return md5.convert(utf8.encode(str)).toString();
  }
}
