part of 'get_news_bloc_bloc.dart';

sealed class GetNewsBlocState {}

final class GetNewsBlocInitial extends GetNewsBlocState {}

final class GetNewsBlocLoading extends GetNewsBlocState {}

final class GetNewsBlocLoaded extends GetNewsBlocState {
  final GetAllNewsResponseModel data;
  GetNewsBlocLoaded({required this.data});
}

final class GetNewsBlocError extends GetNewsBlocState {
  final String massage;
  GetNewsBlocError({required this.massage});
}
