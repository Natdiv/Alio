import 'dart:math';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant.dart';
import '../../components/card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Size size;
  late ScrollController scrollController;

  Color _sliverAppBarBgColor = Colors.transparent;
  bool _isSliverAppBarSearchBarVisible = false;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      // print("Srolll: ${scrollController.position.userScrollDirection.name}");
      // print("Offset: ${scrollController.offset}");
      if (scrollController.offset > 210) {
        if(scrollController.offset >= 300 && scrollController.position.userScrollDirection.name == 'reverse') {
          setState(() {
            _sliverAppBarBgColor = Colors.transparent;
            _isSliverAppBarSearchBarVisible = false;
          });
        } else if(scrollController.offset >= 300 && scrollController.position.userScrollDirection.name == 'forward') {
          setState(() {
            _sliverAppBarBgColor = Color.fromRGBO(255, 255, 255, 1);
            _isSliverAppBarSearchBarVisible = true;
          });
        }
        /*setState(() {
          _sliverAppBarBgColor = Color.fromRGBO(255, 255, 255, 1);
          _isSliverAppBarSearchBarVisible = true;
        });*/
      } else if (scrollController.offset <= 210) {
        setState(() {
          _sliverAppBarBgColor = Colors.transparent;
          _isSliverAppBarSearchBarVisible = false;
        });
      }
    });
  }

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
          CustomScrollView(
            controller: scrollController,
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                expandedHeight: 300,
                backgroundColor: _sliverAppBarBgColor,
                shadowColor: Colors.transparent,
                // AppConst.primaryColor,
                centerTitle: true,
                title: _isSliverAppBarSearchBarVisible
                    ? TextFormField(
                  cursorColor: AppConst.primaryColor,
                  style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.black),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: SvgPicture.asset('assets/icons/search.svg', color: Colors.black54,),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    fillColor: const Color.fromRGBO(255, 255, 255, 0.35),
                    filled: true,
                    focusColor: AppConst.primaryColor,
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(8)),
                        borderSide: BorderSide(
                            color: Colors.white,
                            width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(8)),
                        borderSide: BorderSide(
                            color: AppConst.primaryColor,
                            width: 2)),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(8))),
                    hintText: 'Que recherchez-vous ?',
                    hintStyle: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.black54),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                )
                    : Container(),
                //toolbarHeight: 76,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                      padding: EdgeInsets.only(
                          left: AppConst.defaultPadding,
                          right: AppConst.defaultPadding,
                          top: 90),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const SizedBox(height: 90),
                          Text(
                            'Plus vite\nPlus de choix',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.transparent),
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(EdgeInsets.zero)),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppConst.defaultPadding),
                              height: 48,
                              // width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(0, 0, 0, 0.35),
                                borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Que recherchez-vous ?',
                                    textAlign: TextAlign.left,
                                    style:
                                    Theme.of(context).textTheme.headline6,
                                  ),
                                  SvgPicture.asset(
                                    'assets/icons/search.svg',
                                    width: 30,
                                    height: 30,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.transparent),
                                    padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(EdgeInsets.zero)),
                                child: Container(
                                  height: 60,
                                  width: (size.width / 2) - 20,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 27, 109, 0.8),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                  ),
                                  child: Center(
                                      child: Text(
                                        'À LOUER',
                                        style:
                                        Theme.of(context).textTheme.headline6,
                                      )),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.transparent),
                                    padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(EdgeInsets.zero)),
                                child: Container(
                                  height: 60,
                                  width: (size.width / 2) - 20,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 27, 109, 0.8),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                  ),
                                  child: Center(
                                      child: Text(
                                        'À VENDRE',
                                        style:
                                        Theme.of(context).textTheme.headline6,
                                      )),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              ),
              SliverList(delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return CardItem();
                },
              ),)
            ],
          ),
          _buildBottomBarNavigation()
        ],
      ),
    );
  }


  Widget _buildBottomIconButton(String icon, String name, isActive) {
    return InkWell(
      onTap: () {},
      splashColor: AppConst.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            icon,
            width: 30,
            height: 30,
            color: (isActive) ? AppConst.primaryColor : Colors.white,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 10,
              color: (isActive) ? AppConst.primaryColor : Colors.white,
            ),
          )
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
                    'assets/icons/akar-icons_home.svg', 'Accueil', true),
                _buildBottomIconButton(
                    'assets/icons/clarity_heart-line.svg', 'Favoris', false),
                _buildBottomIconButton(
                    'assets/icons/Add circle outline.svg', 'Nouveau', false),
                _buildBottomIconButton(
                    'assets/icons/clarity_notification-line.svg',
                    'Notifications',
                    false),
                _buildBottomIconButton(
                    'assets/icons/healthicons_ui-user-profile-outline.svg',
                    'Compte',
                    false),
              ],
            ),
          ),
        ));
  }
}

