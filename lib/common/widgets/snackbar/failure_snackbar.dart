import 'package:e_commers_app/core/configs/assets/app_images.dart';
import 'package:flutter/material.dart';

class FailureSnackbar {
  static SnackBar getSnackBar(BuildContext context, String title) {
    return SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0XFFC72C41),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 48,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Oh snap!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
                child: Image.asset(
                  AppImages.bubblesSnackbar,
                  height: 50,
                  width: 48,
                  // ignore: deprecated_member_use
                  color: const Color(0XFF801336),
                ),
              ),
            ),
            Positioned(
                top: -15,
                left: 10,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      AppImages.bubbleCharSnackbar,
                      height: 40,
                    ),
                    Positioned(
                      top: 10,
                      child: Image.asset(
                        AppImages.closeSnackbar,
                        height: 16,
                      ),
                    ),
                  ],
                ))
          ],
        ));
  }
}
