part of 'popular_cubit.dart';

abstract class PopularListState{
  const PopularListState();
}

class PopularInitial extends PopularListState{
  const PopularInitial();
}
class PopularListLoading extends PopularListState{
  const PopularListLoading();
}
class PopularListFailure extends PopularListState{
  const PopularListFailure({required this.errorMessage});
  final String errorMessage;
}
class PopularListSuccess extends PopularListState{
  const PopularListSuccess({required this.popularModel});
  final PopularModel popularModel;
}
