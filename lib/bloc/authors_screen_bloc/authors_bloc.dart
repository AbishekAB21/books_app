import 'package:bloc/bloc.dart';
import 'package:books_app/api/authors_api_request.dart';
import 'package:meta/meta.dart';

part 'authors_event.dart';
part 'authors_state.dart';

class AuthorsBloc extends Bloc<AuthorsEvent, AuthorsState> {
  final BooksRepository booksRepository;
  List<Map<String, dynamic>> authors = []; 

  AuthorsBloc(this.booksRepository) : super(AuthorsInitial()) {
    on<FetchAuthorsEvent>((event, emit) async {
      try {
        emit(AuthorsLoading());
        authors = await booksRepository.fetchAuthors(event.query);
        emit(AuthorsLoaded(authors));
      } catch (e) {
        emit(AuthorsError("Failed to fetch authors"));
      }
    });

    on<AddAuthorEvent>((event, emit) {
      booksRepository.addAuthor(event.name, event.description, event.dob, authors);
      emit(AuthorsLoaded(authors)); 
    });
  }
}
