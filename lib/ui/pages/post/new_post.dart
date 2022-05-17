import 'package:alio/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConst.bgColor,
        appBar: AppBar(
      toolbarHeight: 80,
      leading: Container(
        padding: EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
        child: SvgPicture.asset(
          'assets/icons/arrow_back.svg',
          width: 30,
        ),
      ),
      // leadingWidth: 30,
      elevation: 0,
      titleSpacing: 0,
      title: const Text('Nouvelle Annonce'),
      titleTextStyle:
          Theme.of(context).textTheme.headline4?.copyWith(color: Colors.white),
      /*actions: [
        Container(
        padding: EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
        child: SvgPicture.asset(
          'assets/icons/ei_close.svg',
          width: 30,
          color: Colors.white,
        ),
      ),
      ],*/
    ),
    body: Padding(
      padding: EdgeInsets.all(AppConst.defaultPadding),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text("Type de contrat", style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.black),)
          ],
        ),
      ),
    ),
    );
  }
}
