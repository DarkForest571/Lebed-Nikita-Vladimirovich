import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

Color mainColor = const Color.fromARGB(255, 94, 202, 202);
Color accentColor = const Color.fromARGB(255, 192, 245, 245);
Color bgColor = const Color.fromARGB(255, 237, 255, 255);

@RoutePage()
class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    //context.setLocale(context.locale);
    return CenterPhoto();
  }
}

class CenterPhoto extends StatelessWidget {
  const CenterPhoto({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: bgColor,
      width: 600,
      child: Column(children: [
        Expanded(child: ListView.separated(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            index++;
            return createPost("#Post_title", "#Post_content", "images/$index.jpg");
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10);
          },
        ))
      ])
    );
  }

  Widget createPost(String title, String content, String imagePath) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: accentColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Text(title, textAlign: TextAlign.left, style: const TextStyle(fontWeight: FontWeight.bold),),
        const SizedBox(height: 10,),
        Text(content, textAlign: TextAlign.left,),
        SizedBox(height: 10),
        Image.asset(imagePath, height: 300)
      ],)
      );
  }
}
