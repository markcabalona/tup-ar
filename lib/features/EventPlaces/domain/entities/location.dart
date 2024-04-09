import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String address;
  final String landmark;
  const Location({
    required this.address,
    required this.landmark,
  });

  @override
  List<Object> get props => [address, landmark];
}
