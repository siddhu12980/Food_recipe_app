// ignore: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:third_proj2/key.dart';
import 'package:third_proj2/navbar.dart';
import 'package:third_proj2/recipe_card.dart';
import 'package:third_proj2/box.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController recepieName = TextEditingController();

  Future<void> _lunchurl(String url) async {
    String cleanedUrl = url;
    // Remove "http://" or "https://" if present
    if (cleanedUrl.startsWith('http://')) {
      cleanedUrl = cleanedUrl.substring(7);
    } else if (cleanedUrl.startsWith('https://')) {
      cleanedUrl = cleanedUrl.substring(8);
    }

    // Split the cleaned URL by '/'
    List<String> urlParts = cleanedUrl.split('/');

    // The first part will be the domain
    String domain = urlParts.isNotEmpty ? urlParts[0] : '';

    // The remaining parts will be the path/query parameters
    String remaining = urlParts.skip(1).join('/');

    final Uri uri = Uri(scheme: "http", host: domain, path: remaining);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Cannot Lunch url";
    }
  }

  Widget customSearchBar = const Text(
    'Recipe Book',
    style: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  );

  Icon customIcon = const Icon(
    Icons.search,
    size: 30,
  );

  List<String> imgs = <String>[
    'images/main.jpeg',
    'images/side.jpeg',
    'images/snack.jpeg',
    'images/rice.jpeg',
    'images/soup.jpeg',
  ];

  late Future<Map<String, dynamic>> recipe;

  Future<Map<String, dynamic>> fetchRecipes({String query = 'chicken'}) async {
// Sample query (I can change it)

    try {
      final url = Uri.parse(
          'https://api.edamam.com/api/recipes/v2?type=public&beta=true&q=$query&app_id=$appId&app_key=$appKey');
      // .replace(queryParameters: params);

      final res = await http.get(url);
      final data = jsonDecode(res.body);

      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    recipe = fetchRecipes();
  }

  // ignore: unused_element
  void _searchRecipes(String query) {
    setState(() {
      recipe = fetchRecipes(query: query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                setState(() {
                  if (customIcon.icon == Icons.search) {
                    customIcon = const Icon(Icons.cancel);
                    customSearchBar = ListTile(
                      leading: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 28,
                      ),
                      title: TextField(
                        decoration: const InputDecoration(
                          hintText: 'search for recepie',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        onSubmitted: (value) {
                          _searchRecipes(value);
                        },
                      ),
                    );
                  } else {
                    customIcon = const Icon(
                      Icons.search,
                      size: 30,
                    );
                    customSearchBar = const Text(
                      'Reciepe Book',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                });
              },
              icon: customIcon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                size: 30,
              ),
            ),
          ),
        ],

        title: customSearchBar,

        // centerTitle: true,
        // backgroundColor: const Color.fromARGB(255, 118, 231, 122),
      ),
      bottomNavigationBar: navbar(),
      body: FutureBuilder(
        future: recipe,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("connection error"));
          }

          final data = snapshot.data!;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Card(
                    elevation: 20,
                    child: GestureDetector(
                      onTap: () => _searchRecipes("trending"),
                      child: SizedBox(
                        height: 160,
                        child: Image.asset(
                          'images/ban1.jpeg',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _searchRecipes("Pizza"),
                    child: SizedBox(
                      height: 160,
                      child: Image.asset(
                        'images/ban2.jpeg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 255,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final recp = data['hits'][index]['recipe']['label'];
                        final img = data['hits'][index]['recipe']['image'];

                        return GestureDetector(
                          onTap: () =>
                              _lunchurl(data['hits'][index]['recipe']['url']),
                          child: recipecard(
                            label: recp,
                            image: img,
                          ),
                        );
                      },
                    ),
                  ),
                  GestureDetector(
                      onTap: () => _searchRecipes("lunch"),
                      child: box(link: imgs[0])),
                  GestureDetector(
                      onTap: () => _searchRecipes("snacks"),
                      child: box(link: imgs[2])),
                  GestureDetector(
                      onTap: () => _searchRecipes("Rice"),
                      child: box(link: imgs[3])),
                  GestureDetector(
                      onTap: () => _searchRecipes("soup"),
                      child: box(link: imgs[4])),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
