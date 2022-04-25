import 'package:alio/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppConst.bgColor,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                //alignment: AlignmentDirectional.center,
                padding: EdgeInsets.all(AppConst.defaultPadding),
                height: 80,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notifications',
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          ?.copyWith(color: Colors.black),
                    ),
                    SvgPicture.asset(
                      'assets/icons/carbon_overflow-menu-vertical.svg',
                      width: 30,
                      height: 30,
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(
                        bottom: 92,
                        top: AppConst.defaultPadding,
                        left: AppConst.defaultPadding,
                        right: AppConst.defaultPadding),
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 74,
                        margin: EdgeInsets.only(bottom: AppConst.defaultPadding),
                        padding: EdgeInsets.symmetric(vertical: AppConst.defaultPadding / 2, horizontal: AppConst.defaultPadding/2),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromRGBO(223, 223, 223, 1),
                              radius: 32,
                              child: CircleAvatar(
                                child: Image.asset(
                                  'assets/logo/logo.png',
                                  fit: BoxFit.fill,
                                ),
                                radius: 25,
                              ),
                            ),
                            const SizedBox(width: 8,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Un utilisateur a effectuté une réservation sur votre annonce',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Text(
                                    'Il y a 9 minutes',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                            color: Color.fromRGBO(125, 125, 125, 1),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 8,),
                            Container(
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(100)),
                                  color: AppConst.primaryColor),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
