import 'dart:math';

import 'package:flutter/services.dart';

/// A [TextInputFormatter] that only allows inserting valid VIN characters.
///
/// A valid VIN character is any digit and any letter, except for O, Q and I.
///
/// The formatter also normalizes the string to uppercase, so the input text may
/// be both inputted as lower case or uppercase, and the result will be always
/// the same.
///
/// If the user pastes a VIN with invalid characters, such as a dash, it will be
/// automatically removed.
final class VINInputFormatter extends TextInputFormatter {
  static final _invalidVinCharacters = RegExp('[^A-HJ-NPR-Z0-9]');
  
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final uppercaseInput = newValue.text.toUpperCase();
    final filteredInput = uppercaseInput.replaceAll(_invalidVinCharacters, '');
    final rangeStart = min(filteredInput.length, newValue.selection.start);
    final rangeEnd = min(filteredInput.length, newValue.selection.end);

    return newValue.copyWith(
      text: filteredInput.toUpperCase(),
      selection: TextSelection(baseOffset: rangeStart, extentOffset: rangeEnd),
    );
  }
}
