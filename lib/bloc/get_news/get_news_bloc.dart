import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_apps/data/datasources/news_remote_datasource.dart';
import 'package:news_apps/data/models/responses/get_all_news_responses_model.dart';

part 'get_news_event.dart';
part 'get_news_state.dart';

class GetNewsBloc extends Bloc<GetNewsEvent, GetNewsState> {
  final NewsRemoteDatasource newsRemoteDatasource;
  GetNewsBloc(
    this.newsRemoteDatasource,
  ) : super(GetNewsInitial()) {
    on<GetNews>((event, emit) async {
      emit(GetNewsLaoding());
      try {
        final resultNews = await newsRemoteDatasource.getAllNews();
        resultNews.fold(
          (l) => emit(GetNewsError(message: l)),
          (r) => emit(GetNewsLoaded(getAllNewsResponseModel: r)),
        );
      } catch (e) {
        emit(GetNewsError(message: e.toString()));
      }
    });
  }
}
