import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Color mainColor = Color.fromARGB(255, 94, 202, 202);
Color accentColor = const Color.fromARGB(255, 192, 245, 245);
Color bgColor = const Color.fromARGB(255, 237, 255, 255);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30),
        ),
      ),
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LeftSideBar(funtion: addPost),
            CenterMain(counter: counter),
            const RightPanel(),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addPost,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
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
          IconButton(onPressed: foo, icon: const Row( children: [
            Icon(Icons.face, size: 50, color: Colors.cyan),
            Text("My page",),
          ],)
          ),
          IconButton(onPressed: foo, icon: const Row( children: [
            Icon(Icons.favorite, size: 50, color: Colors.cyan),
            Text("Favorite",),
          ],)
          ),
          IconButton(onPressed: foo, icon: const Row( children: [
            Icon(Icons.photo, size: 50, color: Colors.cyan),
            Text("Photo",),
          ],)
          ),
          IconButton(onPressed: funtion, icon: const Row( children: [
            Icon(Icons.add_box, size: 50, color: Colors.cyan),
            Text("Add post",),
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
            Image.asset("images/avatar.jpg", width: 200, height: 200,),
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Lebed Nikita Vladimirovich",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
                  ),
                  Text("I work in Game Forest"),
              ],)
            )
          ]
        ),
        SizedBox(height: 20),
        Expanded(child: ListView.separated(
          itemCount: counter,
          itemBuilder: (BuildContext context, int index) {
            index++;
            return createPost("Post numder $index", "Some text\nAnother text", "images/$index.jpg");
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
  const RightPanel({super.key});

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
          const Text("Ads here"),
          Container(height: 100, color: const Color.fromARGB(255, 240, 240, 240)),
          const Text("And here"),
          Container(height: 100, color: const Color.fromARGB(255, 240, 240, 240)),
          const Text("And here"),
          Container(height: 100, color: const Color.fromARGB(255, 240, 240, 240)),
        ],
      ),
    );
  }
}