import 'package:flutter/material.dart';
import 'package:stair_bot/general/general.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int _selectedPageIndex;
  final Function _tabChoose;

  MyBottomNavigationBar(this._selectedPageIndex, this._tabChoose);

  static const List<String> _titles = [
    'Sensor',
    'Location',
    'Control',
    'Settings'
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    final double _borderRadius = unitSize * 40.0;
    return Container(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: unitSize * 4, color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(_borderRadius),
                  topLeft: Radius.circular(_borderRadius)))),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(_borderRadius + unitSize * 3),
            topLeft: Radius.circular(_borderRadius + unitSize * 3)),
        child: BottomNavigationBar(
            elevation: 0,
            iconSize: unitSize * 32,
            selectedFontSize: unitSize * 20,
            unselectedFontSize: unitSize * 16,
            type: BottomNavigationBarType.fixed,
            onTap: _tabChoose,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.black54,
            selectedItemColor: Theme.of(context).primaryColor,
            currentIndex: _selectedPageIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_remote), title: Text(_titles[0])),
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_on), title: Text(_titles[1])),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_overscan), title: Text(_titles[2])),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), title: Text(_titles[3])),
            ]),
      ),
    );
  }
}
