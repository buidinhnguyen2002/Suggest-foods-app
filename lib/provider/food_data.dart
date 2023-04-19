import 'package:flutter/cupertino.dart';

import '../model/food.dart';

class FoodData with ChangeNotifier {
  List<Food> _foodFavorite = [
    Food(
      id: '1',
      name: 'Cá chép',
      category: 'Món chính',
      description: 'fwefewf',
      rate: 5.0,
      urlImage:
          'https://cdn.tgdd.vn/Files/2020/11/30/1310363/tong-hop-cac-mon-an-tu-ca-chep-bo-tui-de-nau-ca-thang-khong-bao-gio-ngan-202201071820154823.jpg',
    ),
    Food(
      id: '2',
      name: 'Cá chép',
      category: 'Món chính',
      description: 'fwefewf',
      rate: 4.0,
      urlImage:
          'https://cdn.tgdd.vn/Files/2020/11/30/1310363/tong-hop-cac-mon-an-tu-ca-chep-bo-tui-de-nau-ca-thang-khong-bao-gio-ngan-202201071820154823.jpg',
    ),
    Food(
      id: '3',
      name: 'Cá chép',
      category: 'Món chính',
      description: 'fwefewf',
      rate: 5.0,
      urlImage:
          'https://cdn.tgdd.vn/Files/2020/11/30/1310363/tong-hop-cac-mon-an-tu-ca-chep-bo-tui-de-nau-ca-thang-khong-bao-gio-ngan-202201071820154823.jpg',
    ),
    Food(
      id: '4',
      name: 'Cá chép',
      category: 'Món chính',
      description: 'fwefewf',
      rate: 5.0,
      urlImage:
          'https://cdn.tgdd.vn/Files/2020/11/30/1310363/tong-hop-cac-mon-an-tu-ca-chep-bo-tui-de-nau-ca-thang-khong-bao-gio-ngan-202201071820154823.jpg',
    ),
    Food(
      id: '6',
      name: 'Cá chép',
      category: 'Món chính',
      description: 'fwefewf',
      rate: 5.0,
      urlImage:
          'https://cdn.tgdd.vn/Files/2020/11/30/1310363/tong-hop-cac-mon-an-tu-ca-chep-bo-tui-de-nau-ca-thang-khong-bao-gio-ngan-202201071820154823.jpg',
    ),
    Food(
      id: '7',
      name: 'Cá chép',
      category: 'Món chính',
      description: 'fwefewf',
      rate: 5.0,
      urlImage:
          'https://cdn.tgdd.vn/Files/2020/11/30/1310363/tong-hop-cac-mon-an-tu-ca-chep-bo-tui-de-nau-ca-thang-khong-bao-gio-ngan-202201071820154823.jpg',
    ),
    Food(
      id: '8',
      name: 'Cá chép',
      category: 'Món chính',
      description: 'fwefewf',
      rate: 5.0,
      urlImage:
          'https://cdn.tgdd.vn/Files/2020/11/30/1310363/tong-hop-cac-mon-an-tu-ca-chep-bo-tui-de-nau-ca-thang-khong-bao-gio-ngan-202201071820154823.jpg',
    ),
  ];
  List<Food> get foods {
    return [..._foodFavorite];
  }

  List<Food> getFoodsByIds(List<String> ids) {
    List<Food> result = [];
    ids.forEach((id) {
      _foodFavorite.forEach((food) {
        if (food.id == id) {
          result.add(food);
        }
      });
    });
    return result;
  }
}
