import 'package:alio/constant.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

import '../exploration/home.dart';

class SmsConfirmation extends StatefulWidget {
  const SmsConfirmation({Key? key}) : super(key: key);

  @override
  State<SmsConfirmation> createState() => _SmsConfirmationState();
}

class _SmsConfirmationState extends State<SmsConfirmation> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              margin: const EdgeInsets.only(top: 100, bottom: 16),
              child: Stack(
                alignment: AlignmentDirectional.center,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      height: 470,
                      child: BlurryContainer(
                        height: double.infinity,
                        width: MediaQuery.of(context).size.width - 32,
                        blur: 4,
                        borderRadius: BorderRadius.circular(30),
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            color: const Color.fromRGBO(0, 0, 0, 0.30),
                            child: Container(
                              padding: const EdgeInsets.only(top: 82),
                              child: Column(
                                children: [
                                  Text(
                                    'Confirmez votre numéro',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.headline3,
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  _buidForm(),
                                  const SizedBox(height: 32,),
                                  Center(
                                    child: Text(
                                      'Je n\'ai pas de recu de SMS',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                      ,
                                    ),
                                  ),
                                  const SizedBox(height: 4,),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        /*Navigator.of(context).push(MaterialPageRoute(
                                            builder: (BuildContext context) => const SignUp()));*/
                                      },
                                      child: Text(
                                        'Envoyer de nouveau',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1?.copyWith(decoration: TextDecoration.underline)
                                        ,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -50,
                    child: Image.asset(
                      'assets/logo/logo.png',
                      width: 100,
                      height: 100,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildNameFormField(String hintText, TextInputType textInputType) {
    return TextFormField(
      cursorColor: AppConst.primaryColor,
      style: Theme.of(context).textTheme.bodyText1,
      scrollPhysics: const BouncingScrollPhysics(),
      keyboardType: textInputType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyText1,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  Widget _buidForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _buildNameFormField('Saisir le code de validation', TextInputType.number),
          const SizedBox(height: 32,),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => HomePage()));
            },
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<
                    Color>(Colors.transparent),
                padding: MaterialStateProperty.all<
                    EdgeInsetsGeometry>(
                    EdgeInsets.zero)),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(
                      255, 27, 109, 1),
                  borderRadius:
                  const BorderRadius.all(
                      Radius.circular(8)),
                  border: Border.all(
                      color: Colors.white,
                      width: 2,
                      style: BorderStyle.solid)),
              child: Center(
                  child: Text(
                    'Confirmer',
                    style: Theme.of(context)
                        .textTheme
                        .headline6,
                  )),
            ),
          ),
          const SizedBox(height: 8,),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero)
            ),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                      color: Colors.white,
                      width: 2,
                      style: BorderStyle.solid)),
              child: Center(
                  child: Text(
                    'Annuler',
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: AppConst.primaryColor),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
