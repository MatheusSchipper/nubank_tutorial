import 'package:flutter/material.dart';

class ThirdCard extends StatefulWidget {
  @override
  _ThirdCardState createState() => _ThirdCardState();
}

class _ThirdCardState extends State<ThirdCard> {
  bool _inRewards = false;
  bool _buttonPressed = false;
  @override
  Widget build(BuildContext context) {
    return !_inRewards
        ? Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.card_giftcard,
                  color: Colors.grey,
                ),
                Column(
                  children: [
                    Text(
                      'Nubank Rewards',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Acumule pontos que nunca expiram e troque por passagens aéreas ou serviços que você realmente utiliza',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.7, color: Colors.purple[800]),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: RaisedButton(
                    color: Colors.transparent,
                    onHighlightChanged: (pressed) {
                      setState(() {
                        _buttonPressed = pressed;
                      });
                    },
                    textColor:
                        _buttonPressed ? Colors.white : Colors.purple[800],
                    highlightColor: Colors.purple[800],
                    elevation: 0,
                    disabledElevation: 0,
                    focusElevation: 0,
                    highlightElevation: 0,
                    hoverElevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'ATIVE O SEU REWARDS',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _inRewards = !_inRewards;
                      });
                    },
                  ),
                ),
              ],
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.card_giftcard,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Rewards',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _inRewards = !_inRewards;
                                  });
                                },
                                child: Icon(
                                  Icons.backspace,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 20, bottom: 20),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '2500 ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'pts',
                                      ),
                                    ],
                                  ),
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.purple[800],
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(text: 'Você acumulou '),
                                      TextSpan(
                                        text: '4.000 pontos',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.purple[800],
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' nos últimos 30 dias',
                                      ),
                                    ],
                                  ),
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.restaurant,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Text(
                              'Apagar compra de R\$19,90 em Ifood com 1990pts',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
