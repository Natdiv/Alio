import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constant.dart';

class CompteScreen extends StatefulWidget {
  const CompteScreen({Key? key}) : super(key: key);

  @override
  State<CompteScreen> createState() => _CompteScreenState();
}

class _CompteScreenState extends State<CompteScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppConst.bgColor,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                    height: 220,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/placeholder_cover.png'),
                            fit: BoxFit.cover))),
                Positioned(
                    right: 0,
                    child: SafeArea(
                      child: Container(
                        height: 40,
                        width: 40,
                        margin: const EdgeInsets.only(right: 16, top: 8),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Center(
                            child: SvgPicture.asset(
                          'assets/icons/carbon_overflow-menu-vertical.svg',
                          width: 30,
                          height: 30,
                        )),
                      ),
                    )),
                Positioned(
                  bottom: -54,
                  right: 16,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 32),
                      decoration: BoxDecoration(
                        color: AppConst.primaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Center(
                          child: Text('Editer mon profil',
                              style: Theme.of(context).textTheme.bodyText1)),
                    ),
                  ),
                ),
                Positioned(
                    bottom: -59,
                    left: 16,
                    child: Container(
                      height: 118,
                      width: 118,
                      // color: AppConst.primaryColor,
                      child: const Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 60,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/images/placeholder_profil.png',
                                ),
                            radius: 55,
                          ),
                        ),
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 59,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Véronique Mwadi',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: Colors.black),
                  ),
                  //const SizedBox(height: 8),
                  const Text(
                    'Je suis commissionnaire',
                    style: TextStyle(
                        color: Color.fromRGBO(95, 95, 95, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  // const SizedBox(height: 8,),
                  const Text(
                    '097 66 62 863',
                    style: TextStyle(
                        color: Color.fromRGBO(36, 124, 255, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline),
                  ),
                  // const SizedBox(height: 8,),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/localisation.svg'),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        'Lubumbashi',
                        style: TextStyle(
                          color: Color.fromRGBO(95, 95, 95, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    '3 Annonces déjà publiées',
                    style: TextStyle(
                      color: Color.fromRGBO(95, 95, 95, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    color: Color.fromRGBO(208, 208, 208, 1),
                    height: 2,
                  )
                ],
              ),
            ),
            GridView.builder(
                padding: EdgeInsets.only(
                    left: AppConst.defaultPadding,
                    right: AppConst.defaultPadding,
                    top: AppConst.defaultPadding,
                    bottom: 92),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 7,
                shrinkWrap: true,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/annonce$index.jpg'),
                            fit: BoxFit.cover)),
                  );
                }),
          ],
        ));
  }
}
