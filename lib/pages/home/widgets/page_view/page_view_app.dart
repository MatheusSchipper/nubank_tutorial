import 'package:flutter/material.dart';
import 'package:nubank_tutorial/pages/home/widgets/cards/card_app.dart';
import 'package:nubank_tutorial/pages/home/widgets/cards/first_card.dart';
import 'package:nubank_tutorial/pages/home/widgets/cards/second_card.dart';
import 'package:nubank_tutorial/pages/home/widgets/cards/third_card.dart';

class PageViewApp extends StatefulWidget {
  final double top;
  final ValueChanged<int> onChanged;
  final GestureDragUpdateCallback onPanUpdate;
  final bool showMenu;

  const PageViewApp(
      {Key key, this.top, this.onChanged, this.onPanUpdate, this.showMenu})
      : super(key: key);

  @override
  _PageViewAppState createState() => _PageViewAppState();
}

class _PageViewAppState extends State<PageViewApp> {
  Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _tween = Tween<double>(
      begin: 150.0,
      end: 0.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        tween: _tween,
        builder: (context, value, child) {
          return AnimatedPositioned(
            duration: Duration(milliseconds: 250),
            curve: Curves.easeOut,
            top: widget.top,
            height: MediaQuery.of(context).size.height * 0.50,
            left: value, //0,
            right: value * -1, //0,
            child: GestureDetector(
              onPanUpdate: widget.onPanUpdate,
              child: PageView(
                onPageChanged: widget.onChanged,
                physics: widget.showMenu
                    ? NeverScrollableScrollPhysics()
                    : BouncingScrollPhysics(),
                children: <Widget>[
                  CardApp(
                    child: FirstCard(),
                  ),
                  CardApp(
                    child: SecondCard(),
                  ),
                  CardApp(
                    child: ThirdCard(),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
