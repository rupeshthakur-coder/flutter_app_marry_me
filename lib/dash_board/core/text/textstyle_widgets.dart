import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui_marry/dash_board/core/colors/home_color.dart';
import 'package:flutter_ui_marry/dash_board/core/text/text_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

extension CustomTextSize on Text {
  Text robottoregularsize12colorffA7A9B7() {
    return Text(data!,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
            fontSize: 12.sp,
            color: homeColorConstant.ff1D272F,
            fontWeight: FontWeights.regular,
          ),
        ));
  }
}
