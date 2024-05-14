import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_apps/data/datasources/news_remote_datasource.dart';
import 'package:news_apps/data/models/responses/get_all_news_responses_model.dart';

part 'get_news_bloc_event.dart';
part 'get_news_bloc_state.dart';

class GetNewsBlocBloc extends Bloc<GetNewsBlocEvent, GetNewsBlocState> {
  NewsRemoteDatasource newsRemoteDatasource;
  GetNewsBlocBloc(
    this.newsRemoteDatasource,
  ) : super(GetNewsBlocInitial()) {
    on<GetAllNews>((event, emit) async {
      emit(GetNewsBlocLoading());
      final result = await newsRemoteDatasource.getAllNews();
      result.fold(
        (l) => emit(GetNewsBlocError(massage: l)),
        (r) => emit(GetNewsBlocLoaded(data: r)),
      );
    });
  }
}
