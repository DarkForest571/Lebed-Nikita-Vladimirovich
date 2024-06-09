import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import './generated/locale_keys.g.dart';

Color mainColor = Color.fromARGB(255, 94, 202, 202);
Color accentColor = const Color.fromARGB(255, 192, 245, 245);
Color bgColor = const Color.fromARGB(255, 237, 255, 255);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  void addPost() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //context.setLocale(context.locale);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(LocaleKeys.appName.tr(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30),
        ),
        actions: [
          IconButton(onPressed: changeLocale, icon: const Icon(Icons.language, size: 30, color: Colors.white,)),
          const SizedBox(width: 50,)
          ],
      ),
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LeftSideBar(funtion: addPost),
            CenterMain(counter: counter),
            RightPanel(),
          ],
        )
      )
    );
  }

  void changeLocale() {
    if (context.locale == const Locale('ru')) {
      context.setLocale(const Locale('en'));
    } else {
      context.setLocale(const Locale('ru'));
    }
  }
}

class LeftSideBar extends StatelessWidget {
  const LeftSideBar({super.key, required this.funtion});
  
  final VoidCallback funtion;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: 200,
      color: accentColor,
      child: Column(
        children:[
          IconButton(onPressed: foo, icon: Row( children: [
            const Icon(Icons.face, size: 50, color: Colors.cyan),
            Text(LocaleKeys.myPage.tr(),),
          ],)
          ),
          IconButton(onPressed: foo, icon: Row( children: [
            const Icon(Icons.favorite, size: 50, color: Colors.cyan),
            Text(LocaleKeys.favorite.tr(),),
          ],)
          ),
          IconButton(onPressed: foo, icon: Row( children: [
            const Icon(Icons.photo, size: 50, color: Colors.cyan),
            Text(LocaleKeys.photo.tr(),),
          ],)
          ),
          IconButton(onPressed: funtion, icon: Row( children: [
            const Icon(Icons.add_box, size: 50, color: Colors.cyan),
            Text(LocaleKeys.addPost.tr(),),
          ],)
          )
        ]
      )
    );
  }

  void foo(){}
} 

class CenterMain extends StatelessWidget {
  const CenterMain({super.key, required this.counter});
  final int counter;

  @override
  Widget build(BuildContext context) {
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
        Expanded(child: ListView.separated(
          itemCount: counter,
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

class RightPanel extends StatelessWidget {
  RightPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(15),
      color: const Color.fromARGB(255, 245, 245, 245),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(LocaleKeys.adsHere.tr()),
          Container(height: 100, color: const Color.fromARGB(255, 240, 240, 240)),
          Text(LocaleKeys.adsHere.tr()),
          Container(height: 100, color: const Color.fromARGB(255, 240, 240, 240)),
          Text(LocaleKeys.adsHere.tr()),
          Container(height: 100, color: const Color.fromARGB(255, 240, 240, 240)),
        ],
      ),
    );
  }
}