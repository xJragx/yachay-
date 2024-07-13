import 'package:aprendiendoflutter/presentation/screens/panel_course/providers/courses_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createCourseFormProvider = StateNotifierProvider.autoDispose<
    CreateCourseFormNotifier, CreateCourseFormState>((ref) {
  final createCourseCallback = ref.watch(coursesProvider.notifier).createCourse;

  return CreateCourseFormNotifier(createCourseCallback: createCourseCallback);
});

// Estado inicial del estado del provider
class CreateCourseFormState {
  final bool isPosting;
  final bool isValid;
  final bool isFormPosted;
  final String name;
  final String banner;
  final String category;
  final String description;
  final String resume;
  final String language;
  final String filesCount;
  final double rating;
  final double price;
  final double discount;
  final String benefits;
  final String targetPublic;

  CreateCourseFormState({
    this.name = '',
    this.banner = '',
    this.category = '',
    this.description = '',
    this.resume = '',
    this.language = '',
    this.filesCount = '',
    this.rating = 0.0,
    this.price = 0.0,
    this.discount = 0.0,
    this.benefits = '',
    this.targetPublic = '',
    this.isPosting = false,
    this.isValid = false,
    this.isFormPosted = false,
  });

  CreateCourseFormState copyWith({
    bool? isPosting,
    bool? isValid,
    bool? isFormPosted,
    String? name,
    String? banner,
    String? category,
    String? description,
    String? resume,
    String? language,
    String? filesCount,
    double? rating,
    double? price,
    double? discount,
    String? benefits,
    String? targetPublic,
  }) {
    return CreateCourseFormState(
      isPosting: isPosting ?? this.isPosting,
      isValid: isValid ?? this.isValid,
      isFormPosted: isFormPosted ?? this.isFormPosted,
      name: name ?? this.name,
      banner: banner ?? this.banner,
      category: category ?? this.category,
      description: description ?? this.description,
      resume: resume ?? this.resume,
      language: language ?? this.language,
      filesCount: filesCount ?? this.filesCount,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      benefits: benefits ?? this.benefits,
      targetPublic: targetPublic ?? this.targetPublic,
    );
  }

  @override
  String toString() {
    return '''
    CreateCourseFormState:
      isPosting: $isPosting
      isValid: $isValid
      isFormPosted: $isFormPosted
    ''';
  }
}

class CreateCourseFormNotifier extends StateNotifier<CreateCourseFormState> {
  final Function(
    String,
    String,
    String,
    String?,
    String?,
    String?,
    String?,
    double?,
    double?,
    double?,
    String?,
    String?,
  ) createCourseCallback;

  CreateCourseFormNotifier({
    required this.createCourseCallback,
  }) : super(CreateCourseFormState());

  onNameChange(String value) {
    final newName = value;
    state = state.copyWith(
      name: newName,
      isValid: newName.isNotEmpty,
    );
  }

  onBannerChange(String value) {
    final newBanner = value;
    state = state.copyWith(
      banner: newBanner,
      isValid: newBanner.isNotEmpty,
    );
  }

  onCategoryChange(String value) {
    final newCategory = value;
    state = state.copyWith(
      isValid: newCategory.isNotEmpty,
    );
  }

  onDescriptionChange(String value) {
    final newDescription = value;
    state = state.copyWith(
      description: newDescription,
      isValid: newDescription.isNotEmpty,
    );
  }

  onResumeChange(String value) {
    final newResume = value;
    state = state.copyWith(
      resume: newResume,
      isValid: newResume.isNotEmpty,
    );
  }

  onLanguageChange(String value) {
    final newLanguage = value;
    state = state.copyWith(
      language: newLanguage,
      isValid: newLanguage.isNotEmpty,
    );
  }

  onFilesCountChange(String value) {
    final newFilesCount = value;
    state = state.copyWith(
      filesCount: newFilesCount,
      isValid: newFilesCount.isNotEmpty,
    );
  }

  onRatingChange(double value) {
    final newRating = value;
    state = state.copyWith(
      rating: newRating,
      isValid: newRating > 0,
    );
  }

  onPriceChange(double value) {
    final newPrice = value;
    state = state.copyWith(
      price: newPrice,
      isValid: newPrice > 0,
    );
  }

  onDiscountChange(double value) {
    final newDiscount = value;
    state = state.copyWith(
      discount: newDiscount,
      isValid: newDiscount > 0,
    );
  }

  onBenefitsChange(String value) {
    final newBenefits = value;
    state = state.copyWith(
      benefits: newBenefits,
      isValid: newBenefits.isNotEmpty,
    );
  }

  onTargetPublicChange(String value) {
    final newTargetPublic = value;
    state = state.copyWith(
      targetPublic: newTargetPublic,
      isValid: newTargetPublic.isNotEmpty,
    );
  }

  onFormSubmit() async {
    if (!state.isValid) return;

    state = state.copyWith(isPosting: true);

    await createCourseCallback(
      state.name,
      state.banner,
      state.category,
      state.resume,
      state.description,
      state.language,
      state.filesCount,
      state.rating,
      state.price,
      state.discount,
      state.benefits,
      state.targetPublic,
    );

    state = state.copyWith(isPosting: false);
  }
}
