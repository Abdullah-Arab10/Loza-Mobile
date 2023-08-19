import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/domain/usecase/order_usecase.dart';
import 'package:loza_mobile/presentation/base/base_viewmodel.dart';
import 'package:loza_mobile/presentation/resources/extensions_manager.dart';
import 'package:rxdart/rxdart.dart';

class OrderViewModel extends BaseViewModel
    with OrderViewModelInputs, OrderViewModelOutputs {

  final _orderStreamController = BehaviorSubject<OrderViewObject>();
  final orderDetailsStreamController = BehaviorSubject<Order>();

  final GetOrdersUseCase _ordersUseCase;
  final GetOrdersDetailsUseCase _ordersDetailsUseCase;
  OrderViewModel(this._ordersUseCase,this._ordersDetailsUseCase);

  @override
  void dispose() {
    _orderStreamController.close();
    orderDetailsStreamController.close();
  }

  @override
  void start() {
    int id = Extensions.extractIdFromToken();
    getOrders(id);
  }

  @override
  getOrders(int userId) async{
    (await _ordersUseCase.execute(userId)).fold((failure) {}, (orderObject) {
      inputOrderData.add(OrderViewObject(orderObject.dataResponse.allOrders));
    });
  }

  @override
  getOrdersDetails(int orderId) async{
    (await _ordersDetailsUseCase.execute(orderId)).fold((failure) {}, (orderDetailsObject) {
      orderDetailsStreamController.add(
          Order(
            orderDetailsObject.data.number,
            orderDetailsObject.data.shippingadress,
            orderDetailsObject.data.paymentmethod,
            orderDetailsObject.data.orderdate,
            orderDetailsObject.data.isDelivered,
            orderDetailsObject.data.totalCheck,
            orderDetailsObject.data.products,
          ));
    });
  }

  @override
  Sink get inputOrderData => _orderStreamController.sink;

  @override
  Stream<OrderViewObject> get outputOrderData =>
      _orderStreamController.stream.map((data) => data);

}

abstract class OrderViewModelInputs {

  Sink get inputOrderData;
  getOrders(int userId);
  getOrdersDetails(int orderId);
}

abstract class OrderViewModelOutputs {
  Stream<OrderViewObject> get outputOrderData;
}

class OrderViewObject {
  List<Map<String, dynamic>> userOrder;

  OrderViewObject(this.userOrder);
}