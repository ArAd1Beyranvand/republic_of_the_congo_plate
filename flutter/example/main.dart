import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';
import 'package:republic_of_the_congo_plate/republic_of_the_congo_plate.dart';

void main() => runApp(
  PlateExampleApp(
    spec: RepublicOfTheCongoPlates.private,
    theme: RepublicOfTheCongoThemes.private,
  ),
);
