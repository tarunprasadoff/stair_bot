import 'package:flutter/material.dart';
import 'package:stair_bot/widgets/my_app_bar.dart';
import 'package:stair_bot/widgets/select_address_widget.dart';

class TrackLocationScreen extends StatelessWidget {
  static const routeName = '/track_location_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Track Location'),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: FittedBox(
              child: Image.asset('assets/images/map.jpeg'),
              fit: BoxFit.fill,
            ),
            width: double.infinity,
          )),
          Divider(
            thickness: 1,
            height: 1,
            color: Theme.of(context).accentColor,
          ),
          SelectAddressWidget()
        ],
      ),
    );
  }
}
