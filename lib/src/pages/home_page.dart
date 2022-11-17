import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proform3/src/cubit/movies_cubit.dart';
import 'package:proform3/src/models/movies.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesCubit()..getAllMovies(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("TVMAZE"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            if (state is MoviesLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is MoviesLoadSuccess) {
              return _buildMoviesUI(state.movies);
            } else if (state is MoviesLoadError) {
              return Text(state.errorMessage);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  _buildMoviesUI(List<Movies> movies) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          Movies item = movies[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(item.image.toString()),
            ),
            title: Text(item.name.toString()),
            subtitle: Text(item.summary.toString()),
          );
        });
  }
}
