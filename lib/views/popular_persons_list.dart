import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular/data/cubits/person_cubit/person_info_cubit.dart';
import 'package:popular/views/star_info_screen.dart';
import '../data/cubits/popular_cubit/popular_cubit.dart';

class PopularPersonsList extends StatelessWidget {
  const PopularPersonsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularCubit, PopularListState>(
      listener: (context, state) {
        if (state is PopularListFailure) {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text('Something Wrong Went'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Close'))
                    ],
                  ));
        }
      },
      builder: (context, state) {
        if (state is PopularListSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('popular list'),
            ),
            body: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemCount: 20,
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => PersonInfoCubit()..getPopularPersonsInfo(id: state.popularModel.results![index].id!),
                          child:const StarInfoScreen(),
                        ),
                      ));
                    },
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.teal,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: Text(
                          '${state.popularModel.results![index].name}',
                          style: const TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  );
                }),
          );
        } else if (state is PopularListFailure) {
          return Scaffold(
            body: Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Reload',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}


