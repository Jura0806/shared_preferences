

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefs_demo/models/account_model.dart';

class AccountPrefs{

  static storeAccount(Account account)  async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String  stringAccount = jsonEncode(account);
    preferences.setString("account", stringAccount);
  }

  static Future<Account> loadAccount()  async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String  stringAccount = preferences.getString("account");
    if(stringAccount == null || stringAccount.isEmpty){
      return null;
    }
    Map map = jsonDecode(stringAccount);
    return Account.fromJson(map);
  }
}