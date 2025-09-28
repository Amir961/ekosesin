import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../pages/home_screen.dart';

part 'sorted_event.dart';
part 'sorted_state.dart';

class SortedBloc extends Bloc<SortedEvent, SortedState> {
   SortedBloc() : super(SortedState(list: [
     SortedClass(index: 0, sortBy: 'created_at', sortDir: 'desc',),
     SortedClass(index: 1, sortBy: 'created_at', sortDir: 'asc',),
     SortedClass(index: 2, sortBy: 'title', sortDir: 'desc',),
     SortedClass(index: 3, sortBy: 'title', sortDir: 'desc',),
     SortedClass(index: 4, sortBy: 'converted_price', sortDir: 'desc',),
     SortedClass(index: 5, sortBy: 'converted_price', sortDir: 'desc',),
   ], selectedSortedClass: SortedClass(index: 0, sortBy: 'created_at', sortDir: 'desc',))) {
     on<SetSortedEvent>(_onSetSortedEvent);
   }

   _onSetSortedEvent(
       SetSortedEvent event,
       Emitter<SortedState> emit,
       ) async {

     emit(state.copyWith(selectedSortedClass: event.sortedClass));




   }

}
