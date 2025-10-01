part of 'details_poster_bloc.dart';

 class DetailsPosterEvent extends Equatable {
  const DetailsPosterEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class GetDataEvent extends DetailsPosterEvent{
  final String value;

  const GetDataEvent({required this.value});
}
