import 'package:loza_mobile/domain/usecase/review_usecase.dart';
import 'package:loza_mobile/presentation/base/base_viewmodel.dart';
import 'package:loza_mobile/presentation/common/freezed/freezed_data_classes.dart';
import 'package:loza_mobile/presentation/resources/extensions_manager.dart';

class AddReviewViewModel extends BaseViewModel
    with AddReviewViewModelInputs, AddReviewViewModelOutputs {

  var addReviewObject = AddReviewObject("");

  final PostRatingUseCase _postRatingUseCase;
  AddReviewViewModel(this._postRatingUseCase);

  // inputs
  @override
  void dispose() {}

  @override
  void start() {}

  @override
  setReviewName(String review) {
    addReviewObject = addReviewObject.copyWith(review: review);
  }

  @override
  addReview(int productId, double rating) async {
    int id = Extensions.extractIdFromToken();
    (await _postRatingUseCase.execute(
        PostRatingUseCaseInput(id, productId, rating, addReviewObject.review)))
        .fold((failure) {}, (data) {
    });
  }

  bool _isReviewNameValid(String review) {
    if (review.isNotEmpty &&
        review.length >= 4) {
      return true;
    } else {
      return false;
    }
  }
}

abstract class AddReviewViewModelInputs {
  setReviewName(String review);
  addReview(int productId, double rating);
}

abstract class AddReviewViewModelOutputs {}
