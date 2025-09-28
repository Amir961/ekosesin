part of 'home_bloc.dart';

 class HomeState extends Equatable  {

   final StatusButton statusButton;
   final String message;
   final List<Product> listProduct;

  const HomeState({required this.listProduct,required this.message,required this.statusButton});

  @override
  // TODO: implement props
  List<Object?> get props => [listProduct,statusButton,message];

   HomeState copyWith({

     StatusButton? statusButton,
     String? message,
     List<Product>? listProduct,

   }) => HomeState(

       statusButton: statusButton?? this.statusButton,
       message: message?? this.message,
     listProduct: listProduct?? this.listProduct,


   );
}

