import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../helpers/api_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key,required this.videoLink}) : super(key: key);

  final videoLink;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();

  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  loadvideo() async {
    videoPlayerController = VideoPlayerController.asset(widget.videoLink);
    // videoPlayerController = VideoPlayerController.asset(currentdate["url"]);
    await videoPlayerController.initialize();
    setState(() {});
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoInitialize: true,
      autoPlay: false,
      aspectRatio: 16 / 9,
    );
  }

  @override
  void initState() {
    super.initState();
    loadvideo();
    chewieController =
        ChewieController(videoPlayerController: videoPlayerController);
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("youtube"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Row(
      //           children: [
      //             SizedBox(width: 10),
      //             Expanded(
      //               flex: 10,
      //               child: Container(
      //                 height: 50,
      //                 child: TextField(
      //                   controller: searchController,
      //                   decoration: const InputDecoration(
      //                     hintText: "Search by video Name...",
      //                     focusedBorder: OutlineInputBorder(
      //                       borderRadius: BorderRadius.all(Radius.circular(40),),
      //                       borderSide:
      //                       BorderSide(width: 2, color: Colors.black54),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             Expanded(
      //               flex: 1,
      //               child: IconButton(
      //                 icon: const Icon(Icons.search),
      //                 onPressed: () {
      //                   String searchedCity = searchController.text;
      //                   setState(() {
      //                     // getData = APIHelper.apiHelper
      //                     //     .fetchWeatherData(city: searchedCity);
      //                   });
      //                 },
      //               ),
      //             ),
      //           ],
      //         ),
      //
      //       ),
      //     // Container(
      //     //   child: Column(
      //     //     children: [
      //     //       Row(
      //     //         children: [
      //     //           Padding(
      //     //             padding: const EdgeInsets.all(8.0),
      //     //             child: Container(
      //     //               height: 150,
      //     //               width: 165,
      //     //               decoration: BoxDecoration(color: Colors.black12),
      //     //             ),
      //     //           ),
      //     //           SizedBox(width: 5),
      //     //           Container(
      //     //             height: 150,
      //     //             width: 165,
      //     //             decoration: BoxDecoration(color: Colors.black12),
      //     //           ),
      //     //         ],
      //     //       ),
      //     //       Row(
      //     //         children: [
      //     //           Padding(
      //     //             padding: const EdgeInsets.all(8.0),
      //     //             child: Container(
      //     //               height: 150,
      //     //               width: 165,
      //     //               decoration: BoxDecoration(color: Colors.black12),
      //     //             ),
      //     //           ),
      //     //           SizedBox(width: 5),
      //     //           Container(
      //     //             height: 150,
      //     //             width: 165,
      //     //             decoration: BoxDecoration(color: Colors.black12),
      //     //           ),
      //     //         ],
      //     //       ),
      //     //       Row(
      //     //         children: [
      //     //           Padding(
      //     //             padding: const EdgeInsets.all(8.0),
      //     //             child: Container(
      //     //               height: 150,
      //     //               width: 165,
      //     //               decoration: BoxDecoration(color: Colors.black12),
      //     //             ),
      //     //           ),
      //     //           SizedBox(width: 5),
      //     //           Container(
      //     //             height: 150,
      //     //             width: 165,
      //     //             decoration: BoxDecoration(color: Colors.black12),
      //     //           ),
      //     //         ],
      //     //       ),
      //     //       Row(
      //     //         children: [
      //     //           Padding(
      //     //             padding: const EdgeInsets.all(8.0),
      //     //             child: Container(
      //     //               height: 150,
      //     //               width: 165,
      //     //               decoration: BoxDecoration(color: Colors.black12),
      //     //             ),
      //     //           ),
      //     //           SizedBox(width: 5),
      //     //           Container(
      //     //             height: 150,
      //     //             width: 165,
      //     //             decoration: BoxDecoration(color: Colors.black12),
      //     //           ),
      //     //         ],
      //     //       ),
      //     //       Row(
      //     //         children: [
      //     //           Padding(
      //     //             padding: const EdgeInsets.all(8.0),
      //     //             child: Container(
      //     //               height: 150,
      //     //               width: 165,
      //     //               decoration: BoxDecoration(color: Colors.black12),
      //     //             ),
      //     //           ),
      //     //           SizedBox(width: 5),
      //     //           Container(
      //     //             height: 150,
      //     //             width: 165,
      //     //             decoration: BoxDecoration(color: Colors.black12),
      //     //           ),
      //     //         ],
      //     //       ),
      //     //     ],
      //     //   ),
      //     // ),
      //     ],
      //   ),
      // ),
      body: CustomScrollView(
        slivers: [
          AppBar(),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                    (context, index) {
                  return FutureBuilder(
                    future:
                    YouTubeAPIHelper.postAPIHelper.fetchingMultipleData(search: "songs"),
                    builder: (context, snapshot) {
                      List? data = snapshot.data;
                      if (snapshot.hasData) {
                        return SizedBox(
                          height: 740,
                          child: ListView.builder(
                            itemCount: data!.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){
                               //   Navigator.push(
                               //      context,
                              //      MaterialPageRoute(builder: (context) => PlayVideo(url: data![index].userId,)),
                              //     );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image(
                                      image: NetworkImage(data![index].videoId),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[index].title,
                                            maxLines: 2,
                                            style: const TextStyle(
                                              color: Colors.white70,
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(data[index].chanelTitle),
                                              const Spacer(),
                                              GestureDetector(
                                                onTap: () {},
                                                child: const Icon(Icons.more_vert,
                                                    size: 20.0),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text("${snapshot.error}"),
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
