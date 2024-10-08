import 'package:e_commers_app/common/widgets/widgets.dart';
import 'package:e_commers_app/domain/product/entities/product_entity.dart';
import 'package:e_commers_app/presentation/home/bloc/top_sellings/top_selling_product_display_cubit.dart';
import 'package:e_commers_app/presentation/home/bloc/top_sellings/top_selling_product_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopSellings extends StatelessWidget {
  const TopSellings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopSellingProductDisplayCubit,
        TopSellingProductDisplayState>(
      builder: (context, state) {
        if (state is TopSellingProductLoaded) {
          final List<ProductEntity> products = state.topSellings;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Top Selling',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
        } else if (state is LoadTopSellingProductsFailure) {
          return const Center(
              child: Text('Ups we have an error getting the top sellings'));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
