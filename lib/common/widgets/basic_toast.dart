import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'basicLogger.dart';

Future<void> basicToast({required String msg}) {
  logger.d(msg);
  return Fluttertoast.showToast(
    msg: 'testes',
    backgroundColor: Colors.white,
    textColor: Colors.red,
    fontSize: 15.sp,
  );
}
