import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/widgets/news_item.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key,});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        var homeCubit = BlocProvider.of<HomeCubit>(context);
        if(state is GetNewsLoadingState){
          return Center(
            child: CircularProgressIndicator(color: Color(0xff171717)),
          );
        } else if(state is GetNewsErrorState){
          return Center(
            child: Text(
              'Get News Articles Error, ${state.errorMessage}, Try Again Later',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          );
        } else{
          return ListView.separated(
            itemBuilder: (context, index) =>
                NewsItem(articles: homeCubit.newsResponse!.articles![index]),
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: homeCubit.newsResponse?.articles?.length ?? 0,
          );
        }
      },
    );
  }
}
