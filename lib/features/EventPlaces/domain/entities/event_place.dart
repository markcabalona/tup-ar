import 'package:equatable/equatable.dart';

class EventPlace extends Equatable {
  final String id;
  final String name;
  final String description;
  final String? thumbnailUrl;
  final String? arModelPath;
  const EventPlace({
    required this.id,
    required this.name,
    required this.description,
    this.thumbnailUrl,
    this.arModelPath,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      thumbnailUrl,
      arModelPath,
    ];
  }
}
