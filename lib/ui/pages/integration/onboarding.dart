
import 'package:alio/ui/pages/integration/welcome.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constant.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();

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
            child: PageView(
              controller: controller,
              onPageChanged: (index) {},
              physics: const NeverScrollableScrollPhysics(),
              children: [
                buildOnBoardMessage(
                    "Trouvez des biens à louer ou à vendre sans déplacement ni frais de commission",
                    false),
                buildOnBoardMessage(
                    "Maisons, bureaux, appartements, immeubles, terrains. Exposez ici pour atteindre plus",
                    false),
                buildOnBoardMessage(
                    "Tout ce que vous aviez déjà mais en mieux, plus simple et plus rapide",
                    true)
              ],
            ),
          ),
          Positioned(
            bottom: 48,
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: WormEffect(
                dotColor: AppConst.bgColor,
                activeDotColor: AppConst.primaryColor,
                dotHeight: 12,
                dotWidth: 12,
                type: WormType.thin,
                // strokeWidth: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOnBoardMessage(String message, bool isTheLast) {
    return BlurryContainer(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      blur: 4,
      borderRadius: BorderRadius.circular(30),
      padding: const EdgeInsets.all(0.0),
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromRGBO(0, 0, 0, 0.30),
        child: Column(
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height * 0.45) * 0.50,
              child: Text(
                message,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero)
                  ),
                  onPressed: () {
                    if (!isTheLast) {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 10),
                          curve: Curves.ease);
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => const Welcome()));
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 194,
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
                      isTheLast ? 'Explorer' : 'Suivant',
                      style: Theme.of(context).textTheme.headline6,
                    )),
                  ),
                ),
                const SizedBox(),
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/figures/group_arrow.svg',
                    width: 62.99,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
