import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'authors_event.dart';
part 'authors_state.dart';

class AuthorsBloc extends Bloc<AuthorsEvent, AuthorsState> {
  AuthorsBloc() : super(AuthorsInitial()) {
    on<AuthorsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
