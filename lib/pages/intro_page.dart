import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_practice20_intro_page/pages/home_page.dart';

class IntroPage extends StatefulWidget {
  static final String id = "intro_page";
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int _currentPage = 0;

  Widget _pageWidget(
      {required String image, required String text, required String content}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 55,
        right: 55,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(image),
            height: 260,
            width: 220,
          ),
          SizedBox(
            height: 21,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 25, color: Colors.green, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            textAlign: TextAlign.center,
            content,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }

  Widget _indicatorMaker(bool isCurrent) {
    return AnimatedContainer(
      duration: Duration(microseconds: 380),
      height: 7,
      width: (isCurrent) ? 32 : 7,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  List<Widget> _indicatorsList() {
    List<Widget> list = [];

    for (int i = 0; i < 3; i++) {
      if (_currentPage == i) {
        list.add(_indicatorMaker(true));
      } else {
        list.add(_indicatorMaker(false));
      }
      list.add(SizedBox(
        width: 4,
      ));
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, HomePage.id);
                },
                child: Text(
                  "Skip",
                  style: TextStyle(
                      fontSize: 21,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              width: 16,
            )
          ],
        ),
        body: Stack(children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            children: [
              _pageWidget(
                  image: "assets/images/person.png",
                  text: "Desire to Change",
                  content: "Learn new skilss with us. No need any knowladge."),
              _pageWidget(
                  image: "assets/images/person6.png",
                  text: "Desire to Change",
                  content: "Learn new skilss with us. No need any knowladge."),
              _pageWidget(
                  image: "assets/images/person7.png",
                  text: "Desire to Change",
                  content: "Learn new skilss with us. No need any knowladge."),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 45),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _indicatorsList())
              ],
            ),
          )
        ]));
  }
}
