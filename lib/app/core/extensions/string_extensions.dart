/// ===============================================================
/// STRING EXTENSION
/// ---------------------------------------------------------------
///
/// Common String utility extensions.
/// ===============================================================

extension StringExtension on String {
  /// Returns true if the string is a valid email.
  bool get isValidEmail {
    return RegExp(r'^[\w\-.]+@([\w\-]+\.)+[\w\-]{2,4}$').hasMatch(trim());
  }

  /// Returns true if the string is a valid 10-digit Indian mobile number.
  bool get isValidPhone {
    return RegExp(r'^[6-9]\d{9}$').hasMatch(trim());
  }

  /// Returns true if the string is empty after trimming.
  bool get isBlank => trim().isEmpty;

  /// Returns true if the string is not empty after trimming.
  bool get isNotBlank => trim().isNotEmpty;

  /// Capitalizes the first character.
  String get capitalize {
    if (trim().isEmpty) return '';

    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Converts every word to Title Case.
  String get titleCase {
    if (trim().isEmpty) return '';

    return trim()
        .split(RegExp(r'\s+'))
        .map(
          (word) => word.isEmpty
              ? ''
              : '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}',
        )
        .join(' ');
  }

  /// Removes all spaces.
  String get removeSpaces {
    return replaceAll(' ', '');
  }

  /// Returns initials from a full name.
  ///
  /// Example:
  /// "John Doe" -> "JD"
  String get initials {
    final words = trim().split(RegExp(r'\s+'));

    if (words.isEmpty) return '';

    if (words.length == 1) {
      return words.first[0].toUpperCase();
    }

    return '${words.first[0]}${words.last[0]}'.toUpperCase();
  }
}
