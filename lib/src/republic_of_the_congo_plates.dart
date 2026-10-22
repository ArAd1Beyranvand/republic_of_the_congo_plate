import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

import 'republic_of_the_congo_country.dart';
import 'republic_of_the_congo_regions.dart';

/// Plate units (520×110) measured off the reference photo at 4 px per unit.
/// The ink would need a ~147-unit box on a 110 plate, so the box is 100 and
/// the ink lands near 60% of the photo's.
abstract final class _Layout {
  static const double width = 520, height = 110;
  static const double cy = 56.8, box = 100;
  static const double numberCx = 117.5, numberPitch = 46.1;
  static const double seriesCx = 292, seriesPitch = 47;
  static const double areaCx = 410.8, areaPitch = 46;

  static const PlateBox emblem = PlateBox(27, 12.5, 48.5, 48.5);
  static const PlateBox rc = PlateBox(28, 62, 40, 46);
  static const double rcGlyph = 59;
}

/// The regular plate, `123 AB 4`; the area code is one or two digits (1–14)
/// in one field centred on the measured one-digit position. Groups `number`,
/// `series`, `area`.
///
/// Not implemented, for lack of a measured reference: the diplomatic and
/// temporary-import plates and the hologram sticker. The CEMAC emblem is a
/// crop of the reference photo, masked to a disc.
abstract final class RepublicOfTheCongoPlates {
  static final PlateSpec private = _spec();

  static List<PlateSpec> get all => <PlateSpec>[private];

  static const PlateDecal _emblem = PlateDecal(
    image: AssetImage('assets/icons/cemac_emblem.png', package: 'republic_of_the_congo_plate'),
    box: _Layout.emblem,
  );

  /// A field of up to [length] characters on [cx], [pitch] apart. A fixed
  /// field is spaced to the printed pitch; a variable one is centred on [cx].
  static PlateSlot _field(
    PlateAlphabet alphabet,
    int length,
    double cx,
    double pitch, {
    int? minLength,
  }) => PlateSlot(
    alphabet: alphabet,
    box: PlateBox(
      cx - length * pitch / 2,
      _Layout.cy - _Layout.box / 2,
      length * pitch,
      _Layout.box,
    ),
    length: length,
    minLength: minLength,
    spacing: minLength == null ? max(0, pitch - 0.6 * 0.72 * _Layout.box) : 0,
  );

  static PlateSpec _spec() {
    final List<PlateSlot> slots = <PlateSlot>[
      _field(
        RepublicOfTheCongoAlphabets.digits,
        3,
        _Layout.numberCx + _Layout.numberPitch,
        _Layout.numberPitch,
      ),
      _field(
        RepublicOfTheCongoAlphabets.letters,
        2,
        _Layout.seriesCx + _Layout.seriesPitch / 2,
        _Layout.seriesPitch,
      ),
      _field(
        RepublicOfTheCongoAlphabets.digits,
        2,
        _Layout.areaCx,
        _Layout.areaPitch,
        minLength: 1,
      ),
    ];
    return PlateSpec(
      id: 'cg.private',
      country: RepublicOfTheCongoCountry.republic_of_the_congo,
      canvasWidth: _Layout.width,
      canvasHeight: _Layout.height,
      panel: const PlatePanel(box: PlateBox(0, 0, 0, 0)),
      noPanel: true,
      slots: slots,
      textGroups: const <PlateTextGroup>[
        PlateTextGroup(<int>[0], key: 'number'),
        PlateTextGroup(<int>[1], key: 'series'),
        PlateTextGroup(<int>[2], key: 'area'),
      ],
      resolveRegion: RepublicOfTheCongoRegions.captionOf,
      decals: const <PlateDecal>[_emblem],
      labels: const <PlateLabel>[
        PlateLabel(text: 'RC', box: _Layout.rc, glyphHeight: _Layout.rcGlyph),
      ],
    );
  }
}
