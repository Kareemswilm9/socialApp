import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:socail_applcation/modules/login/loginshopScreen.dart';
import 'package:socail_applcation/shared/components/network/remote/CacheHelper.dart';
import 'package:socail_applcation/shared/components/widgets/components.dart';

class Boardingmodel {
  final String? image;
  final String? titel;
  final String? body;

  Boardingmodel({required this.image, required this.titel, required this.body});
}

class OnBoarding_Screen extends StatefulWidget {
  @override
  State<OnBoarding_Screen> createState() => _OnBoarding_ScreenState();
}

class _OnBoarding_ScreenState extends State<OnBoarding_Screen> {
  List<Boardingmodel> boarding = [
    Boardingmodel(
      image: 'assets/images/onboard_1.jpg',
      titel: 'onBoarding 1 Title',
      body: 'onBoarding 1 Body',
    ),
    Boardingmodel(
      image: 'assets/images/onboard_1.jpg',
      titel: 'onBoarding 2 Title',
      body: 'onBoarding 2 Body',
    ),
    Boardingmodel(
      image: 'assets/images/onboard_1.jpg',
      titel: 'onBoarding 3 Title',
      body: 'onBoarding 3 Body',
    ),
  ];

  var pageController = PageController();

  bool isLast = false;
  void submit() {
    CacheHelper.saveData(key: 'on_Boarding', value: true).then((value) {
      if (value) {
        navigateTo(context, LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          backgroundColor: Colors.white,
          actions: [
            defaultTextButton(
              function: () {
                submit;
              },
              text: 'Skip',
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) =>
                      buildboardingItems(boarding[index]),
                  physics: BouncingScrollPhysics(),
                  controller: pageController,
                  onPageChanged: (index) {
                    if (index == boarding.length ) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = true;
                      });
                    }
                  },
                  itemCount: boarding.length,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: boarding.length,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      dotWidth: 10,
                      activeDotColor: Colors.deepPurpleAccent,
                      spacing: 6,
                      expansionFactor: 4.0,
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast) {
                        submit();
                      } else {
                        pageController.nextPage(
                            duration: Duration(microseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: Icon(Icons.arrow_forward_ios_outlined),
                  )
                ],
              )
            ],
          ),
        ));
  }

  Widget buildboardingItems(Boardingmodel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            '${model.titel}',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}
