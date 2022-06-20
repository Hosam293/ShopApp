import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/cubit/AppCubit/AppCubit.dart';
import 'package:shopapp/cubit/AppCubit/AppStates.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<AppCubit>(context);
        return ConditionalBuilder(
          condition: cubit.homeModel != null && cubit.categoryModel != null,
          builder: (context) {
            return SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                        items: cubit.homeModel!.data!.banners.map((e) {
                          print('eeeeeeeeeeeeeeeeeeee${e.image}');
                          return Image(
                            image: NetworkImage('${e.image}'),
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        }).toList(),
                        options: CarouselOptions(
                            height: 250,
                            autoPlay: true,
                            viewportFraction: 1.0,
                            autoPlayAnimationDuration: Duration(seconds: 1),
                            autoPlayInterval: Duration(seconds: 3),
                            enableInfiniteScroll: true,
                            reverse: false,
                            initialPage: 0,
                            scrollDirection: Axis.horizontal,
                            autoPlayCurve: Curves.fastOutSlowIn),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Products',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 120,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                            width: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Image(
                                    image: NetworkImage(
                                        '${cubit.categoryModel!.data!.data[index].image}'),
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    padding: EdgeInsetsDirectional.all(5),
                                    width: 120,
                                    color: Colors.black.withOpacity(.6),
                                    child: Text(
                                      '${cubit.categoryModel!.data!.data[index].name}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount: cubit.categoryModel!.data!.data.length,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Category',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 1.0,
                        mainAxisSpacing: 1.0,
                        childAspectRatio: 1 / 1.64,
                        children: List.generate(
                            cubit.homeModel!.data!.products.length, (index) {
                          return Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Image(
                                    image: NetworkImage(
                                        '${cubit.homeModel!.data!.products[index].image}'),
                                    height: 200,
                                    width: double.infinity,
                                  ),
                                  if (cubit.homeModel!.data!.products[index]
                                          .discount !=
                                      0)
                                    Container(
                                      padding: EdgeInsetsDirectional.all(8),
                                      color: Colors.red,
                                      child: Text(
                                        'DISCOUNT',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    )
                                ],
                              ),
                              Container(
                                padding: EdgeInsetsDirectional.all(8),
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${cubit.homeModel!.data!.products[index].name}',
                                      style: TextStyle(
                                        height: 1.1,
                                        fontSize: 14,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${cubit.homeModel!.data!.products[index].price}',
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.blue),
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        if (cubit.homeModel!.data!
                                                .products[index].discount !=
                                            0)
                                          Text(
                                            '${cubit.homeModel!.data!.products[index].oldPrice}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                        Spacer(),
                                        IconButton(
                                            onPressed: () {},
                                            icon: CircleAvatar(
                                                radius: 15,
                                                backgroundColor:
                                                         Colors.grey,
                                                child: Icon(
                                                  Icons
                                                      .favorite_outline_rounded,
                                                  color: Colors.white,
                                                  size: 14,
                                                ))),
                                        Container()
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
