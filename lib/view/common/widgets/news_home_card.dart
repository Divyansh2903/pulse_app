import 'dart:math';

import 'package:attento_assignment/view/common/utils/timeAgo.dart';
import 'package:attento_assignment/view/constants/colors.dart';
import 'package:attento_assignment/view/constants/endpoints.dart';
import 'package:attento_assignment/view/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/news.dart';

class NewsHomeCard extends StatelessWidget {
  final Color cardColor;
  final Article article;
  final GestureTapCallback? onTap;
  const NewsHomeCard(
      {super.key,
      required this.cardColor,
        required this.article,
required this.onTap});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(20),
            height: ScreenUtil().screenHeight * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style:headingTextStyle,
                ),
                SizedBox(height: 8),
                Text(
                  timeAgo(article.publishedAt),
                  style: hintTextStyle,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16.sp,
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Published by',
                              style: lightHintTextStyle,
                            ),
                            SizedBox(
                              width: ScreenUtil().screenWidth * 0.6,
                              child: Text(
                                article.author??'Unknown',
                                style: lightHeadingTextStyle.copyWith(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  height: ScreenUtil().screenHeight * 0.22,
                  child: Text(
                    article.description,
                    style: lightHeadingTextStyle.copyWith(
                      color: Colors.black87,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding:  EdgeInsets.only(bottom: 10.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black12,
                          ),
                          padding: EdgeInsets.all(6),
                          child: Icon(Icons.thumb_up_outlined, color: Colors.brown)),
                      SizedBox(width: 16),
                      Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black12,
                          ),
                          padding: EdgeInsets.all(6),
                          child:
                              Icon(Icons.bookmark_add_outlined, color: Colors.brown)),
                      SizedBox(width: 16),
                      Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black12,
                          ),
                          padding: EdgeInsets.all(6),
                          child: Icon(Icons.ios_share_sharp, color: Colors.brown)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
