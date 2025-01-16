import 'package:attento_assignment/models/news.dart';
import 'package:attento_assignment/view/common/utils/timeAgo.dart';
import 'package:attento_assignment/view/constants/colors.dart';
import 'package:attento_assignment/view/constants/textstyles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsDetailView extends StatelessWidget {
  final Article article;
  final Color bgColor;
  const NewsDetailView(
      {super.key, required this.article, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        toolbarHeight: 45.h,
        surfaceTintColor: bgColor,
        backgroundColor: bgColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColors.backgroundColor,
        ),
        leading: Container(

          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black12,
          ),
          padding: EdgeInsets.all(3),
          margin: EdgeInsets.all(5),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(Icons.arrow_back_rounded,size: 20.sp,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: headingTextStyle.copyWith(fontSize: 25.sp),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    timeAgo(article.publishedAt),
                    style: hintTextStyle,
                  ),
                  SizedBox(height: 30.h),
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
                              article.author ?? 'Unknown',
                              style: lightHeadingTextStyle.copyWith(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    article.description,
                    style: lightHeadingTextStyle.copyWith(
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 20.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: article.urlToImage ?? '',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200.h,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  SizedBox(
                    width: double.infinity,
                    height: ScreenUtil().setHeight(48),
                    child: ElevatedButton(
                      onPressed:()=> _launchUrl(article.url),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.backgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Read More",
                              style: lightHeadingTextStyle.copyWith(
                                  color: Colors.white)),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 15.sp,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _launchUrl(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
