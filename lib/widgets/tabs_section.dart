import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/models/sources_response_model.dart';
import 'package:news_app/widgets/news_widget.dart';

class TabsSection extends StatefulWidget {
  const TabsSection({super.key, required this.categoryName});
  final String categoryName;

  @override
  State<TabsSection> createState() => _TabsSectionState();
}

class _TabsSectionState extends State<TabsSection> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponseModel>(
      future: ApiManager.getSources(categoryName: widget.categoryName),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Something Went Wrong, Try Again Later',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          );
        }
        return Column(
          children: [
            SizedBox(height: 15),
            DefaultTabController(
              initialIndex: selectedIndex,
              length:
              snapshot.data?.sources
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
                  if(index != selectedIndex){
                    selectedIndex = index;
                    setState(() {

                    });
                  }
                },
                tabs:
                snapshot.data?.sources
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
                child: NewsWidget(
                  sourceId: snapshot.data?.sources?[selectedIndex].id ?? '',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
