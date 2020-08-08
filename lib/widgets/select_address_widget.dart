import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stair_bot/general/general.dart';
import 'package:stair_bot/providers/profile.dart';

class SelectAddressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);

    final Profile _profileProvider = Provider.of<Profile>(context);

    final Address _defaultAddress = _profileProvider.defaultAddress;
    final dynamic _defaultAddressKey = _profileProvider.defaultAddressKey;

    final List<Map<dynamic, Address>> _remainingAddressMapsList =
        _profileProvider.remainingAddresses;

    final Function _getAddressString = _profileProvider.getAddressString;

    final dynamic _selectedAddressKey = _profileProvider.selectedAddressKey;

    int _addressIndex = 1;

    Widget buildAddressWidget(
        {String title, String address, dynamic key, bool isHighlight}) {
      return InkWell(
        onTap: () {
          _profileProvider.selectAddress(key);
        },
        child: Container(
          width: mediaQuery.width * 0.34,
          height: mediaQuery.width * 0.34,
          decoration: ShapeDecoration(
            color: isHighlight ? Colors.lightBlue[50] : null,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(unitSize * 12),
                side: BorderSide(
                    color: isHighlight
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    width: unitSize * 2.5)),
          ),
          child: Center(
            child: ListTile(
              title: Text(
                title,
                textScaleFactor: unitSize,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              subtitle: Text(
                address,
                textScaleFactor: unitSize,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: unitSize * 6,
        ),
        Text(
          'Choose your Bot:',
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(fontWeight: FontWeight.bold),
          textScaleFactor: unitSize,
        ),
        SizedBox(
          height: unitSize * 6,
        ),
        Container(
          width: mediaQuery.width,
          height: mediaQuery.width * 0.45,
          padding: EdgeInsets.symmetric(
              horizontal: unitSize * 15, vertical: unitSize * 15),
          child: Center(
            child: ListView(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildAddressWidget(
                        title: _defaultAddress.name,
                        address: _getAddressString(_defaultAddress),
                        key: _defaultAddressKey,
                        isHighlight: _selectedAddressKey == _defaultAddressKey),
                    SizedBox(
                      width: unitSize * 15,
                    ),
                  ],
                ),
                ..._remainingAddressMapsList.map((e) {
                  _addressIndex++;
                  return Row(
                    children: <Widget>[
                      buildAddressWidget(
                          title: e.values.toList()[0].name,
                          address: _getAddressString(e.values.toList()[0]),
                          key: e.keys.toList()[0],
                          isHighlight:
                              _selectedAddressKey == e.keys.toList()[0]),
                      SizedBox(
                        width: unitSize * 15,
                      ),
                    ],
                  );
                }).toList(),
              ],
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        SizedBox(
          height: unitSize * 6,
        ),
      ],
    );
  }
}
