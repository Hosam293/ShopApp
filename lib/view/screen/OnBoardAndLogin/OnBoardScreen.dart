import 'package:flutter/material.dart';
import 'package:shopapp/controller/CacheHelper.dart';
import 'package:shopapp/model/OnBoardModel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'LoginScreen.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  var pageController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions:
          [
            TextButton(onPressed: ()
            {
              CacheHelper.saveData(key: 'onBoarding',value: true).then((value)
              {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        LoginScreen(),
                  ),
                );
              });
            },child: Text(
              'SKIP',style: TextStyle(
              color: Colors.deepOrange,

            ),
            ),)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image(
                          image: AssetImage(
                            onBoardModel[index].image,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        onBoardModel[index].title,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        onBoardModel[index].body,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                  itemCount: onBoardModel.length,
                  controller: pageController,
                  onPageChanged: (index) {
                    if (index == onBoardModel.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                      controller: pageController,
                      count: onBoardModel.length,
                  effect:ExpandingDotsEffect(
                    activeDotColor: Colors.deepOrange,
                    dotColor: Colors.grey,
                    dotWidth: 10.0,
                    dotHeight: 10.0,

                  ) ),
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast) {
                        CacheHelper.saveData(key: 'onBoarding',value: true).then((value)
                        {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LoginScreen(),
                            ),
                          );
                        });

                      } else {
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.easeInToLinear);
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
}
