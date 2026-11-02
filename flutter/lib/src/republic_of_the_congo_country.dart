import 'package:plate_core/plate_core.dart';

import 'republic_of_the_congo_colors.dart';

/// The plate carries no country block (the CEMAC emblem and "RC" are drawn by
/// the spec), so every spec sets `noPanel`.
abstract final class RepublicOfTheCongoCountry {
  // ignore: constant_identifier_names
  static const PlateCountry republic_of_the_congo = PlateCountry(
    code: 'cg',
    captionLines: <String>[],
    panelColor: RepublicOfTheCongoColors.white,
    panelTextColor: RepublicOfTheCongoColors.black,
  );
}
