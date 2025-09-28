import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fare/core/network/api_service.dart';
import 'package:meta/meta.dart';

import '../../../core/utils/enum.dart';
import '../model/product.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  
  final ApiService apiService;
  HomeBloc(this.apiService) : super(HomeState(message: '', statusButton: StatusButton.none, listProduct: [])) {

    on<GetDataEvent>(_onGetDataEvent);
  }
  _onGetDataEvent(
      GetDataEvent event,
      Emitter<HomeState> emit,
      ) async {

    emit(state.copyWith(statusButton: StatusButton.loading));

    try {
     final responseJson= await apiService.get('posters', queryParameters: event.map);

     final List<Product> products = (responseJson['data']['items'] as List)
         .map((json) => Product.fromJson(json))
         .toList();



     emit(state.copyWith(listProduct: products,statusButton: StatusButton.success));


  } on ConnectionException catch (e) {
      emit(state.copyWith(statusButton: StatusButton.noInternet,listProduct: []));

  } on ApiException catch (e) {
      emit(state.copyWith(statusButton: StatusButton.failed,message: e.message,listProduct: []));

  } catch (e) {
      emit(state.copyWith(statusButton: StatusButton.failed,message: e.toString(),listProduct: []));

    }


  }
}
