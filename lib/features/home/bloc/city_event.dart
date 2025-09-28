part of 'city_bloc.dart';

 class CityEvent extends Equatable {
  const CityEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}



class GetDataEvent extends CityEvent {

}



class SetCityEvent extends CityEvent {
  final City? city;

  const SetCityEvent(this.city);
}
