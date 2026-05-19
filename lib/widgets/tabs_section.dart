import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/widgets/news_widget.dart';

class TabsSection extends StatelessWidget {
  const TabsSection({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {


    return BlocProvider(
      create: (context) => HomeCubit()..getSources(categoryName: categoryName),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          var homeCubit = BlocProvider.of<HomeCubit>(context);
          if(state is GetSourcesLoadingState){
            return Center(
                child: CircularProgressIndicator(
                  color: Color(0xff171717),
                ),
            );
          } else if(state is GetSourcesErrorState || state is GetNewsErrorState){
              return Center(
                child: Text(
                  'Something Went Wrong, ${state.errorMessage}, Try Again Later',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              );
          } else{
            return Column(
              children: [
                SizedBox(height: 15),
                DefaultTabController(
                  initialIndex: homeCubit.selectedIndex,
                  length:
                  homeCubit.sourcesResponse?.sources
                      ?.where((source) => source.name != null)
                      .length ??
                      0,
                  child: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    indicatorColor: Color(0xff171717),
                    labelStyle: TextStyle(
                      color: Color(0xff171717),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    labelPadding: EdgeInsets.symmetric(horizontal: 8),
                    padding: EdgeInsets.only(left: 8),
                    dividerColor: Colors.transparent,
                    onTap: (index) {
                      if (index != homeCubit.selectedIndex) {
                        homeCubit.changeSelectedTab(index: index);
                      }
                    },
                    tabs:
                    homeCubit.sourcesResponse?.sources
                        ?.where((source) => source.name != null)
                        .map((source) => Tab(text: source.name!,))
                        .toList() ??
                        [],
                  ),
                ),
                SizedBox(height: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: NewsWidget(),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
