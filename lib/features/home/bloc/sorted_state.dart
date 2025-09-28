part of 'sorted_bloc.dart';

 class SortedState extends Equatable {
   final List<SortedClass> list;
   final SortedClass selectedSortedClass;
  const SortedState({required this.list,required this.selectedSortedClass});

  @override
  // TODO: implement props
  List<Object?> get props => [list,selectedSortedClass];


   SortedState copyWith({



     List<SortedClass>? list,
     SortedClass?  selectedSortedClass,

   }) => SortedState(


     list: list?? this.list,
     selectedSortedClass: selectedSortedClass?? this.selectedSortedClass,


   );

}


