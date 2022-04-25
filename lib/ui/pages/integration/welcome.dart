import 'package:alio/constant.dart';
import 'package:alio/ui/pages/integration/signin.dart';
import 'package:alio/ui/pages/integration/signup.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
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
          Positioned(
            top: MediaQuery.of(context).size.height * 0.10,
            child: SvgPicture.asset(
              'assets/logo/logo_text.svg',
              width: 157,
              height: 159.04,
            ),
          ),
          Container(
              margin: EdgeInsets.all(AppConst.defaultPadding),
              height: MediaQuery.of(context).size.height * 0.45,
              child: BlurryContainer(
                height: MediaQuery.of(context).size.height * 0.45,
                width: double.infinity,
                blur: 4,
                borderRadius: BorderRadius.circular(30),
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  color: const Color.fromRGBO(0, 0, 0, 0.30),
                  child: Column(
                    children: [
                      SizedBox(
                        height:
                            (MediaQuery.of(context).size.height * 0.45) * 0.40,
                        child: Center(
                          child: Text(
                            'Bienvenu sur Alio',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => const SignUp()));
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero)
                        ),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 27, 109, 1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                  style: BorderStyle.solid)),
                          child: Center(
                              child: Text(
                            'Créer un compte',
                            style: Theme.of(context).textTheme.headline6,
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => const SignIn()));
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
                            'Se connecter',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(color: AppConst.primaryColor),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
