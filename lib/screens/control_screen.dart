import 'package:flutter/material.dart';
import 'package:stair_bot/widgets/my_app_bar.dart';
import 'package:stair_bot/widgets/select_address_widget.dart';
import 'package:joystick/joystick.dart';

class ControlScreen extends StatefulWidget {
  static const routeName = '/control_screen';

  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  bool isPayloadLocked = false;

  Widget buildButton(
      BuildContext context, IconData icon, String text, Color color) {
    return RaisedButton.icon(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 22),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
            side: BorderSide(color: color, width: 2)),
        color: Colors.white,
        onPressed: () {},
        icon: Icon(
          icon,
          size: 22,
          color: color,
        ),
        label: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(fontSize: 22, color: color),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Control'),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Column(
            children: <Widget>[
              Stack(children: <Widget>[
                Container(
                  child: FittedBox(
                    child: Image.asset('assets/images/stair.jpeg'),
                    fit: BoxFit.fill,
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      color: Colors.black38,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Camera Feed:',
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(
                                  color: Theme.of(context).primaryColorLight,
                                ),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
              Divider(
                thickness: 1,
                height: 1,
                color: Theme.of(context).accentColor,
              ),
              Container(
                child: Expanded(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        width: -.5 + MediaQuery.of(context).size.width / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Autonomous:',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            buildButton(context, Icons.play_arrow, 'Start',
                                Colors.green),
                            buildButton(context, Icons.stop, 'Stop',
                                Theme.of(context).errorColor),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        color: Theme.of(context).accentColor,
                        width: 1,
                        thickness: 1,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        width: -.5 + MediaQuery.of(context).size.width / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Manual:',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            Container(
                              height: 80,
                              width: 80,
                              child: Joystick(
                                  size: 80,
                                  iconColor: Colors.white,
                                  isDraggable: false,
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  opacity: 0.5,
                                  joystickMode: JoystickModes.all,
                                  onUpPressed: () {},
                                  onLeftPressed: () {},
                                  onRightPressed: () {},
                                  onDownPressed: () {},
                                  onPressed: (_direction) {
                                    // print("pressed $_direction");
                                  }),
                            ),
                            SwitchListTile(
                              title: Text(
                                'Payload Lock',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(
                                      fontSize: 14,
                                    ),
                              ),
                              activeColor: Theme.of(context).primaryColor,
                              value: isPayloadLocked,
                              onChanged: (val) {
                                setState(() {
                                  isPayloadLocked = val;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
