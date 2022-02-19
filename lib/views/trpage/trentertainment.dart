import 'package:flutter/material.dart';
import 'package:newstr/components/api_service.dart';
import 'package:newstr/components/constants.dart';
import 'package:newstr/views/trpage/trbusiness.dart';
import 'package:newstr/views/trpage/trpage.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../components/api.dart';

class TrEntertainment extends StatefulWidget {
  const TrEntertainment({Key? key}) : super(key: key);

  @override
  State<TrEntertainment> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<TrEntertainment> {
  @override
  Widget build(BuildContext context) {
    Future<void> _refresh() {
      return Future.delayed(const Duration(milliseconds: 1300));
    }

    return Scaffold(
      drawer: Drawer(
        backgroundColor: draweColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                  child: Image.network(
                      "https://cdn.discordapp.com/attachments/752554614590668810/944181333893197824/newslogo.png")),
              DrawerListTile(
                title: "News",
                imgSrc: 'https://cdn-icons-png.flaticon.com/512/81/81460.png',
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                },
              ),
              DrawerListTile(
                title: "Business",
                imgSrc:
                    "https://cdn-icons-png.flaticon.com/512/2910/2910791.png",
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TrBusinessScreen()));
                },
              )
            ],
          ),
        ),
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            snap: true,
            floating: true,
            title: Row(
              children: [
                const Text(
                  "News",
                  style: TextStyle(fontSize: 20),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "TR-Entertainment",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            elevation: 0,
            backgroundColor: secondaryColor,
          )
        ],
        body: FutureBuilder<Welcome>(
          future: trentertainment(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return RefreshIndicator(
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                strokeWidth: 2,
                color: Colors.white,
                backgroundColor: bgColor,
                onRefresh: _refresh,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: snapshot.data!.articles.length,
                  itemBuilder: (context, index) =>
                      customListTile(snapshot.data!.articles[index]),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

Widget customListTile(Article articles) {
  void _launchURL() async {
    if (!await launch(articles.url)) throw 'Could not launch $articles.url';
  }

  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: secondaryColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            _launchURL();
          },
          child: Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    articles.urlToImage.toString(),
                  ),
                ),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          articles.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    ),
  );
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.imgSrc,
    required this.press,
  }) : super(key: key);

  final String title, imgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0,
      leading: Image.network(
        imgSrc,
        color: Colors.white,
        height: 21,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
