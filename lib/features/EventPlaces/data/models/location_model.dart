import 'package:tup_ar/features/EventPlaces/domain/entities/location.dart';

class LocationModel extends Location {
  const LocationModel({
    required super.address,
    required super.landmark,
  });

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'landmark': landmark,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      address: map['address'] ?? '',
      landmark: map['landmark'] ?? '',
    );
  }
}
