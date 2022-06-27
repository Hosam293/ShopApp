import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/cubit/AppCubit/AppCubit.dart';
import 'package:shopapp/cubit/AppCubit/AppStates.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<AppCubit>(context);

        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,

            body: ListView.separated(

              physics: BouncingScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 150,
                  padding: EdgeInsetsDirectional.all(10),
                  child: Row(
                    children: [
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Image(
                            image: NetworkImage(
                                '${cubit.categoryModel!.data!.data[index].image}'),
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
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
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${cubit.categoryModel!.data!.data[index].name}',
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20,height: 1.1),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  '${cubit.homeModel!.data!.products[index].price}',
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                if (cubit.homeModel!.data!
                                    .products[index].discount !=
                                    0)
                                  Text(
                                    '${cubit.homeModel!.data!.products[index].oldPrice}',
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12,decoration: TextDecoration.lineThrough),
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
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }, itemCount: cubit.categoryModel!.data!.data.length,
            ));
      },
    );
  }
}
