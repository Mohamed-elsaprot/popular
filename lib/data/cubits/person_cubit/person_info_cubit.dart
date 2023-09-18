import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular/data/cubits/person_cubit/person_info_states.dart';
import '../../../domain/models/PopularPersonInfo.dart';
import '../../requests/api_service.dart';

class PersonInfoCubit extends Cubit<PersonInfoState> {
  PersonInfoCubit() : super(const PersonInfoInitial());
  getPopularPersonsInfo({required num id})async{
    emit(const PersonInfoLoading());
    await ApiService.getPopularPersonInfo(id: id).then((value){
      PopularPersonInfoModel popularPersonInfoModel = PopularPersonInfoModel.fromJson(value);
      emit(PersonInfoSuccess(popularPersonInfoModel: popularPersonInfoModel));
    }).catchError((e){
      print(e.toString());
      emit(PersonInfoFailure(errorMessage: e.toString()));
    });
  }

}