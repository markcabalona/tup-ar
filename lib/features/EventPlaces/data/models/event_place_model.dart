import 'package:tup_ar/features/EventPlaces/data/models/location_model.dart';
import 'package:tup_ar/features/EventPlaces/domain/entities/company_details.dart';
import 'package:tup_ar/features/EventPlaces/domain/entities/event_place.dart';

class EventPlaceModel extends EventPlace {
  final String companySlug;
  const EventPlaceModel({
    required super.id,
    required super.name,
    required this.companySlug,
    required super.location,
    required super.eventTypes,
    required super.description,
    required super.capacity,
    required super.modelUrl,
    required super.companyDetails,
    super.thumbnailUrl,
  });

  factory EventPlaceModel.fromMap(Map<String, dynamic> map) {
    return EventPlaceModel(
      id: map['id'] ?? '',
      companySlug: map['company_slug'],
      name: map['name'] ?? '',
      location: LocationModel.fromMap(map['location']),
      eventTypes: List<String>.from(map['event_types']),
      description: map['description'] ?? '',
      capacity: map['capacity']?.toInt() ?? 0,
      modelUrl: map['model_url'] ?? '',
      thumbnailUrl: map['thumbnail_url'],
      companyDetails: const CompanyDetails(
        id: 'id',
        companyName: 'companyName',
        companySlug: 'companySlug',
        location: LocationModel(
          address: '',
          landmark: '',
        ),
        eventTypes: [],
      ),
    );
  }
  EventPlaceModel copyWith({
    String? id,
    String? name,
    CompanyDetails? companyDetails,
    LocationModel? location,
    List<String>? eventTypes,
    String? description,
    int? capacity,
    String? modelUrl,
    String? thumbnailUrl,
  }) {
    return EventPlaceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      companyDetails: companyDetails ?? this.companyDetails,
      location: location ?? this.location,
      eventTypes: eventTypes ?? this.eventTypes,
      description: description ?? this.description,
      capacity: capacity ?? this.capacity,
      modelUrl: modelUrl ?? this.modelUrl,
      companySlug:
          companyDetails?.companySlug ?? this.companyDetails.companySlug,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }
}
