import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../feature/home/provider/home_provider.dart';

class CitySearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              Navigator.pop(context);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox.shrink();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = context.read<HomeProvider>().listCity?.map((e) => e.cityName).toList();
    final citySuggestions = suggestions?.where((city) {
      final cityLower = city.toLowerCase();
      final queryLower = query.toLowerCase();
      return cityLower.startsWith(queryLower);
    }).toList();
    return buildSuggestionsSucces(citySuggestions ?? []);
  }

  Widget buildSuggestionsSucces(List<String?> cities) {
    return ListView.builder(
      itemCount: cities.length,
      itemBuilder: (BuildContext context, int index) {
        final suggestion = cities[index];
        return ListTile(
          onTap: () {
            query = suggestion ?? '';
            close(context, suggestion ?? '');
          },
          leading: const Icon(Icons.location_city_outlined),
          title: Text(suggestion ?? ''),
        );
      },
    );
  }
}
