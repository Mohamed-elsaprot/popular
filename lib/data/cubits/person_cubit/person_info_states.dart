import '../../../domain/models/PopularPersonInfo.dart';

abstract class PersonInfoState{
  const PersonInfoState();
}

class PersonInfoInitial extends PersonInfoState{
  const PersonInfoInitial();
}
class PersonInfoLoading extends PersonInfoState{
  const PersonInfoLoading();
}
class PersonInfoSuccess extends PersonInfoState{
  const PersonInfoSuccess({required this.popularPersonInfoModel});
  final PopularPersonInfoModel popularPersonInfoModel;
}
class PersonInfoFailure extends PersonInfoState{
  const PersonInfoFailure({required this.errorMessage});
  final String errorMessage;
}