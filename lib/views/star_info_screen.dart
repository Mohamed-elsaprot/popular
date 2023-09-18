import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular/data/cubits/person_cubit/person_info_cubit.dart';
import 'package:popular/data/cubits/person_cubit/person_info_states.dart';
import 'package:popular/data/requests/api_service.dart';
import 'package:popular/views/download_image_screen.dart';

class StarInfoScreen extends StatelessWidget {
  const StarInfoScreen({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<PersonInfoCubit,PersonInfoState>(
      listener: (context,state){
        if(state is PersonInfoFailure){
          showDialog(context: context, builder: (context)=>AlertDialog(
            title: const Text('Something Wrong Went'),
            actions: [TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Close'))],
          ));
        }
      },
      builder: (context,state){
        if(state is PersonInfoSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: Text("${state.popularPersonInfoModel.name}"),),
            body: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: size.height * .45,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50)),
                    color: Colors.teal,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Location of Birth${state.popularPersonInfoModel.placeOfBirth}\n'
                        'Popularity ${state.popularPersonInfoModel.popularity}\n'
                        'BirthDay: ${state.popularPersonInfoModel.birthday}',
                      style: const TextStyle(fontSize: 22,color: Colors.white),textAlign: TextAlign.center,),
                  ),
                SizedBox(
                  height: size.height * .025,
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DownLoadImageScreen(imagePath: '${ApiService.imagesBaseUrl}${state.popularPersonInfoModel.profilePath}',)));
                  },
                  child: Image.network(
                    '${ApiService.imagesBaseUrl}${state.popularPersonInfoModel.profilePath}',
                    fit: BoxFit.cover,
                    height: size.height * .432,
                    width: size.width*.7,
                  ),
                ),
              ],
            ),
          );
        }
        else if(state is PersonInfoFailure){
          return Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: (){},
                child: const Text('Reload',style: TextStyle(fontSize: 22,color: Colors.white),),
              ),),
          );
        }
        else {
          return const Scaffold(body:Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}


