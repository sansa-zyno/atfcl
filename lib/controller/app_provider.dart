import 'dart:convert';
import 'dart:developer';
import 'package:atfcl_fintech/constants/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/http.service.dart';

class AppProvider extends ChangeNotifier {
  String imageUrl = "";
  Map? profileDetails;
  List accountDetails = [];
  List transactions = [];

  AppProvider() {}

  /*Future<String> getUsername() async {
    String username = await LocalStorage().getString("username");
    return username;
  }*/

  getImage(String username) async {
    try {
      Response res =
          await HttpService.post(Api.getProfilePics, {"username": username});
      imageUrl = jsonDecode(res.data)[0]["avatar"];
    } catch (e) {
      imageUrl = "";
    }
    notifyListeners();
  }

  getProFileDetails(String username) async {
    Response res = await HttpService.post(Api.profile, {"username": username});
    profileDetails = jsonDecode(res.data)[0];
    notifyListeners();
  }

  getAccountDetails(String username) async {
    Response res =
        await HttpService.post(Api.dashboard, {"username": username});
    accountDetails = jsonDecode(res.data);
    log(accountDetails.toString());
    notifyListeners();
  }

  getTransactions(String username) async {
    Response res =
        await HttpService.post(Api.transactions, {"username": username});
    transactions = jsonDecode(res.data);
    notifyListeners();
  }

  removeUser() {
    profileDetails = null;
    imageUrl = "";
    notifyListeners();
  }
}
