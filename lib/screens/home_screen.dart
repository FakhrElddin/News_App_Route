import 'package:flutter/material.dart';
import 'package:news_app/widgets/app_drawer.dart';
import 'package:news_app/widgets/categories_section.dart';
import 'package:news_app/widgets/tabs_section.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  static const String routeName = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        onBack: onBack,
      ),
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          selectedCategory ?? "Home",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: selectedCategory == null
          ? CategoriesSection(
        onCategoryClicked: onCategoryClicked,
      )
          : TabsSection(
        categoryName: selectedCategory!,
      ),
    );
  }
  String? selectedCategory;
  void onCategoryClicked(String categoryName){
    selectedCategory = categoryName;
    setState(() {});
  }
  void onBack(){
    Navigator.pop(context);
    if(selectedCategory != null){
      selectedCategory = null;
      setState(() {});
    }
  }
}

