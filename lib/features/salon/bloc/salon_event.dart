part of 'salon_bloc.dart';



class SalonEvent extends Equatable {
  const SalonEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChangeTopFilter extends SalonEvent {

  final TypeFilterSalon value;

  ChangeTopFilter(this.value);
}

class ChangeSource extends SalonEvent {

  final CityModels value;

  ChangeSource(this.value);
}

class ChangeDestination extends SalonEvent {

  final CityModels value;

  ChangeDestination(this.value);
}

class GetListCity extends SalonEvent {}
class GetListSalon extends SalonEvent {}

class GetDetailsSalon extends SalonEvent {

  final String value;

  GetDetailsSalon(this.value);
}

class ChangeTypeSalon extends SalonEvent {

  final TypeSalon value;

  ChangeTypeSalon(this.value);
}

class ChangeFilter extends SalonEvent {

  final CityModels? destination;
  final CityModels? source;

  ChangeFilter(this.destination, this.source);
}
