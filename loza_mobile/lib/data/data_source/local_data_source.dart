import 'package:loza_mobile/domain/models/models.dart';

const cacheShoppingCartKey = "CACHE_Shopping_Cart_KEY";

abstract class LocalDataSource{

  Future<Map<String, ShoppingCartObject>> getShoppingCartObjects();

  Future<void> saveShoppingCartObjects(String key, ShoppingCartObject shoppingCartObject);

  void clearCache();

  void removeFromCache(String key);
}

class LocalDataSourceImpl implements LocalDataSource{

  Map<String, CachedItem> cacheMap = {};

  @override
  Future<Map<String, ShoppingCartObject>> getShoppingCartObjects() async{
    CachedItem? cachedItems = cacheMap[cacheShoppingCartKey];

   if (cachedItems != null) {

     return cachedItems.data;
   } else {

     return {};
   }

  }

  @override
  Future<void> saveShoppingCartObjects(String key, ShoppingCartObject shoppingCartObject) async{
    Map<String, ShoppingCartObject> cachedItems = {};
    cachedItems.addAll({key : shoppingCartObject});
    cacheMap[cacheShoppingCartKey] = CachedItem(cachedItems);
  }

  @override
  void clearCache() {
    cacheMap.clear();
  }

  @override
  void removeFromCache(String key) {
    cacheMap.remove(key);
  }

}

class CachedItem {
  dynamic data;

  CachedItem(this.data);
}