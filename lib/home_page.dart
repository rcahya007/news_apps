import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_apps/bloc/get_news/bloc/get_news_bloc_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<GetNewsBlocBloc, GetNewsBlocState>(
                  builder: (context, state) {
                    if (state is GetNewsBlocError) {
                      return Center(
                        child: Text(state.massage),
                      );
                    }
                    if (state is GetNewsBlocLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is GetNewsBlocLoaded) {
                      return Center(
                        child: Text(state.data.totalResults.toString()),
                      );
                    }
                    return const Center(
                      child: Text('Initial'),
                    );
                  },
                )
              ],
            ),
          ))
        ],
      )),
    );
  }
}
