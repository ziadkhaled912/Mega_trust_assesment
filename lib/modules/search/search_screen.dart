import 'package:flutter/material.dart';
import '../../shared/components/services/validators.dart';
import 'default_app_search_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DefaultAppSearchBar(
            controller: searchController,
            validation: (value) => Validators.defaultValidation(value),
            onPressed: () {},
            hint: 'search',
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
