import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_apps/bloc/get_news/get_news_bloc.dart';
import 'package:news_apps/detail_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Expanded(child: SingleChildScrollView(
        child: BlocBuilder<GetNewsBloc, GetNewsState>(
          builder: (context, state) {
            if (state is GetNewsError) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is GetNewsLaoding) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GetNewsLoaded) {
              final data = state.getAllNewsResponseModel.articles;
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailNews(
                                          article: data[index],
                                        )));
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(data[index].urlToImage ??
                                  'https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(data[index].title!),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                  'Created by: ${data[index].author ?? 'Anonymous'}'),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      }));
            }
            return const Center(
              child: Text('Initial'),
            );
          },
        ),
      ))),
    );
  }
}
