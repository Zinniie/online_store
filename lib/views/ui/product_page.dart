import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            leadingWidth: 0,
            title: Padding(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: null,
                    child: Icon(
                      AntDesign.close,
                    ),
                  ),
                  GestureDetector(
                    onTap: null,
                    child: Icon(
                      Ionicons.ellipsis_horizontal,
                    ),
                  ),
                ],
              ),
            ),
            pinned: true,
            snap: false,
            floating: true,
            backgroundColor: Colors.transparent,
            expandedHeight: MediaQuery.of(context).size.height,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        controller: pageController,
                        onPageChanged: (page) {},
                        itemBuilder: (context, int index) {
                          return Stack(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.39,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.grey.shade300,
                                // child: CachedNetworkImage(
                                //   imageUrl: imageUrl,
                                //   fit: BoxFit.contain,
                                // ),
                              ),
                              Positioned(
                                  top:
                                      MediaQuery.of(context).size.height * 0.09,
                                  right: 20,
                                  child: Icon(
                                    AntDesign.hearto,
                                    color: Colors.grey,
                                  )),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List<Widget>.generate(
                                        1,
                                        (index) => Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 4,
                                              ),
                                              child: CircleAvatar(
                                                radius: 5,
                                                backgroundColor: Colors.grey,
                                              ),
                                            )),
                                  ))
                            ],
                          );
                        }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
