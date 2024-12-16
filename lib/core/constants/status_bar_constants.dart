import 'package:flutter/services.dart';
import 'package:payoll/core/constants/color_constants.dart';

void setStatusBar({Color? color}) =>
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color ?? ColorConstants.primary500,
    ));
