import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shafinbd/config/myStyle.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hey ,',
                style: myStyle.detailText14.copyWith(
                    color: Colors.black54, fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                'Guest',
                style:
                    myStyle.headerText4.copyWith(fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        trailing: FaIcon(
          FontAwesomeIcons.bell,
          color: Colors.black,
        ),
      ),
    );
  }
}
