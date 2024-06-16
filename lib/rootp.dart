import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:auto_route/auto_route.dart';

import './app_router.dart';
import './generated/locale_keys.g.dart';
import './homep.dart';
import './photop.dart';


@RoutePage()
class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

@RoutePage()
class _RootPageState extends State<RootPage> {
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
            LeftSideBar(function: addPost,),
            AutoTabsRouter.tabBar(
              routes: const [
                MyHomeRoute(),
                PhotoRoute(),
              ],
              builder: (context, child, controller) {
                final tabsRouter = AutoTabsRouter.of(context);
                return Scaffold(
                  appBar: AppBar(
                    title: Text(context.topRoute.name),
                    leading: AutoLeadingButton(),
                    bottom: TabBar(
                      controller: controller,
                      tabs: const [
                        Tab(text: '1', icon: Icon(Icons.abc)),
                        Tab(text: '2', icon: Icon(Icons.abc)),
                        Tab(text: '3', icon: Icon(Icons.abc)),
                      ],
                    ),
                  ),
                  body: child,
                  bottomNavigationBar: BottomNavigationBar(
                    currentIndex: tabsRouter.activeIndex,
                    onTap: tabsRouter.setActiveIndex,
                    items: [
                      BottomNavigationBarItem(icon: Icon(Icons.abc),label: 'Books',),
                      BottomNavigationBarItem(icon: Icon(Icons.abc),label: 'Profile',),
                      BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'Settings',),
                    ],
                  ),
                );
              },
            ),
            const RightPanel(),
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


class LeftSideBar extends StatefulWidget {
  const LeftSideBar({super.key, required this.function});
  
  final VoidCallback function;

  @override
  State<StatefulWidget> createState() => _LeftSideBar(function: function);
}

class _LeftSideBar extends State<LeftSideBar>{
  final VoidCallback function;

  _LeftSideBar({required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: 200,
      color: const Color.fromARGB(255, 192, 245, 245),
      child: Column(
        children:[
          IconButton(onPressed: toMainPage, icon: Row( children: [
            const Icon(Icons.face, size: 50, color: Colors.cyan),
            Text(LocaleKeys.myPage.tr(),),
          ],)
          ),
          IconButton(onPressed: foo, icon: Row( children: [
            const Icon(Icons.favorite, size: 50, color: Colors.cyan),
            Text(LocaleKeys.favorite.tr(),),
          ],)
          ),
          IconButton(onPressed: toPhotoPage, icon: Row( children: [
            const Icon(Icons.photo, size: 50, color: Colors.cyan),
            Text(LocaleKeys.photo.tr(),),
          ],)
          ),
          IconButton(onPressed: function, icon: Row( children: [
            const Icon(Icons.add_box, size: 50, color: Colors.cyan),
            Text(LocaleKeys.addPost.tr(),),
          ],)
          )
        ]
      )
    );
  }

  void toMainPage(){
    AutoTabsRouter.of(context).setActiveIndex(0);
  }

  void toPhotoPage(){
    AutoTabsRouter.of(context).setActiveIndex(1);
  }

  void foo(){}
  
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