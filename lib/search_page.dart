import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('Button 1'),
              buildButton('Button 2'),
              buildButton('Button 3'),
              buildButton('Button 4'),
              buildButton('Button 5'),
            ],
          ),
          _isSearching ? buildSearchBar() : Container(),
        ],
      ),
    );
  }

  Widget buildButton(String title) {
    return ElevatedButton(
      child: Text(title),
      onPressed: () {
        setState(() {
          _isSearching = true;
        });
      },
    );
  }

  Widget buildSearchBar() {
    return  Container(
      padding: const EdgeInsets.all(10),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
