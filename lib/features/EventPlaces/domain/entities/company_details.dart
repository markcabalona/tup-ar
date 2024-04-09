import 'package:equatable/equatable.dart';
import 'package:tup_ar/features/EventPlaces/domain/entities/location.dart';

class CompanyDetails extends Equatable {
  final String id;
  final String companyName;
  final String companySlug;
  final Location location;
  final List<String> eventTypes;
  const CompanyDetails({
    required this.id,
    required this.companyName,
    required this.companySlug,
    required this.location,
    required this.eventTypes,
  });

  @override
  List<Object> get props {
    return [
      id,
      companyName,
      companySlug,
      location,
      eventTypes,
    ];
  }
}
