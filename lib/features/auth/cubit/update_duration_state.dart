part of 'update_duration_cubit.dart';

class UpdateDurationState extends Equatable {
  final int duration;
  final String text;
  const UpdateDurationState({
    this.text = '',
    required this.duration,
  });

  @override
  List<Object> get props => [duration, text];
}
