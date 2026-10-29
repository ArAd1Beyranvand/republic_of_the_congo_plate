/// Republic of the Congo's licence plates for the `plate_core` library.
///
/// The regular black-on-white plate with the CEMAC emblem and RC, and an
/// advisory validator.
library;

// TODO(py): [D5] one module `plates.countries.republic_of_the_congo`; assets via importlib.resources.
// TODO(ts): [D5] one subpath export `./countries/republic_of_the_congo`; tree-shakable.
// TODO(kt): [D5] package `countries.republic_of_the_congo` in the countries module.
export 'package:plate_alphabet/plate_alphabet.dart'
    show RepublicOfTheCongoAlphabets;

export 'src/republic_of_the_congo_colors.dart';
export 'src/republic_of_the_congo_country.dart';
export 'src/republic_of_the_congo_plates.dart';
export 'src/republic_of_the_congo_regions.dart';
export 'src/republic_of_the_congo_themes.dart';
export 'src/republic_of_the_congo_validators.dart';
