import 'package:flutter/material.dart';
import 'package:pracrestapi/controller/myapicontroller.dart';
import 'package:pracrestapi/model/MyApiModel.dart';

class MyApiPage extends StatefulWidget {
  const MyApiPage({super.key});

  @override
  State<MyApiPage> createState() => _MyApiPageState();
}

class _MyApiPageState extends State<MyApiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Api List"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<MyApiModel>(
              future: getApi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(snapshot.data!.data![index].shop!.name
                                  .toString()),
                              subtitle: Text(snapshot
                                  .data!.data![index].shop!.shopemail
                                  .toString()),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(snapshot
                                    .data!.data![index].shop!.image
                                    .toString()),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height * .3,
                                width: MediaQuery.of(context).size.width * 1,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot
                                        .data!.data![index].images!.length,
                                    itemBuilder: (context, position) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              .25,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .5,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(snapshot
                                                    .data!
                                                    .data![index]
                                                    .images![position]
                                                    .url
                                                    .toString())),
                                          ),
                                          child: Column(
                                            children: [
                                              Text(snapshot.data!.data![index]
                                                  .images![position].id
                                                  .toString()),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                            Icon(snapshot.data!.data![index].inWishlist == true
                                ? Icons.favorite
                                : Icons.favorite_outline)
                          ],
                        );

                        Text(index.toString());
                      });
                } else {
                  return const Center(
                    child: Column(
                      children: [CircularProgressIndicator(), Text("no data")],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
