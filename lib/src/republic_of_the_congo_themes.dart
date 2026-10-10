import 'package:plate_core/plate_core.dart';

import 'republic_of_the_congo_colors.dart';

/// Black on white, frame in the ink. Frame 0.04 and corners 0.06 of the height
/// are read off the flattened photo's outline, not measured precisely.
abstract final class RepublicOfTheCongoThemes {
  static const PlateTheme private = PlateTheme.monochrome(
    field: RepublicOfTheCongoColors.white,
    ink: RepublicOfTheCongoColors.black,
    inactive: RepublicOfTheCongoColors.inactive,
    borderWidthRatio: 0.04,
    plateRadiusRatio: 0.06,
  );
}
