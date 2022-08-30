import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Stream<QuerySnapshot> _madStream =
      FirebaseFirestore.instance.collection('mad').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _madStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              const Center(child: Text('error'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    elevation: 10,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.blue,
                                child: Text(
                                  "${data['title'][0]}",
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                              Text(
                                "${data['title']}",
                                style: const TextStyle(color: Colors.black),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.arrow_forward_ios)),
                            ],
                          ),
                          Image.network(data['image']),
                          Text(
                            "${data['des']}",
                            maxLines: 10,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
