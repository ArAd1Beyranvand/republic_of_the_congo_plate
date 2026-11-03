FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of the Republic of the Congo to view examples:

https://platexample.ir/#/discover/republicofthecongo:flutter

# republic_of_the_congo_plate

Republic of the Congo's licence plates for the plate_core library — the regular black-on-white plate with the CEMAC emblem, one theme, Latin alphabets and an advisory validator.

## Languages

| Language | Folder | Example |
| --- | --- | --- |
| Flutter / Dart | [`flutter/`](https://github.com/ArAd1Beyranvand/republic_of_the_congo_plate/tree/main/flutter) | [platexample](https://platexample.ir/#/discover/republicofthecongo:flutter) |
| Kotlin | [`kotlin/`](https://github.com/ArAd1Beyranvand/republic_of_the_congo_plate/tree/main/kotlin) | [platexample](https://platexample.ir/#/discover/republicofthecongo:kotlin) |
| Python | [`python/`](https://github.com/ArAd1Beyranvand/republic_of_the_congo_plate/tree/main/python) | [platexample](https://platexample.ir/#/discover/republicofthecongo:python) |
| TypeScript | [`typescript/`](https://github.com/ArAd1Beyranvand/republic_of_the_congo_plate/tree/main/typescript) | [platexample](https://platexample.ir/#/discover/republicofthecongo:typescript) |

## Quick start

### Install

```yaml
dependencies:
  plate_core: ^0.12.0
  republic_of_the_congo_plate: ^0.1.0
```

### Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:republic_of_the_congo_plate/republic_of_the_congo_plate.dart';

PlateCanvas(
  spec: RepublicOfTheCongoPlates.private,
  theme: RepublicOfTheCongoThemes.private,
  validator: const RepublicOfTheCongoValidator(),
  autoValidate: true,
  onChooseCharacter: noCharacterChooser,
);
```

## Specs

Each spec is one plate layout.

- `RepublicOfTheCongoPlates.private`

## Themes

- `RepublicOfTheCongoThemes.private`

## Change it

`PlateCanvas` takes `spec:` (an entry of `RepublicOfTheCongoPlates`) and `theme:` (an entry of `RepublicOfTheCongoThemes`). Set `validator:` to `RepublicOfTheCongoValidator()` and `autoValidate: true` to show validation hints.

## Also included

- `RepublicOfTheCongoCountry` — the country panel.
- `RepublicOfTheCongoValidator` — the plate validator.
- `RepublicOfTheCongoRegions` — code table.

## Plates

The regular plate, `123 AB 4`; the area code is one or two digits (1–14)
in one field centred on the measured one-digit position. Groups `number`,
`series`, `area`.

Not implemented, for lack of a measured reference: the diplomatic and
temporary-import plates and the hologram sticker. The CEMAC emblem is a
crop of the reference photo, masked to a disc.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/republic_of_the_congo_plate/blob/main/LICENSE).
