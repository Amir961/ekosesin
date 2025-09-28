import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fare/features/home/model/category_model.dart';
import 'package:flutter/material.dart';

import '../../../core/network/api_service.dart';
import '../../../core/utils/enum.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  final ApiService apiService;
  CategoryBloc(this.apiService) : super(CategoryState(statusButton: StatusButton.none,listCategory: [], message: '',queenList: [])) {

    on<GetDataEvent>(_onGetDataEvent);
    on<SetAllEvent>(_onSetAllEvent);
    on<PushEvent>(_onPushEvent);
    on<PopEvent>(_onPopEvent);
    on<PopUntilEvent>(_onPopUntilEvent);
  }

  _onSetAllEvent(
      SetAllEvent event,
      Emitter<CategoryState> emit,
      ) async {
    emit(state.copyWith(statusButton: StatusButton.loading));
    emit(state.copyWith(queenList: []));
    emit(state.copyWith(statusButton: StatusButton.success));
  }

  _onPushEvent(
      PushEvent event,
      Emitter<CategoryState> emit,
      ) async {
    emit(state.copyWith(statusButton: StatusButton.loading));
    debugPrint('size_queen_push0: ${state.queenList.length} ');
    final list= state.queenList.add(event.categoryModel);
    emit(state.copyWith(queenList:state.queenList));
    debugPrint('size_queen_push1: ${state.queenList.length} ');
    emit(state.copyWith(statusButton: StatusButton.success));

  }

  _onPopUntilEvent(
      PopUntilEvent event,
      Emitter<CategoryState> emit,
      ) async {
    emit(state.copyWith(statusButton: StatusButton.loading));
    debugPrint('size_queen_popUntil0: ${state.queenList.length} ${event.index}');
    while(state.queenList.length>event.index)
      {
        final list= state.queenList.removeLast();
        debugPrint('size_queen_popUntil3: ${state.queenList.length} ${event.index}');

      }

    emit(state.copyWith(queenList: state.queenList));
    debugPrint('size_queen_popUntil1: ${state.queenList.length} ');
    emit(state.copyWith(statusButton: StatusButton.success));
  }


  _onPopEvent(
      PopEvent event,
      Emitter<CategoryState> emit,
      ) async {
    emit(state.copyWith(statusButton: StatusButton.loading));
    debugPrint('size_queen_pop0: ${state.queenList.length} ');
    final list= state.queenList.removeLast();
    emit(state.copyWith(queenList: state.queenList));
    debugPrint('size_queen_pop1: ${state.queenList.length} ');
    emit(state.copyWith(statusButton: StatusButton.success));
  }


  _onGetDataEvent(
      GetDataEvent event,
      Emitter<CategoryState> emit,
      ) async {

    emit(state.copyWith(statusButton: StatusButton.loading));

    try {
      final responseJson= await apiService.get('poster-categories/',queryParameters: event.map );

      //  final List<City> list=  result['data'].map((json) => City.fromJson(json)).toList();

      final List<CategoryModel> categories = (responseJson['data'] as List)
          .map((json) => CategoryModel.fromJson(json))
          .toList();


      emit(state.copyWith(listCategory: categories,statusButton: StatusButton.success));



    } on ConnectionException catch (e) {
      emit(state.copyWith(statusButton: StatusButton.noInternet));

    } on ApiException catch (e) {
      emit(state.copyWith(statusButton: StatusButton.failed,message: e.message));

    } catch (e) {
      emit(state.copyWith(statusButton: StatusButton.failed,message: e.toString()));

    }


  }
}
