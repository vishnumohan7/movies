import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:proform3/src/cubit/movies_repository.dart';
import 'package:proform3/src/models/api_response_model.dart';
import 'package:proform3/src/models/movies.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesInitial());

  MoviesRepository _repository = MoviesRepository();

  getAllMovies() async {
    emit(MoviesLoading());
    try {
      ApiResponseModel response = await _repository.getAllMovies();
      if (response.status) {
        List<Movies> movies =
            response.data.map<Movies>((e) => Movies.fromJson(e)).toList();
        emit(MoviesLoadSuccess(movies));
      } else {
        emit(MoviesLoadError("errorMessage"));
      }
    } catch (ex) {
      emit(MoviesLoadError("errorMessage"));
    }
  }
}
