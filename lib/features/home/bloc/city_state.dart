part of 'city_bloc.dart';

 class CityState extends Equatable {
   final StatusButton statusButton;
   final List<City> listCity;
   final City?  selectedCity;
   final String  message;


  const CityState({required this.message
    ,required this.selectedCity,required this.statusButton,required  this.listCity});

  @override
  // TODO: implement props
  List<Object?> get props =>[message,selectedCity,statusButton,listCity];



   CityState copyWith({

     StatusButton? statusButton,
     String? message,

      List<City>? listCity,
      City?  selectedCity,

   }) => CityState(

     statusButton: statusButton?? this.statusButton,
     message: message?? this.message,
     listCity: listCity?? this.listCity,
     selectedCity: selectedCity?? this.selectedCity,


   );
}
