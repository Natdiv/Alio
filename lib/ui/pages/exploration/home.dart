import 'package:alio/constant.dart';
import 'package:alio/ui/pages/exploration/home.screen.compte.dart';
import 'package:alio/ui/pages/exploration/home.screen.favoris.dart';
import 'package:alio/ui/pages/exploration/home.screen.home.dart';
import 'package:alio/ui/pages/exploration/home.screen.messages.dart';
import 'package:alio/ui/pages/post/new_post.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size size;
  final List<Widget> _homeScreens = const <Widget>[
    HomeScreen(),
    FavorisScreen(),
    MessagesScreen(),
    CompteScreen()
  ];
  int _currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background_image.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            decoration:
                const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.25)),
          ),
          _homeScreens[_currentScreenIndex],
          _buildBottomBarNavigation()
        ],
      ),
    );
  }

  Widget _buildBottomIconButton(String icon, String name, int index) {
    return InkWell(
      onTap: () {
        if (index == -1) {
         Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => NewPost()));
        } else if (index > -1) {
          setState(() {
            _currentScreenIndex = index;
          });
        }
      },
      splashColor: AppConst.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 30,
            height: 30,
            color: (_currentScreenIndex == index)
                ? AppConst.primaryColor
                : Colors.white,
          ),
          SizedBox(
            height: 4,
          ),
          /* Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 10,
              color: (_currentScreenIndex == index) ? AppConst.primaryColor : Colors.white,
            ),
          )*/
        ],
      ),
    );
  }

  Widget _buildBottomBarNavigation() {
    return Positioned(
        height: 92,
        width: size.width,
        bottom: 0,
        child: BlurryContainer(
          height: 92,
          width: size.width,
          blur: 10,
          padding: const EdgeInsets.all(18),
          bgColor: const Color.fromRGBO(15, 0, 5, 0.8),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBottomIconButton(
                    'assets/icons/akar-icons_home.svg', 'Accueil', 0),
                _buildBottomIconButton(
                    'assets/icons/clarity_heart-line.svg', 'Favoris', 1),
                _buildBottomIconButton(
                    'assets/icons/Add circle outline.svg', 'Nouveau', -1),
                _buildBottomIconButton(
                    'assets/icons/clarity_notification-line.svg',
                    'Messages',
                    2),
                _buildBottomIconButton(
                    'assets/icons/healthicons_ui-user-profile-outline.svg',
                    'Compte',
                    3),
              ],
            ),
          ),
        ));
  }

  Widget _buildScreen(int index) {
    return Container();
  }
}
