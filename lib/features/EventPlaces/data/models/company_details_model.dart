import 'package:tup_ar/features/EventPlaces/data/models/location_model.dart';
import 'package:tup_ar/features/EventPlaces/domain/entities/company_details.dart';

class CompanyDetailsModel extends CompanyDetails {
  final LocationModel locationModel;
  const CompanyDetailsModel({
    required super.id,
    required super.companyName,
    required super.companySlug,
    required this.locationModel,
    required super.eventTypes,
  }) : super(location: locationModel);

  Map<String, dynamic> toMap() {
    return {
      'company_name': companyName,
      'company_slug': companySlug,
      'location': locationModel.toMap(),
      'event_types': eventTypes,
    };
  }

  factory CompanyDetailsModel.fromMap(Map<String, dynamic> map) {
    return CompanyDetailsModel(
      id: map['id'] ?? '',
      companyName: map['company_name'] ?? '',
      companySlug: map['company_slug'] ?? '',
      locationModel: LocationModel.fromMap(map['location']),
      eventTypes: List<String>.from(map['event_types']),
    );
  }
}
