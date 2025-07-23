import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_duration_state.dart';

class UpdateDurationCubit extends Cubit<UpdateDurationState> {
  UpdateDurationCubit() : super(const UpdateDurationState(duration: 0));

  void setDuration(Duration duration) =>
      emit(UpdateDurationState(duration: duration.inSeconds, text: state.text));


  // int getDuration()
  // {
  //   return state.duration;
  // }

  void setText(String text) =>
      emit(UpdateDurationState(duration: state.duration, text: text));
}
