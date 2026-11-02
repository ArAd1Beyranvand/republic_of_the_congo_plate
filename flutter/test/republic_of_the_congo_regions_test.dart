import 'package:flutter_test/flutter_test.dart';
import 'package:plate_core/plate_core.dart';
import 'package:republic_of_the_congo_plate/republic_of_the_congo_plate.dart';

void main() {
  test('one- and two-digit area codes', () {
    expect(
      RepublicOfTheCongoRegions.lookup('4'),
      'Capital District (Brazzaville)',
    );
    expect(RepublicOfTheCongoRegions.lookup('1'), 'Nkayi');
    expect(RepublicOfTheCongoRegions.lookup('10'), 'Loubomo');
    expect(RepublicOfTheCongoRegions.lookup('14'), 'Plateau');
  });

  test('empty and unissued codes name nothing', () {
    for (final String code in <String>['', '0', '15', '20', '99']) {
      expect(RepublicOfTheCongoRegions.lookup(code), isNull, reason: code);
    }
  });

  test('the controller follows each digit typed and deleted', () {
    final PlateController c = PlateController(
      spec: RepublicOfTheCongoPlates.private,
    );
    expect(c.regionCaption, isNull);
    c.setGroup('area', '1');
    expect(c.regionCaption, 'Nkayi');
    c.setGroup('area', '12');
    expect(c.regionCaption, 'Pool');
    c.setGroup('area', '1');
    expect(c.regionCaption, 'Nkayi');
  });
}
