import 'package:flutter/material.dart';
import 'package:stair_bot/widgets/dummy_body.dart';
import 'package:stair_bot/widgets/my_app_bar.dart';
import 'package:stair_bot/widgets/select_address_widget.dart';

class GenScreen extends StatelessWidget {
  static const routeName = '/gen_screen';

  final String _store;

  GenScreen(this._store);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(_store),
      body: Column(
        children: <Widget>[
          Expanded(child: DummyBody(_store)),
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
