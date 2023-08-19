import 'package:loza_mobile/domain/usecase/review_usecase.dart';
import 'package:loza_mobile/presentation/base/base_viewmodel.dart';
import 'package:loza_mobile/presentation/resources/extensions_manager.dart';
import 'package:rxdart/rxdart.dart';

class ReviewViewModel extends BaseViewModel
    with ReviewViewModelInputs, ReviewViewModelOutputs {

  final _reviewStreamController = BehaviorSubject<ReviewViewObject>();

  final GetReviewsUseCase _reviewUseCase;
  ReviewViewModel(this._reviewUseCase);

  @override
  void dispose() {
    _reviewStreamController.close();

  }

  @override
  void start() {
    int id = Extensions.extractIdFromToken();
    getReview(id);
  }

  @override
  getReview(int userId) async{
    (await _reviewUseCase.execute(userId)).fold((failure) {}, (reviewObject) {
      inputReviewData.add(ReviewViewObject(reviewObject.dataResponse.allReviews));
    });
  }

  @override
  Sink get inputReviewData => _reviewStreamController.sink;

  @override
  Stream<ReviewViewObject> get outputReviewData =>
      _reviewStreamController.stream.map((data) => data);

}

abstract class ReviewViewModelInputs {

  Sink get inputReviewData;
  getReview(int userId);
}

abstract class ReviewViewModelOutputs {
  Stream<ReviewViewObject> get outputReviewData;
}

class ReviewViewObject {
  List<Map<String, dynamic>> userReview;

  ReviewViewObject(this.userReview);
}