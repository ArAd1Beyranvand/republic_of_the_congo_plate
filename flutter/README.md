FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of the Republic of the Congo to view examples:

https://platexample.ir/#/discover/republicofthecongo

# republic_of_the_congo_plate

Republic of the Congo's licence plates for the `plate_core` library. The regular black-on-white plate with the CEMAC emblem and RC, and an advisory validator.

## Install

```yaml
dependencies:
  plate_core: ^0.12.0
  republic_of_the_congo_plate: ^0.1.0
```

## Use

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

## Contains

- `RepublicOfTheCongoCountry` — country panel: `republic_of_the_congo`.
- `RepublicOfTheCongoPlates` — 1 plate spec: `private`.
- `RepublicOfTheCongoThemes` — 1 theme: `private`.
- `RepublicOfTheCongoValidator` — advisory validator; flags the frame, never blocks a keystroke.
- `RepublicOfTheCongoRegions` — code table.
- 1 bundled asset (`cemac_emblem.png`).

## Plates

The regular plate, `123 AB 4`; the area code is one or two digits (1–14)
in one field centred on the measured one-digit position. Groups `number`,
`series`, `area`.

Not implemented, for lack of a measured reference: the diplomatic and
temporary-import plates and the hologram sticker. The CEMAC emblem is a
crop of the reference photo, masked to a disc.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

