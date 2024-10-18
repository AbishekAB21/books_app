import 'package:bloc/bloc.dart';
import 'package:books_app/api/books_api_request.dart';
import 'package:books_app/bloc/home_screen_bloc/home_screen_event.dart';
import 'package:books_app/bloc/home_screen_bloc/home_screen_state.dart';
import 'package:books_app/models/model.dart'; 

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final BooksApi booksApi;

  HomeScreenBloc(this.booksApi) : super(HomeScreenInitial()) {
    on<FetchBooksEvent>((event, emit) async {
      emit(HomeScreenLoading());
      try {
        
        final books = await booksApi.fetchBooks(); 
        emit(HomeScreenLoaded(books));
      } catch (e) {
        print('Error fetching books: $e');
        emit(HomeScreenError('Failed to fetch books: $e'));
      }
    });

    on<SearchBooksEvent>((event, emit) async {
      emit(HomeScreenLoading());
      try {
        final books = await _searchBooks(event.query);
        emit(HomeScreenLoaded(books));
      } catch (e) {
        emit(HomeScreenError('Failed to fetch books: $e'));
      }
    });
  }

  Future<List<Book>> _searchBooks(String query) async {
    final allBooks = await booksApi.fetchBooks(); 
    return allBooks.where((book) => book.title.toLowerCase().contains(query.toLowerCase())).toList();
  }
}
