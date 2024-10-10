import 'package:e_commers_app/common/bloc/categories/categories_display_cubit.dart';
import 'package:e_commers_app/common/bloc/categories/categories_display_state.dart';
import 'package:e_commers_app/common/helpers/images/images_display_helper.dart';
import 'package:e_commers_app/domain/category/entities/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
      builder: (context, state) {
        if (state is CategoriesDisplayLoaded) {
          List<CategoryEntity> categories = state.categories;
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Categories',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text('See all', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 100,
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (contetx, index) {
                      return Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      ImagesDisplayHelper
                                          .generateCategoryImageURL(
                                              categories[index].image),
                                    ))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            categories[index].title,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14),
                          )
                        ],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 15),
                    itemCount: 5),
              )
            ],
          );
        } else if (state is LoadCategoryFailure) {
          return const Text('Ups we have an error getting the categories');
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
