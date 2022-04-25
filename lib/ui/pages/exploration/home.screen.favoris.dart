import 'package:alio/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavorisScreen extends StatefulWidget {
  const FavorisScreen({Key? key}) : super(key: key);

  @override
  State<FavorisScreen> createState() => _FavorisScreenState();
}

class _FavorisScreenState extends State<FavorisScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConst.bgColor,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: AlignmentDirectional.bottomStart,
                padding: EdgeInsets.only(top: AppConst.defaultPadding, left: AppConst.defaultPadding, right: AppConst.defaultPadding, bottom: 0),
                height: 90,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Favoris', style: Theme.of(context).textTheme.headline2?.copyWith(color: Colors.black),),
                        SvgPicture.asset('assets/icons/carbon_overflow-menu-vertical.svg', width: 30, height: 30,)
                      ],
                    ),
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: AppConst.defaultPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Tous', style: Theme.of(context).textTheme.headline6?.copyWith(color: AppConst.primaryColor),),
                              Container(
                                width: 20,
                                height: 2,
                                color: AppConst.primaryColor,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: AppConst.defaultPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Likes', style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.black),),
                              Container(
                                width: 20,
                                height: 2,
                                color: Colors.transparent,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: AppConst.defaultPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Réservés', style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.black),),
                              Container(
                                width: 20,
                                height: 2,
                                color: Colors.transparent,
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.only(left: AppConst.defaultPadding, right: AppConst.defaultPadding, top: AppConst.defaultPadding, bottom: 92),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 187,
                        height: 187,
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          image: DecorationImage(image: AssetImage('assets/images/annonce$index.jpg'),
                          fit: BoxFit.cover)
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
        )
    );
  }
}
