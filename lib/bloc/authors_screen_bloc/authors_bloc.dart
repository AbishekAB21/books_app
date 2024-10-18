import 'package:books_app/api/authors_api_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        authors = await booksRepository.fetchAuthors();
        emit(AuthorsLoaded(authors));
      } catch (e) {
        emit(AuthorsError("Failed to fetch authors"));
      }
    });

    on<AddAuthorEvent>((event, emit) async {
      try {
        emit(AuthorsLoading());
        await booksRepository.addAuthor(event.name, event.description, event.dob);
        
        authors = await booksRepository.fetchAuthors();
        emit(AuthorsLoaded(authors));
      } catch (e) {
        emit(AuthorsError("Failed to add author"));
      }
    });

    // Add a handler for the DeleteAuthorEvent
    on<DeleteAuthorEvent>((event, emit) async {
      try {
        emit(AuthorsLoading());
        await booksRepository.deleteAuthor(event.authorId); // Call delete method
        authors = await booksRepository.fetchAuthors(); // Fetch updated list
        emit(AuthorsLoaded(authors));
      } catch (e) {
        emit(AuthorsError("Failed to delete author"));
      }
    });
  }
}
