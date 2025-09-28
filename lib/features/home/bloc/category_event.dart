part of 'category_bloc.dart';

 class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetDataEvent extends CategoryEvent {
 final Map<String,dynamic> map;
 const GetDataEvent(this.map);
}

class SetAllEvent extends CategoryEvent {

}

class PopEvent extends CategoryEvent {

}

class PopUntilEvent extends CategoryEvent {
   final int index;
   const PopUntilEvent(this.index);

}
class PushEvent extends CategoryEvent {
     final CategoryModel categoryModel;
     const PushEvent(this.categoryModel);

}

