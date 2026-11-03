import 'package:flutter_test/flutter_test.dart';
import 'package:plate_core/plate_core.dart';
import 'package:plate_core/testing.dart';
import 'package:republic_of_the_congo_plate/republic_of_the_congo_plate.dart';

void main() {
  plateGoldens(
    'cg',
    RepublicOfTheCongoCountry.republic_of_the_congo,
    <String, PlateGoldenCase>{
      'private': (
        RepublicOfTheCongoPlates.private,
        RepublicOfTheCongoThemes.private,
        '229 EA 2',
      ),
      'private_two_digit_area': (
        RepublicOfTheCongoPlates.private,
        RepublicOfTheCongoThemes.private,
        '229 EA 12',
      ),
    },
    decodeDelay: const Duration(milliseconds: 300),
  );

  test('the area is one field of one or two digits', () {
    final PlateSpec spec = RepublicOfTheCongoPlates.private;
    expect(spec.slots.map((PlateSlot s) => s.length), <int>[3, 2, 2]);
    expect(spec.slots.map((PlateSlot s) => s.minLength), <int>[3, 2, 1]);
    PlateController c = PlateController.fromValues(spec, ['229', 'EA', '2']);
    expect(c.isCompleted, isTrue);
    c.dispose();
    c = PlateController.fromValues(spec, ['229', 'EA', null]);
    expect(c.isCompleted, isFalse);
    c.dispose();
  });
}
