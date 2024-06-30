import 'package:add_to_cart/model/core/response_model/all_menu_item_response_body_model.dart';
import 'package:add_to_cart/model/service/remote/api_response.dart';
import 'package:add_to_cart/model/service/remote/dio_service.dart';
import 'package:add_to_cart/utils/colors.dart';
import 'package:flutter/material.dart';

class FoodViewModel extends ChangeNotifier {
  FoodListService _foodListService = ApiService();
  bool _isLoadingState = false;
  AllMenuItemResponseBodyModel? _allMenuItemResponseBodyModel;
  List<Menu>? _menu;
  Map<int, int> _itemCounts = {};

  bool get isLoadingState => _isLoadingState;

  AllMenuItemResponseBodyModel? get allMenuItemResponseBodyModel => _allMenuItemResponseBodyModel;
  Map<int, int> get itemCounts => _itemCounts;
  List<Menu>? get menu => _menu;

  Future<bool> FoodListFetch(BuildContext context) async {
    _isLoadingState = true;
    bool isFoodListFetch = false;
    _allMenuItemResponseBodyModel = null;
    _menu = null;
    try {
      ApiResponse apiResponse = await _foodListService.getAllFood();
      if (apiResponse.response != null) {
        if (apiResponse.response!.statusCode == 200) {
          _allMenuItemResponseBodyModel =
              AllMenuItemResponseBodyModel.fromJson(apiResponse.response!.data);
          _menu = _allMenuItemResponseBodyModel!.menu;
          isFoodListFetch = true;
          _isLoadingState = false;
          notifyListeners();
          if (context.mounted) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: AppColors.primaryColor,
              content: Center(child: Text(
                'Success}', style: const TextStyle(color: Colors.white),)),
            ));
          }
        }
        else {
          _isLoadingState = false;
          isFoodListFetch = false;
          notifyListeners();
          if (context.mounted) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(milliseconds: 1),
              backgroundColor: Colors.red,
              content: Center(child: Text(
                ' ${apiResponse.response!.data["status"]}${apiResponse.response!
                    .data["msg"] }',
                style: const TextStyle(color: Colors.white),)),
            ));
          }
        }
      }
      else {
        _isLoadingState = false;
        isFoodListFetch = false;
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(milliseconds: 1),
            backgroundColor: Colors.red,
            content: Center(child: Text(' ${apiResponse.error}',
              style: const TextStyle(color: Colors.white),)),
          ));
        }
      }
    }catch(e){
      _isLoadingState =false ;
      isFoodListFetch =false;
      notifyListeners();
      if(context.mounted){
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(
          duration: Duration(milliseconds: 1),
          backgroundColor: Colors.red,
          content: Center(child: Text('$e',style: const TextStyle(color: Colors.white),)),
        ));
      }
    }
    notifyListeners();
    return isFoodListFetch;
    }
  void incrementItemCount(int index) {
    if (_itemCounts.containsKey(index)) {
      _itemCounts[index] = (_itemCounts[index] ?? 0) + 1;
    } else {
      _itemCounts[index] = 1;
    }
    notifyListeners();
  }

  void decrementItemCount(int index) {
    if (_itemCounts.containsKey(index) && _itemCounts[index]! > 0) {
      _itemCounts[index] = (_itemCounts[index] ?? 0) - 1;
      if (_itemCounts[index] == 0) {
        _itemCounts.remove(index);
      }
    }
    notifyListeners();
  }

  int getItemCount(int index) {
    return _itemCounts[index] ?? 0;
  }
  double getSubtotal() {
    double subtotal = 0.0;
    _itemCounts.forEach((index, count) {
      subtotal += (count * _menu![index].price);
    });
    return subtotal;
  }

  double getVat() {
    double subtotal = getSubtotal();
    return subtotal * 0.05;
  }

  double getTotal() {
    double subtotal = getSubtotal();
    double vat = getVat();
    return subtotal + vat;
  }
  }
