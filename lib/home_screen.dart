import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:kofuko_test/fetchdata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController countController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Data"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: countController,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  count = countController.text;
                  countController.clear();
                  log(count.toString());
                  setState(() {});
                },
                child: const Text("Get data"),
              ),
              FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: int.parse(count),
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            child: Image.network(
                                snapshot.data!.results[index].picture.medium),
                          ),
                          title: Row(
                            children: [
                              Text(snapshot.data!.results[index].name.first),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(snapshot.data!.results[index].name.last),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
