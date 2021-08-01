import 'package:app/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class OnBoardingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselWithIndicatorDemo();
  }
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1502899576159-f224dc2349fa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80',
  'https://images.unsplash.com/photo-1598283867458-c4d33540b805?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=370&q=80',
  'https://images.unsplash.com/photo-1592513002316-e4fa19175023?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=282&q=80',
  'https://images.unsplash.com/photo-1445264918150-66a2371142a2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80'
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.network(
                      item,
                      fit: BoxFit.fill,
                      height: 1500,
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        height: 50,
        width: 0,
      ),
      CarouselSlider(
        items: imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
            // enlargeCenterPage: true,
            // aspectRatio: 2.0,
            height: 400,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 8.0,
              height: 6.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
            ),
          );
        }).toList(),
      ),
      Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.all(40.0),
              child: new GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, LoginController.selectRegisterOrLogin);
                  },
                  child: Text("건너 뛰기",
                      style: TextStyle(color: Colors.white.withOpacity(0.6)),
                  )),
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: FloatingActionButton(
                  onPressed: () {
                    _current == imgList.length - 1
                        ? Navigator.pushNamed(
                            context, LoginController.selectRegisterOrLogin)
                        : _controller.nextPage();
                  },
                  child: new Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  backgroundColor: Colors.blue,
                ),
              )),
        ],
      )
    ]));
  }
}
