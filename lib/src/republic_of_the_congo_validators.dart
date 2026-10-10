import 'package:plate_core/plate_core.dart';

/// Judges a Congolese regular plate: `123 AB 4` — three digits, two letters
/// and an area code of one or two digits (1–14). Reports, never bars input.
class RepublicOfTheCongoValidator extends GatedPlateValidator {
  const RepublicOfTheCongoValidator();

  @override
  String get gateGroup => 'area';

  @override
  PlateValidation judge(PlateEntry entry) {
    if (!isDigitsOfLength(entry.group('number'), 3)) {
      return const PlateValidation.invalid('The number is 3 digits.');
    }
    if (!RegExp(r'^[A-Z]{2}$').hasMatch(entry.group('series'))) {
      return const PlateValidation.invalid('The series is 2 letters.');
    }
    final int? area = int.tryParse(entry.group('area'));
    if (area == null || area < 1 || area > 14) {
      return const PlateValidation.invalid('The area code is 1 to 14.');
    }
    return const PlateValidation.valid();
  }
}
