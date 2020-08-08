import 'package:flutter/cupertino.dart';

class Profile with ChangeNotifier {
  dynamic defaultAddressKey = 1;
  dynamic selectedAddressKey = 1;

  List<Map<dynamic, Address>> _myAddresses = [
    {
      1: Address(
          area: 'Flipkart Warehouse', name: 'Local Bot', city: 'Bangalore')
    },
    {UniqueKey(): Address(area: 'IIT Madras', name: 'Bot2', city: 'Chennai')},
    {UniqueKey(): Address(area: 'Forum Mall', name: 'Bot3', city: 'Hyderabad')},
    {UniqueKey(): Address(area: 'Ozone Towers', name: 'Bot4', city: 'Chennai')}
  ];

  int get noOfAddresses {
    return _myAddresses.length;
  }

  void setDefaultAddress(dynamic key) {
    defaultAddressKey = key;
    notifyListeners();
  }

  void selectAddress(dynamic key) {
    selectedAddressKey = key;
    notifyListeners();
  }

  dynamic addAddress(Address address) {
    dynamic _key = UniqueKey();
    if (_myAddresses.length == 0) {
      defaultAddressKey = _key;
    }
    _myAddresses.add({_key: address});
    notifyListeners();
    return _key;
  }

  int getIndexOfAddress(dynamic key) {
    return _myAddresses.indexWhere((element) => element.containsKey(key));
  }

  void removeAddress(dynamic key) {
    _myAddresses.removeWhere((element) => element.containsKey(key));
    notifyListeners();
  }

  void editAddress(dynamic key, Address address) {
    _myAddresses
        .firstWhere((element) => element.containsKey(key))
        .update(key, (value) => address);
    notifyListeners();
  }

  Address get defaultAddress {
    if (defaultAddressKey == null) {
      return null;
    } else {
      return _myAddresses.firstWhere((element) =>
          element.containsKey(defaultAddressKey))[defaultAddressKey];
    }
  }

  List<Map<dynamic, Address>> get remainingAddresses {
    return _myAddresses
        .where((element) => !element.containsKey(defaultAddressKey))
        .toList();
  }

  String getAddressString(Address myAddress) {
    return '${myAddress.area}, ${myAddress.city}';
  }

  Address getAddress(dynamic key) {
    return _myAddresses
        .firstWhere((element) => element.containsKey(key))
        .values
        .toList()[0];
  }
}

class Address {
  final String name;
  final String area;
  final String city;

  Address({@required this.name, @required this.area, @required this.city});
}
