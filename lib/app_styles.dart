import 'package:flutter/material.dart';

const Color kBrown = Color(0xff292526);
const Color kDarkBrown = Color(0xff1b2028);

const Color kGrey = Color(0xffa4aaad);
const Color kDarkGrey = Color(0xff878787);
const Color kLightGrey = Color(0xffededed);

const Color kBorderColor = Color(0xffEAEAEA);

const Color kWhite = Color(0xffffffff);

const Color kBlack = Color(0xff111111);

const Color kYellow = Color(0xffffd33c);

const Color kBlue = Color(0xff347EFB);

const double kBorderRadius = 12.0;

const double kPaddingHorizontal = 24.0;

final kInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(kBorderRadius),
  borderSide: const BorderSide(
    color: kLightGrey,
  ),
);

final kEncodeSansBold = TextStyle(
  fontWeight: FontWeight.w700,
);

final kEncodeSansSemibold = TextStyle(
  fontWeight: FontWeight.w600,
);

final kEncodeSansMedium = TextStyle(
  fontWeight: FontWeight.w500,
);

final kEncodeSansRagular = TextStyle(
  fontWeight: FontWeight.w400,
);