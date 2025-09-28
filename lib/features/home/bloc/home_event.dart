part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}


class GetDataEvent extends HomeEvent{

  final Map<String,dynamic> map;
   GetDataEvent(this.map);
}
