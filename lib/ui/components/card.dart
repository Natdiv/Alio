import 'dart:math';

import 'package:alio/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardItem extends StatefulWidget {
  const CardItem({Key? key}) : super(key: key);

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  final index = Random().nextInt(7);
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(AppConst.defaultPadding),
      height: 339,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.symmetric(
          horizontal: AppConst.defaultPadding, vertical: 8),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color.fromRGBO(0, 0, 0, 0.75)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                        image: AssetImage('assets/images/annonce$index.jpg'))),
              ),
              const SizedBox(height: 8,),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
                child: Text(
                  'Maison d’habitation, 4 chambres,  2 salons, 2 salles de bains',
                  style: Theme.of(context).textTheme.headline6,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
                child: Text(
                  'Haut-Katanga, Lubumbashi,  Golf',
                  style: Theme.of(context).textTheme.bodyText2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/filled_star.svg',
                          width: 21,
                          height: 21,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text('27 personnes apprécient',
                            style: Theme.of(context).textTheme.bodyText2),
                      ],
                    ),
                    Text('450\$ / mois',
                        style: Theme.of(context).textTheme.headline5),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(AppConst.defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 26,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all(
                      color: const Color.fromRGBO(80, 80, 80, 1),
                      width: 0.5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Maison à louer',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                ),
                SvgPicture.asset('assets/icons/fill_red_favori.svg')
              ],
            ),
          )
        ],
      ),
    );
  }
}
