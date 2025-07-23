import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/helper.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  final Helper helper;
  TimerCubit({
    required this.helper,
  }) : super(const TimerState(
          minute: '00',
          second: '00',
          currentAmount: 0,
        ));

  set updateTimer(Duration duration) {
    emit(TimerState(
      minute: helper.getMinute(duration),
      second: helper.getSecond(duration),
      currentAmount: duration.inSeconds,
    ));
  }
}
