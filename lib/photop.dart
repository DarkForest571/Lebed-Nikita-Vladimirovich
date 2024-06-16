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
    return Container(
      padding: const EdgeInsets.all(15),
      color: bgColor,
      width: 600,
      child: Column(children: [
        Expanded(child: ListView.separated(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            index++;
            return createPhoto("images/1$index.jpg");
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10);
          },
        ))
      ])
    );
  }

  Widget createPhoto(String imagePath) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: accentColor,
      child: Image.asset(imagePath, height: 300),
    );
  }
}
