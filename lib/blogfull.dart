import 'package:blogapp/details.dart';
import 'package:flutter/material.dart';

class BlogFullPage extends StatefulWidget {
  BlogFullPage({Key? key, this.img, this.title, this.des}) : super(key: key);
  String? img, title, des;

  @override
  State<BlogFullPage> createState() => _BlogFullPageState();
}

class _BlogFullPageState extends State<BlogFullPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 250,
              leading: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const details(),
                      ));
                },
                child: const Icon(
                  Icons.home,
                  color: Colors.black,
                  size: 40,
                ),
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                    size: 40,
                  ),
                ),
              ],
              title: Row(
                children: [
                  SizedBox(
                      height: 180,
                      child: Image.asset(
                        "assets/images/logo.png",
                        fit: BoxFit.fill,
                      )),
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text('(${widget.title})',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12)),
                    ],
                  ),
                ],
              ),
              centerTitle: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Image.network(
                  "${widget.img}",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Text(
                    "${widget.title}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(color: Colors.black26, thickness: 2),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Written by: Md. Rakibul Hassan\nDate:31/8/2022",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${widget.des}',
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
