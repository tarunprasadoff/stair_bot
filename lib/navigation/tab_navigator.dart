import 'package:flutter/material.dart';
import 'package:stair_bot/screens/control_screen.dart';
import 'package:stair_bot/screens/gen_screen.dart';
import 'package:stair_bot/screens/sensor_screen.dart';
import 'package:stair_bot/screens/track_location.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator(this._navigatorKey, this._index);
  final GlobalKey<NavigatorState> _navigatorKey;
  final int _index;

  Map<String, WidgetBuilder> _shopRouteBuilders(
      BuildContext context, Object arguments) {
    return {
      // ignore: missing_return
      '/': (context) {
        switch (_index) {
          case 0:
            return SensorScreen();
            break;
          case 1:
            return TrackLocationScreen();
            break;
          case 2:
            return ControlScreen();
            break;
          case 3:
            return GenScreen('Settings');
            break;
          default:
        }
      },
    };
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: _navigatorKey,
        // ignore: missing_return
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
              builder: (context) => _shopRouteBuilders(context,
                  routeSettings.arguments)[routeSettings.name](context));
        });
  }
}
