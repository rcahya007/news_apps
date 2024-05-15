part of 'get_news_bloc.dart';

@immutable
sealed class GetNewsState {}

final class GetNewsInitial extends GetNewsState {}

final class GetNewsLaoding extends GetNewsState {}

final class GetNewsLoaded extends GetNewsState {
  final GetAllNewsResponseModel getAllNewsResponseModel;
  GetNewsLoaded({required this.getAllNewsResponseModel});
}

final class GetNewsError extends GetNewsState {
  final String message;
  GetNewsError({required this.message});
}
