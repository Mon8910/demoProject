import 'package:flutter/material.dart';

class ResetNewPasswordProvider extends ChangeNotifier{
  bool _isloading=false;
  bool get isloading =>_isloading;
  void setIsloading(bool val){
    _isloading=val;
  }

}