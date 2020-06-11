import 'package:flutter/material.dart';

import 'item_menu_bottom.dart';

class BottomMenu extends StatefulWidget {
  final bool showMenu;

  const BottomMenu({Key key, this.showMenu}) : super(key: key);

  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  Tween<double> _tween;

  @override
  void initState() {
    super.initState();
    _tween = Tween<double>(
      begin: 150.0,
      end: 150.0,
    );
    delayAnimation();
  }

  Future delayAnimation() async {
    await Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _tween = Tween<double>(
          begin: 150.0,
          end: 0,
        );
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        duration: Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        tween: _tween,
        builder: (context, value, child) {
        return AnimatedPositioned(
                duration: Duration(milliseconds: 200),
                bottom: !widget.showMenu ? 0 + MediaQuery.of(context).padding.bottom : 0,
                left: value,
                right: value * -1,
                height: MediaQuery.of(context).size.height * 0.135,
                child: IgnorePointer(
                  ignoring: widget.showMenu,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 200),
                    opacity: widget.showMenu ? 0 : 1,
                    child: Container(
                        child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        ItemMenuBottom(
                          icon: Icons.person_add,
                          title: 'Indicar amigos',
                        ),
                        ItemMenuBottom(
                          icon: Icons.phone_android,
                          title: 'Recarga de celular',
                        ),
                        ItemMenuBottom(
                          icon: Icons.chat,
                          title: 'Cobrar',
                        ),
                        ItemMenuBottom(
                          icon: Icons.monetization_on,
                          title: 'Empréstimos',
                        ),
                        ItemMenuBottom(
                          icon: Icons.move_to_inbox,
                          title: 'Depositar',
                        ),
                        ItemMenuBottom(
                          icon: Icons.mobile_screen_share,
                          title: 'Transferir',
                        ),
                        ItemMenuBottom(
                          icon: Icons.format_align_center,
                          title: 'Ajustar limite',
                        ),
                        ItemMenuBottom(
                          icon: Icons.chrome_reader_mode,
                          title: 'Pagar',
                        ),
                        ItemMenuBottom(
                          icon: Icons.lock_open,
                          title: 'Bloquear cartão',
                        ),
                      ],
                    )),
                  ),
                ),
              );
      }
    );
  }
}