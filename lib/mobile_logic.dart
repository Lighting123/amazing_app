import 'dart:io';

import 'package:flutter/material.dart';

EdgeInsets adjusttextFieldInsetsForMobile() {
  if (Platform.isAndroid) {
    return const EdgeInsets.symmetric(vertical: 10, horizontal: 10);
  } else {
    return const EdgeInsets.only(right: 980, top: 10);
  }
}
