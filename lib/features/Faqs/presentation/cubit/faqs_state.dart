part of 'faqs_cubit.dart';

abstract class FaqsState extends Equatable {
  const FaqsState();

  @override
  List<Object?> get props => [];
}

class FaqsInitial extends FaqsState {}

class FaqsLoaded extends FaqsState {
  final List<Faq> faqs;
  const FaqsLoaded({
    required this.faqs,
  });

  @override
  List<Object?> get props => [
        faqs,
      ];
}

class FaqsError extends FaqsState {
  final String? message;
  const FaqsError({
    this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}
