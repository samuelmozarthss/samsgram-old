import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:samsgram/app/constants.dart';
import 'package:samsgram/app/modules/onboarding/onboarding_store.dart';

class OnboardingPage extends StatefulWidget {
  final String title;
  const OnboardingPage({Key? key, this.title = 'SamsGram'}) : super(key: key);

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends ModularState<OnboardingPage, OnboardingStore> {

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: [
            _OnboardingItem(
                image: AssetImage('assets/selfie.png'),
                text: 'Tire uma selfie'),
            _OnboardingItem(
                image: AssetImage('assets/mobile.png'),
                text: 'Tire uma selfie'),
            _OnboardingItem(
                image: AssetImage('assets/singin.png'),
                text: 'Tire uma selfie',
                child: Column(
                  children: [
                    ElevatedButton(
                    child: Text('CADASTRE-SE'),
                        onPressed: () {
                          store.markOnboardingDone();
                          Modular.to.pushReplacementNamed(Constants.Routes.REGISTER);
                        },
                    ),
                    TextButton(
                        child: Text('Já possui cadastro?'),
                        onPressed: () {
                          store.markOnboardingDone();
                              Modular.to.pushReplacementNamed(Constants.Routes.LOGIN);
                        }
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class _OnboardingItem extends StatelessWidget {

  final ImageProvider image;
  final String text;
  final Widget? child;

  _OnboardingItem({required this.image, required this.text, this.child});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 16,
        bottom: MediaQuery.of(context).padding.bottom + 96
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              child: Image(
                  image: image,
                  fit: BoxFit.fitWidth),
            ),
          Flexible(
              child: Text(
                  text,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),)),
          child ?? SizedBox.fromSize(size: Size.zero),
        ],
      ),
    );
  }

}