import 'package:equatable/equatable.dart';
import 'package:tup_ar/features/EventPlaces/domain/entities/company_details.dart';
import 'package:tup_ar/features/EventPlaces/domain/entities/location.dart';

class EventPlace extends Equatable {
  final String id;
  final String name;
  final CompanyDetails companyDetails;
  final Location location;
  final List<String> eventTypes;
  final String description;
  final int capacity;
  final String modelUrl;
  final String? thumbnailUrl;

  const EventPlace({
    required this.id,
    required this.name,
    required this.companyDetails,
    required this.location,
    required this.eventTypes,
    required this.description,
    required this.capacity,
    required this.modelUrl,
    this.thumbnailUrl,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      companyDetails,
      location,
      eventTypes,
      description,
      capacity,
      modelUrl,
      thumbnailUrl,
    ];
  }
}
