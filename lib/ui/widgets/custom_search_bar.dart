import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../antioquia_bookstore.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, required this.mainProvider});
  final MainProvider mainProvider;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final List<String> _suggestions = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchAnchor(
        isFullScreen: false,
        viewConstraints: const BoxConstraints(
          minHeight: kToolbarHeight,
          maxHeight: kToolbarHeight * 6,
        ),
        builder: (BuildContext context, SearchController controller) {
          return SearchBar(
            controller: controller,
            padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry?>(
                (states) {
              return const EdgeInsets.symmetric(horizontal: 16.0);
            }),
            onTap: () {
              controller.openView();
            },
            onSubmitted: (event) {
              setState(() {
                controller.closeView;
                _onSearch(controller.text);
              });
            },
            leading: const Icon(Icons.search),
            trailing: <Widget>[
              Tooltip(
                message: 'Search',
                child: IconButton(
                  isSelected: widget.mainProvider.isDark,
                  onPressed: () {
                    setState(() {
                      widget.mainProvider.toggleTheme();
                    });
                  },
                  icon: const Icon(Icons.wb_sunny_outlined),
                  selectedIcon: const Icon(Icons.brightness_2_outlined),
                ),
              )
            ],
          );
        },
        suggestionsBuilder:
            (BuildContext context, SearchController controller) {
          return List<ListTile>.generate(_suggestions.length, (int index) {
            final String item = _suggestions.reversed.toList()[index];
            return ListTile(
              title: Text(item),
              onTap: () {
                setState(() {
                  controller.closeView(item);
                  _onSearch(item);
                });
              },
            );
          });
        },
      ),
    );
  }

  void _onSearch(String search) {
    if (search.trim() != '') {
      _suggestions.add(search);
      if (_suggestions.length > 5) {
        _suggestions.removeAt(0);
      }
    }
    Provider.of<BooksProvider>(context, listen: false).getBooks(search: search);
  }
}
