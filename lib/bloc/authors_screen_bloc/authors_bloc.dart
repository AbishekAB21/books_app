import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:books_app/api/authors_api_request.dart';
import 'package:meta/meta.dart';

part 'authors_event.dart';
part 'authors_state.dart';

class AuthorsBloc extends Bloc<AuthorsEvent, AuthorsState> {
  final BooksRepository booksRepository;
  List<Map<String, dynamic>> authors = []; 

  AuthorsBloc(this.booksRepository) : super(AuthorsInitial()) {
    // Handle fetching authors
    on<FetchAuthorsEvent>((event, emit) async {
      try {
        emit(AuthorsLoading());
        authors = await booksRepository.fetchAuthors();
        emit(AuthorsLoaded(authors));
      } catch (e) {
        emit(AuthorsError("Failed to fetch authors"));
      }
    });

    // Handle adding a new author
    on<AddAuthorEvent>((event, emit) async {
      try {
        emit(AuthorsLoading());
        await booksRepository.addAuthor(event.name, event.description, event.dob);
        
        // Fetch the updated list of authors after adding a new one
        authors = await booksRepository.fetchAuthors();
        emit(AuthorsLoaded(authors));
      } catch (e) {
        emit(AuthorsError("Failed to add author"));
      }
    });
  }
}
