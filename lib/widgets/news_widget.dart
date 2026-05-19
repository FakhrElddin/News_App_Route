import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/widgets/news_item.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key,});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if(state is GetNewsErrorState){
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                'Something Went Wrong',
                style: TextStyle(
                  color: Color(0xff171717),
                ),
              ),
              content: Text(
                state.errorMessage!,
                style: TextStyle(
                  color: Color(0xff171717),
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: Color(0xff171717),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        var homeCubit = BlocProvider.of<HomeCubit>(context);
        if(state is GetNewsLoadingState){
          return Center(
            child: CircularProgressIndicator(color: Color(0xff171717)),
          );
        }
        return ListView.separated(
            itemBuilder: (context, index) =>
                NewsItem(articles: homeCubit.newsResponse!.articles![index]),
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: homeCubit.newsResponse?.articles?.length ?? 0,
          );
      },
    );
  }
}
