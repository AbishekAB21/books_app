import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<FetchBooksEvent>((event, emit) async {
      emit(HomeScreenLoading());

      try {
        final String apiKey = 'AIzaSyCNX90qklU7TCuozS-LoLmX4OwvSPyg9Bs';
        final String url = 'https://www.googleapis.com/books/v1/volumes?q=book&maxResults=40&key=$apiKey';


        final response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          final List<Map<String, String>> books = [];

          for (var item in data['items']) {
            books.add({
              'title': item['volumeInfo']['title'] ?? 'No Title',
              'author': (item['volumeInfo']['authors'] != null)
                  ? item['volumeInfo']['authors'].join(', ')
                  : 'Unknown Author',
              'price': '₹399',
              'image': item['volumeInfo']['imageLinks']?['thumbnail'] ?? 'default_image_url',
              'description': item['volumeInfo']['description'] ?? 'No description available',
            });
          }
          emit(HomeScreenLoaded(books));
        } else {
          emit(HomeScreenError('Failed to fetch books'));
        }
      } catch (e) {
        emit(HomeScreenError(e.toString()));
      }
    });

   on<SearchBooksEvent>((event, emit) async {
  emit(HomeScreenLoading());

  try {
    final String apiKey = 'AIzaSyCNX90qklU7TCuozS-LoLmX4OwvSPyg9Bs'; 
    final String url = 'https://www.googleapis.com/books/v1/volumes?q=${event.query}&maxResults=40&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Map<String, String>> books = [];

      for (var item in data['items']) {
        books.add({
          'title': item['volumeInfo']['title'] ?? 'No Title',
          'author': (item['volumeInfo']['authors'] != null)
              ? item['volumeInfo']['authors'].join(', ')
              : 'Unknown Author',
          'price': '₹399', // Google Books API does not provide book prices
          'image': item['volumeInfo']['imageLinks']?['thumbnail'] ?? 'default_image_url',
          'description': item['volumeInfo']['description'] ?? 'No description available',
        });
      }
      emit(HomeScreenLoaded(books));
    } else {
      emit(HomeScreenError('Failed to fetch books'));
    }
  } catch (e) {
    emit(HomeScreenError(e.toString()));
  }
});

  }
}
