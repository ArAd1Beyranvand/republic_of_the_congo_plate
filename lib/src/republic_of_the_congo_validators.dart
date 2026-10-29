import 'package:plate_core/plate_core.dart';

// TODO(py): [D4-code] hand-port; reason strings are the contract, keep them byte-identical.
// TODO(ts): [D4-code] hand-port; reason strings are the contract, keep them byte-identical.
// TODO(kt): [D4-code] hand-port; reason strings are the contract, keep them byte-identical.
/// Judges a Congolese regular plate: `123 AB 4` — three digits, two letters
/// and an area code of one or two digits (1–14). Reports, never bars input.
class RepublicOfTheCongoValidator extends GatedPlateValidator {
  const RepublicOfTheCongoValidator();

  // TODO(py): [H9] Python re: \d/\w match Unicode; keep explicit [0-9]/[A-Z] classes (or re.ASCII).
  // TODO(ts): [H9] same flavour as Dart; port as is, cover accept/reject in the vectors (D9).
  // TODO(kt): [H9] Regex engine differs per target (JVM/JS/Native): keep to portable syntax.
  static final RegExp _series = RegExp(r'^[A-Z]{2}$');

  @override
  String get gateGroup => 'area';

  @override
  PlateValidation judge(PlateEntry entry) {
    if (!isDigitsOfLength(entry.group('number'), 3)) {
      return const PlateValidation.invalid('The number is 3 digits.');
    }
    if (!_series.hasMatch(entry.group('series'))) {
      return const PlateValidation.invalid('The series is 2 letters.');
    }
    final int? area = int.tryParse(entry.group('area'));
    if (area == null || area < 1 || area > 14) {
      return const PlateValidation.invalid('The area code is 1 to 14.');
    }
    return const PlateValidation.valid();
  }
}
