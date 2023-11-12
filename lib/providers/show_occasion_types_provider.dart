import 'package:demo_project/models/occaisons_list_model.dart';
import 'package:demo_project/repo/show_occasion_types.dart';
import 'package:flutter/material.dart';

class ShowOccaisonsProvider extends ChangeNotifier{
   bool isloadingproduct = false;
   OccaionsModel getOccaison=OccaionsModel();
   final occaionstypes=ShowOccaisonsRepo();
  
  Future<void> ocdprovider(int idmethod)async{
    isloadingproduct=true;
    notifyListeners();
   final occaionTitke=await occaionstypes.getoccaionsRepo(idmethod);
   getOccaison=occaionTitke!;
    
    isloadingproduct=false;
    notifyListeners();
    

  }
}




