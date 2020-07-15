import 'package:flutter/material.dart';

class ItemMenuBottom extends StatelessWidget {
  final IconData icon;
  final String title;

  const ItemMenuBottom({Key key, this.icon, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon),
              Text(
                title,
                style: TextStyle(fontSize: 11),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white12,
        ),
      ),
    );
  }
}
