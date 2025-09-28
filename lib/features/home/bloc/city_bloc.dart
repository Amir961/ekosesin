import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fare/core/utils/enum.dart';


import '../../../core/network/api_service.dart';
import '../model/city.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {


  final ApiService apiService;
  CityBloc(this.apiService) : super(CityState(statusButton: StatusButton.none,listCity: [], selectedCity: null, message: '')) {

    on<GetDataEvent>(_onGetDataEvent);
    on<SetCityEvent>(_onSetCityEvent);
  }

  _onSetCityEvent(
      SetCityEvent event,
      Emitter<CityState> emit,
      ) async {

    emit(state.copyWith(selectedCity: event.city));




  }


  _onGetDataEvent(
      GetDataEvent event,
      Emitter<CityState> emit,
      ) async {

    emit(state.copyWith(statusButton: StatusButton.loading));

    try {
      final responseJson= await apiService.get('lookup/cities/', );

  //  final List<City> list=  result['data'].map((json) => City.fromJson(json)).toList();

      final List<City> cities = (responseJson['data'] as List)
          .map((json) => City.fromJson(json))
          .toList();


      emit(state.copyWith(listCity: cities,statusButton: StatusButton.success));



    } on ConnectionException catch (e) {
      emit(state.copyWith(statusButton: StatusButton.noInternet));

    } on ApiException catch (e) {
      emit(state.copyWith(statusButton: StatusButton.failed,message: e.message));

    } catch (e) {
      emit(state.copyWith(statusButton: StatusButton.failed,message: e.toString()));

    }


  }
}
