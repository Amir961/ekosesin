part of 'salon_bloc.dart';



class SalonState  extends Equatable {

  final TypeSalon typeSalon;
  final TypeFilterSalon typeFilterSalon;
  final List<CityModels> listCity;
  final CityModels? selectedSource;
  final CityModels? selectedDestination;
  final StatusButton statusButton;
  final StatusButton statusDetails;
  final DetailsSalonModels? detailsSalonModels;
  final  List<SalonModel> listSalonModel;

  SalonState({required this.detailsSalonModels,required this.statusDetails, required this.listSalonModel,required this.statusButton,required this.listCity,required this.selectedDestination,required this.selectedSource,required this.typeSalon,required this.typeFilterSalon});

  @override
  // TODO: implement props
  List<Object?> get props => [detailsSalonModels,statusDetails,listSalonModel,statusButton,selectedSource,selectedDestination,listCity,typeSalon,typeFilterSalon];

  SalonState copyWith({

     TypeSalon? typeSalon,
     TypeFilterSalon? typeFilterSalon,
     List<CityModels>? listCity,
     List<SalonModel>? listSalonModel,
     CityModels? selectedSource,
     CityModels? selectedDestination,
    StatusButton? statusButton,
    StatusButton? statusDetails,
    DetailsSalonModels? detailsSalonModels
  })=> SalonState(
    statusDetails: statusDetails ?? this.statusDetails,
    selectedDestination: selectedDestination ?? this.selectedDestination,
    selectedSource: selectedSource ?? this.selectedSource,
    listCity: listCity ?? this.listCity,
    typeSalon: typeSalon ?? this.typeSalon,
    typeFilterSalon: typeFilterSalon ?? this.typeFilterSalon,
    statusButton: statusButton ?? this.statusButton,
    listSalonModel: listSalonModel ?? this.listSalonModel,
    detailsSalonModels: detailsSalonModels ?? this.detailsSalonModels,


  );

  SalonState resetSource()=> SalonState(
    selectedDestination: selectedDestination,
    selectedSource: null,
    listCity: listCity ,
    detailsSalonModels: detailsSalonModels ,
    statusDetails: statusDetails ,
    typeSalon: typeSalon ,
    typeFilterSalon: typeFilterSalon ,
    statusButton: statusButton ,
    listSalonModel: listSalonModel ,


  );

  SalonState resetDestination()=> SalonState(
    selectedDestination: null,
    selectedSource: selectedSource,
    detailsSalonModels: detailsSalonModels,
    statusDetails: statusDetails,
    listCity: listCity ,
    typeSalon: typeSalon ,
    typeFilterSalon: typeFilterSalon ,
    statusButton: statusButton ,
    listSalonModel: listSalonModel ,


  );
}


