/// ===============================================================
/// QUOTE MODEL
/// ---------------------------------------------------------------
/// Model representing a quotation request submitted by a user.
/// ===============================================================

class QuoteModel {
  const QuoteModel({
    required this.name,
    required this.phoneNumber,
    required this.pickupLocation,
    required this.destinationLocation,
    required this.movingDate,
  });

  factory QuoteModel.fromMap(Map<String, dynamic> map) {
    return QuoteModel(
      name: map['name'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      pickupLocation: map['pickupLocation'] ?? '',
      destinationLocation: map['destinationLocation'] ?? '',
      movingDate: map['movingDate'] ?? '',
    );
  }

  final String destinationLocation;
  final String movingDate;
  final String name;
  final String phoneNumber;
  final String pickupLocation;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is QuoteModel &&
            other.name == name &&
            other.phoneNumber == phoneNumber &&
            other.pickupLocation == pickupLocation &&
            other.destinationLocation == destinationLocation &&
            other.movingDate == movingDate;
  }

  @override
  int get hashCode => Object.hash(
    name,
    phoneNumber,
    pickupLocation,
    destinationLocation,
    movingDate,
  );

  @override
  String toString() {
    return 'QuoteModel('
        'name: $name, '
        'phoneNumber: $phoneNumber, '
        'pickupLocation: $pickupLocation, '
        'destinationLocation: $destinationLocation, '
        'movingDate: $movingDate'
        ')';
  }

  QuoteModel copyWith({
    String? name,
    String? phoneNumber,
    String? pickupLocation,
    String? destinationLocation,
    String? movingDate,
  }) {
    return QuoteModel(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      pickupLocation: pickupLocation ?? this.pickupLocation,
      destinationLocation: destinationLocation ?? this.destinationLocation,
      movingDate: movingDate ?? this.movingDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'pickupLocation': pickupLocation,
      'destinationLocation': destinationLocation,
      'movingDate': movingDate,
    };
  }
}
