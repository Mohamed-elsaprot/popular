import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular/data/requests/api_service.dart';
import 'package:popular/domain/models/popular_model/PopularModel.dart';
part 'popular_state.dart';

class PopularCubit extends Cubit<PopularListState> {
  PopularCubit() : super(const PopularInitial());

  getPopularList()async{
    emit(const PopularListLoading());
    await ApiService.getPopularList().then((value){
      PopularModel popModel = PopularModel.fromJson(value);
      emit(PopularListSuccess(popularModel: popModel));
    }).catchError((e){
      print(e.toString());
      emit(PopularListFailure(errorMessage: e.toString()));
    });
  }
}




