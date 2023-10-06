// ignore: file_names
import 'dart:convert';

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

  // Future<void> _launchUrl(String url) async {
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url as Uri);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  final String appId = '6bab5ee9';
  final String appKey = 'ca133d2a2fa905d51c234a369df08f74';

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
            String chaaka = snapshot.error.toString();
            return Center(child: Text(chaaka));
          }

          final data = snapshot.data!;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Card(
                    elevation: 20,
                    child: SizedBox(
                      height: 160,
                      child: Image.asset(
                        'images/ban1.jpeg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 160,
                    child: Image.asset(
                      'images/ban2.jpeg',
                      fit: BoxFit.fill,
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

                        return recipecard(
                          label: recp,
                          image: img,
                        );
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () => () {
                      print("tapped");
                      _searchRecipes('Lunch');
                    },
                    child: const SizedBox(child: Text("hi")),
                  ),
                  box(link: imgs[0]),
                  box(link: imgs[2]),
                  box(link: imgs[3]),
                  box(link: imgs[4]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
