import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fare/core/network/api_service.dart';

part 'details_poster_event.dart';
part 'details_poster_state.dart';

class DetailsPosterBloc extends Bloc<DetailsPosterEvent, DetailsPosterState> {
  ApiService apiService;
  DetailsPosterBloc(this.apiService) : super(DetailsPosterState()) {

  }
}
