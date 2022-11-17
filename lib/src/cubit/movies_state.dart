part of 'movies_cubit.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();
}

class MoviesInitial extends MoviesState {
  @override
  List<Object> get props => [];
}

class MoviesLoading extends MoviesState {
  @override
  List<Object> get props => [];
}

class MoviesLoadSuccess extends MoviesState {
  final List<Movies> movies;

  MoviesLoadSuccess(this.movies);

  @override
  List<Object> get props => [movies];
}

class MoviesLoadError extends MoviesState {
  final String errorMessage;
  MoviesLoadError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
