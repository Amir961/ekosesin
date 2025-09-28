part of 'sorted_bloc.dart';

 class SortedEvent extends Equatable {
  const SortedEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SetSortedEvent extends SortedEvent {
  final SortedClass sortedClass;

  const SetSortedEvent({ required this.sortedClass});


}
