part of 'timer_cubit.dart';

class TimerState extends Equatable {
  final String minute;
  final String second;
  final int currentAmount;
  const TimerState({
    required this.minute,
    required this.second,
    required this.currentAmount,
  });

  @override
  List<Object> get props => [
        minute,
        second,
        currentAmount,
      ];
}
