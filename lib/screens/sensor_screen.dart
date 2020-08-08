import 'package:flutter/material.dart';
import 'package:stair_bot/widgets/my_app_bar.dart';
import 'package:stair_bot/widgets/select_address_widget.dart';

class SensorScreen extends StatelessWidget {
  static const routeName = '/sensor_screen';

  Widget buildSensorTile(
      String sensorName, String sensorValue, BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
            title:
                Text(sensorName, style: Theme.of(context).textTheme.bodyText2),
            trailing: Text(sensorValue,
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontWeight: FontWeight.normal,
                    ))),
        Divider(
          thickness: .5,
          height: .5,
          color: Theme.of(context).accentColor,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Sensor Data'),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView(
            children: <Widget>[
              buildSensorTile('Distance Left', '26.23 cm', context),
              buildSensorTile('Distance Right', 'No Obstacle', context),
              buildSensorTile('Distance Forward-Left', '12.2 cm', context),
              buildSensorTile('Distance Forward-Right', '12.4 cm', context),
              buildSensorTile('IMU Pitch', '20.24', context),
              buildSensorTile('IMU Yaw', '206.41', context),
              buildSensorTile('Mode', 'Staircase', context),
            ],
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
