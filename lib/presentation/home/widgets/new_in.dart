import 'package:e_commers_app/presentation/home/bloc/new_products/new_product_display_cubit.dart';
import 'package:e_commers_app/presentation/home/bloc/new_products/new_product_display_state.dart';
import 'package:e_commers_app/common/widgets/widgets.dart';
import 'package:e_commers_app/core/theme/app_colors.dart';
import 'package:e_commers_app/domain/product/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewIn extends StatelessWidget {
  const NewIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewProductDisplayCubit, NewProductDisplayState>(
      builder: (context, state) {
        if (state is NewProductLoaded) {
          final List<ProductEntity> products = state.newProducts;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'New in',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.primary),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 300,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        productEntity: products[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                    itemCount: products.length),
              )
            ],
          );
        } else if (state is LoadProductsFailure) {
          return const Center(
              child: Text('Ups we have an error getting the new products'));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
