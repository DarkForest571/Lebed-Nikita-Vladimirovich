import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc.dart';

Color mainColor = const Color.fromARGB(255, 94, 202, 202);
Color accentColor = const Color.fromARGB(255, 192, 245, 245);
Color bgColor = const Color.fromARGB(255, 237, 255, 255);

@RoutePage()
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.counter});
  final int Function() counter;

  @override
  State<MyHomePage> createState() => _MyHomePageState(counter: counter);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState({required this.counter});
  int Function() counter;

  @override
  Widget build(BuildContext context) {
    //context.setLocale(context.locale);
    return Container(
      padding: const EdgeInsets.all(15),
      color: bgColor,
      width: 600,
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/avatar.jpg", width: 200, height: 200,),
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("#Name",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                  ),
                  Text("#Info"),
              ],)
            )
          ]
        ),
        const SizedBox(height: 20),
        BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Expanded(child: ListView.separated(
              itemCount: state,
              itemBuilder: (BuildContext context, int index) {
                index++;
                return createPost("#Post_title", "#Post_content", "images/$index.jpg");
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
            ));
          },
        ),
        
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
        const SizedBox(height: 10),
        Image.asset(imagePath, height: 300)
      ],)
      );
  }
}
