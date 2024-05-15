import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_detail_news_event.dart';
part 'get_detail_news_state.dart';

class GetDetailNewsBloc extends Bloc<GetDetailNewsEvent, GetDetailNewsState> {
  GetDetailNewsBloc() : super(GetDetailNewsInitial()) {
    on<GetDetailNewsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
