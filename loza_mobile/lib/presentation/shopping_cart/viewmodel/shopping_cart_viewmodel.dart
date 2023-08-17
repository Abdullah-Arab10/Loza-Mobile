import 'package:loza_mobile/domain/usecase/cart_usecase.dart';
import 'package:loza_mobile/presentation/base/base_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class ShoppingCartViewModel extends BaseViewModel
    with ShoppingCartViewModelInputs, ShoppingCartViewModelOutputs {

  final _cartStreamController = BehaviorSubject<CartViewObject>();
  final _totalStreamController = BehaviorSubject<double>();
  double _total = 0;

  final CartUseCase _cartUseCase;
  ShoppingCartViewModel(this._cartUseCase);

  @override
  void dispose() {
    _cartStreamController.close();
    _totalStreamController.close();
  }

  @override
  void start([int? num]) {
    getFromCart(num!);
    inputTotal.add(_total);
  }

  @override
  getFromCart(int userId) async{
    (await _cartUseCase.execute(userId)).fold((failure) {}, (cartObject) {
      inputCartData.add(CartViewObject(cartObject.dataResponse.userCart));
      for (var element in cartObject.dataResponse.userCart) {
        _total += element['price'] as double;
      }
      print(_total);
      inputTotal.add(_total);
    });
  }

  @override
  Sink get inputCartData => _cartStreamController.sink;

  @override
  Sink get inputTotal => _totalStreamController.sink;

  @override
  Stream<CartViewObject> get outputCartData =>
      _cartStreamController.stream.map((data) => data);

  @override
  Stream<double> get outputTotal => _totalStreamController.stream.map((total) => total);

}

abstract class ShoppingCartViewModelInputs {

  Sink get inputCartData;
  Sink get inputTotal;
  getFromCart(int userId);

}

abstract class ShoppingCartViewModelOutputs {
  Stream<CartViewObject> get outputCartData;
  Stream<double> get outputTotal;
}

class CartViewObject {
  List<Map<String, dynamic>> userCart;

  CartViewObject(this.userCart);
}