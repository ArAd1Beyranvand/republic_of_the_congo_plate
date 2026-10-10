import 'package:flutter/widgets.dart';
import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

import 'republic_of_the_congo_country.dart';

/// Where the ink sits, in plate units (520×110 mm, the article's size).
///
/// Measured off the flattened photo `____1` (4 px per unit): digit ink y
/// 16–97.5 (cy 56.8, 81 tall); digit cells centred 117.5, 163.6, 209.7
/// (pitch 46.1); letters E, A centred 292, 339 (pitch 47); the area digit
/// centred 410.8. The ink would need a ~147-unit box on a 110 plate, so the
/// box is 100 and the ink lands near 60% of the photo's. The CEMAC emblem is
/// x 27–75.5, y 12.5–60 and "RC" is centred x 48, ink y 69–101 (32 tall).
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

/// The regular plate, `123 AB 4`. Groups `number`, `series`, `area`.
///
/// Not implemented: the diplomatic plate (orange on green, `123 CD 45`) and the
/// temporary-import plate (black on green, `123 AB 4 IT`), which the article
/// describes but pictures nowhere, so no reference was measured; the
/// hologram sticker at x 487–508 is not drawn. The CEMAC emblem is a crop of
/// the reference photo (no vector is on Commons), masked to a disc. The
/// article names nothing Israel-specific.
abstract final class RepublicOfTheCongoPlates {
  /// One-digit area code (1–9).
  static final PlateSpec private = _spec('cg.private', 1);

  /// Two-digit area code (10–14).
  static final PlateSpec privateTwoDigitArea = _spec('cg.private2', 2);

  static List<PlateSpec> get all => <PlateSpec>[private, privateTwoDigitArea];

  static const PlateDecal _emblem = PlateDecal(
    image: AssetImage(
      'assets/icons/cemac_emblem.png',
      package: 'republic_of_the_congo_plate',
    ),
    box: _Layout.emblem,
  );

  static List<PlateSlot> _run(
    PlateAlphabet alphabet,
    int count,
    double cx,
    double pitch,
  ) => plateRegister(
    alphabet: alphabet,
    count: count,
    left: cx - pitch / 2,
    top: _Layout.cy - _Layout.box / 2,
    width: pitch,
    height: _Layout.box,
  );

  static PlateSpec _spec(String id, int areaDigits) {
    final List<PlateSlot> slots = <PlateSlot>[
      ..._run(
        RepublicOfTheCongoAlphabets.digits,
        3,
        _Layout.numberCx,
        _Layout.numberPitch,
      ),
      ..._run(
        RepublicOfTheCongoAlphabets.letters,
        2,
        _Layout.seriesCx,
        _Layout.seriesPitch,
      ),
      ..._run(
        RepublicOfTheCongoAlphabets.digits,
        areaDigits,
        _Layout.areaCx,
        _Layout.areaPitch,
      ),
    ];
    return PlateSpec(
      id: id,
      country: RepublicOfTheCongoCountry.republic_of_the_congo,
      canvasWidth: _Layout.width,
      canvasHeight: _Layout.height,
      panel: const PlatePanel(box: PlateBox(0, 0, 0, 0)),
      noPanel: true,
      slots: slots,
      textGroups: <PlateTextGroup>[
        PlateTextGroup(const <int>[0, 1, 2], key: 'number'),
        PlateTextGroup(const <int>[3, 4], key: 'series'),
        PlateTextGroup(<int>[
          for (int i = 0; i < areaDigits; i++) 5 + i,
        ], key: 'area'),
      ],
      decals: const <PlateDecal>[_emblem],
      labels: const <PlateLabel>[
        PlateLabel(text: 'RC', box: _Layout.rc, glyphHeight: _Layout.rcGlyph),
      ],
    );
  }
}
