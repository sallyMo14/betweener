import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/models/search.dart';
import 'package:tt9_betweener_challenge/views/friend_profile.dart';

import '../controllers/follow_controller.dart';
import '../styles.dart';

class SearchView extends StatefulWidget {
  static String id = '/SearchView';

  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late Future<Search> fSearch;
  late String searchQuery = "";

  updateUI() {
    setState(() {
      fSearch = search();
    });
  }

  @override
  void initState() {
    updateUI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      hintText: "Search",
                      border: Styles.primaryRoundedOutlineInputBorder,
                      focusedBorder: Styles.primaryRoundedOutlineInputBorder,
                      errorBorder: Styles.primaryRoundedOutlineInputBorder,
                      enabledBorder: Styles.primaryRoundedOutlineInputBorder,
                      disabledBorder: Styles.primaryRoundedOutlineInputBorder,
                    ),
                    onFieldSubmitted: (value) {
                      setState(() {
                        searchQuery = value;
                        fSearch = search();
                      });
                    }),
              ),
              FutureBuilder(
                  future: fSearch,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (conext) {
                                return FreindProfile(
                                    user: snapshot.data!.users![index]);
                              }));
                            },
                            leading: Icon(Icons.person),
                            title:
                                Text(snapshot.data!.users![index].user!.name!),
                          );
                        },
                      );
                    }
                    return Center(
                      child: Text("No Results"),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future<Search> search() async {
    Map<String, dynamic> body = {'name': searchQuery};
    return searchByName(context, body);
  }
}
