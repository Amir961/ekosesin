part of 'category_bloc.dart';

 class CategoryState extends Equatable {

   final StatusButton statusButton;
   final List<CategoryModel> listCategory;

   final String  message;
   final List<CategoryModel>  queenList;

  const CategoryState({required this.queenList,required this.statusButton,required this.message,required this.listCategory,});

  @override
  // TODO: implement props
  List<Object?> get props => [queenList,statusButton,listCategory,message,];
   CategoryState copyWith({

     StatusButton? statusButton,
     String? message,
     List<CategoryModel>?  queenList,
     List<CategoryModel>? listCategory,


   }) => CategoryState(

     statusButton: statusButton?? this.statusButton,
     message: message?? this.message,
     queenList: queenList?? this.queenList,
     listCategory: listCategory?? this.listCategory,



   );

}


