import 'package:loza_mobile/domain/models/models.dart';
import 'package:loza_mobile/domain/usecase/notDeiIveredOrders_usecase.dart';
import 'package:loza_mobile/presentation/base/base_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class DeliVeryManViewModel extends BaseViewModel
    with DeliVeryManViewModelInputs, DeliVeryManViewModelOutputs {

  final _deliveryManStreamController = BehaviorSubject<DeliVeryManViewObject>();
  final deliveryManDetailsStreamController = BehaviorSubject<DeliveryMan>();

  final GetNotDeliveredOrdersUseCase _getNotDeliveredOrdersUseCase;
  final GetDeliveryManDetailsUseCase _deliveryManDetailsUseCase;
  final ConfirmOrderUseCase _confirmOrderUseCase;
  DeliVeryManViewModel(this._getNotDeliveredOrdersUseCase,this._deliveryManDetailsUseCase,this._confirmOrderUseCase);

  @override
  void dispose() {
    _deliveryManStreamController.close();
    deliveryManDetailsStreamController.close();
  }

  @override
  void start() {
    getNotDeliveredDeliVeryMans();
  }

  @override
  getNotDeliveredDeliVeryMans() async{
    (await _getNotDeliveredOrdersUseCase.execute(null)).fold((failure) {}, (notDeliveredDeliVeryMans) {
      inputDeliVeryManData.add(DeliVeryManViewObject(notDeliveredDeliVeryMans.data.allOrders));
    });
  }

  @override
  getDeliVeryMansDetails(int deliveryManId) async{
    (await _deliveryManDetailsUseCase.execute(deliveryManId)).fold((failure) {}, (deliveryManDetailsObject) {
      deliveryManDetailsStreamController.add(
          DeliveryMan(
            deliveryManDetailsObject.data.number,
            deliveryManDetailsObject.data.shippingadress,
            deliveryManDetailsObject.data.paymentmethod,
            deliveryManDetailsObject.data.orderdate,
            deliveryManDetailsObject.data.isDelivered,
            deliveryManDetailsObject.data.phonenumber,
            deliveryManDetailsObject.data.username,
            deliveryManDetailsObject.data.totalCheck,
            deliveryManDetailsObject.data.products,
          ));
    });
  }

  @override
  confirmOrder(int orderId) async{
    (await _confirmOrderUseCase.execute(orderId)).fold((failure) {}, (data) {

    });
  }

  @override
  Sink get inputDeliVeryManData => _deliveryManStreamController.sink;

  @override
  Stream<DeliVeryManViewObject> get outputDeliVeryManData =>
      _deliveryManStreamController.stream.map((data) => data);

}

abstract class DeliVeryManViewModelInputs {

  Sink get inputDeliVeryManData;
  getNotDeliveredDeliVeryMans();
  getDeliVeryMansDetails(int deliveryManId);
  confirmOrder(int orderId);
}

abstract class DeliVeryManViewModelOutputs {
  Stream<DeliVeryManViewObject> get outputDeliVeryManData;
}

class DeliVeryManViewObject {
  List<Map<String, dynamic>> userDeliVeryMan;

  DeliVeryManViewObject(this.userDeliVeryMan);
}