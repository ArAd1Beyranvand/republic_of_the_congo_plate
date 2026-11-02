"""Port of republic_of_the_congo_plate/lib/src/republic_of_the_congo_validators.dart. Hand-ported; codegen never overwrites this file."""
from __future__ import annotations

import re

from plates.core.validators.plate_validator import GatedPlateValidator, PlateEntry, PlateValidation, is_digits, is_digits_of_length


class RepublicOfTheCongoValidator(GatedPlateValidator):
    gate_group = 'area'

    def judge(self, entry: PlateEntry) -> PlateValidation:
        if not is_digits_of_length(entry.group("number"), 3):
            return PlateValidation.invalid("The number is 3 digits.")
        if re.fullmatch(r"[A-Z]{2}", entry.group("series")) is None:
            return PlateValidation.invalid("The series is 2 letters.")
        area = entry.group("area")
        if not (is_digits(area) and 1 <= int(area) <= 14):
            return PlateValidation.invalid("The area code is 1 to 14.")
        return PlateValidation.valid()
