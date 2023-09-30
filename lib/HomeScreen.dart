// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //  late Future<Map<String, dynamic>> weather; - we are creating somthing like a var

  late Future<Map<String, dynamic>> recipe;

  final String appId = '6bab5ee9';
  final String appKey = 'ca133d2a2fa905d51c234a369df08f74';
  final String query = 'chicken';

  Future<Map<String, dynamic>> fetchRecipes() async {
// Sample query (I can change it)

    try {
      final url = Uri.parse(
          'https://api.edamam.com/api/recipes/v2?type=public&beta=true&q=chicken&app_id=6bab5ee9&app_key=ca133d2a2fa905d51c234a369df08f74');
      // .replace(queryParameters: params);

      final res = await http.get(url);
      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw " unexpected error";
      }
      print(data);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                print("hi");
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                print("searching");
              },
              icon: const Icon(
                Icons.person,
                size: 30,
              ),
            ),
          ),
        ],

        title: const Text(
          "Reciepe Book",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        // centerTitle: true,
        // backgroundColor: const Color.fromARGB(255, 118, 231, 122),
      ),
      body: FutureBuilder(
        future: recipe,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return const Center(child: (Text("Server Error")));
          }

          final data = snapshot.data!;
          final recp = data['hits'][1]["recipe"]["label"];

          return Center(
            //////////////////////////////////////////////
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  const Placeholder(
                    fallbackHeight: 80,
                  ),
                  Text(recp),
                  // const SizedBox(
                  //   height: 30,
                  // ),
                  // const Placeholder(
                  //   fallbackHeight: 80,
                  // ),

                  // const SizedBox(
                  //   height: 30,
                  // ),
                  // const Placeholder(
                  //   fallbackHeight: 120,
                  // ),

                  //  TextField()

                  // const Placeholder(
                  //   fallbackHeight: 160,
                  // ),

                  // const Placeholder(
                  //   fallbackHeight: 160,
                  // ),
                  // const Placeholder(
                  //   fallbackHeight: 160,
                  // ),
                  // const Placeholder(
                  //   fallbackHeight: 160,
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
