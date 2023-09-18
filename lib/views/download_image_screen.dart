import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class DownLoadImageScreen extends StatelessWidget {
  const DownLoadImageScreen({Key? key, required this.imagePath}) : super(key: key);
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()async{
            await GallerySaver.saveImage(imagePath,toDcim: true);
          }, icon:const Icon(Icons.download))
        ],
      ),
      body: Center(child: Image.network(imagePath,),),
    );
  }
}
