import 'package:flutter/material.dart';
import 'package:frino_icons/frino_icons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nice_fit/consts/colors.dart';
import 'package:nice_fit/models/active.dart';
import 'package:nice_fit/models/activity.dart';
import 'package:nice_fit/models/ads.dart';
import 'package:nice_fit/models/exercises.dart';
import 'package:nice_fit/models/tutorial.dart';
import 'package:nice_fit/models/video.dart';
import 'package:circular_bottom_navigation/tab_item.dart';

List<Ads> adsList = [
  Ads(
      title: "آرامش مطلق\n با تمرینات یوگــا",
      imageUrl: "https://s8.uupload.ir/files/5_75n.jpg"),
  Ads(
      title: "ورزش هوشمندانه \n با نایـس فیتــ",
      imageUrl: "https://s8.uupload.ir/files/6_eoig.jpg"),
  Ads(
      title: "یک رژیم غذایی\n سالم و خوشمزه",
      imageUrl: "https://s2.uupload.ir/files/23_mmk.jpg"),
  Ads(
      title: "مرز باریک بین\n واقعیت و رویا",
      imageUrl: "https://s8.uupload.ir/files/3_abbp.jpg")
];

List<Activity> activityList = [
  Activity(
      color: Colors.deepPurpleAccent.shade700,
      title: "قدم ها",
      status: "2 روز پیش",
      icon: FrinoIcons.f_forward,
      count: 8854,
      manxCount: 10000,
      unit: ""),
  Activity(
      color: Colors.orange,
      title: "تمرینات",
      status: "25 دقیقه پیش",
      icon: FrinoIcons.f_gym,
      count: 2.1,
      manxCount: 5,
      unit: "ساعت"),
  Activity(
      color: Colors.red,
      title: "ضربان قلب",
      status: "3 ساعت پیش",
      icon: Iconsax.heart_tick5,
      count: 102,
      manxCount: 200,
      unit: "BPM")
];

List<Tutorial> tutorialList = [
  Tutorial(
      title: "تمرینــات با توپــ",
      minsVideo: 70,
      countVideos: 8,
      imageUrl: "https://s8.uupload.ir/files/4_mi8u.jpg",
      content:
          "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگره تکنولو در شصت و سه درصد گذشته حال و آینده"),
  Tutorial(
      title: "آمــوزش یوگــا",
      minsVideo: 200,
      countVideos: 12,
      imageUrl: "https://s8.uupload.ir/files/9_91qw.jpg",
      content:
          "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگره تکنولو در شصت و سه درصد گذشته حال و آینده"),
  Tutorial(
      title: "درآوردن سیکــس پـک",
      minsVideo: 120,
      countVideos: 17,
      imageUrl: "https://s8.uupload.ir/files/8_hsqw.jpg",
      content:
          "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگره تکنولو در شصت و سه درصد گذشته حال و آینده"),
];

List<Video> videoList = [
  Video(
      imageUrl: "https://s8.uupload.ir/files/9_91qw.jpg",
      title: "مقدماتی 1",
      coach: "اردوان اسکندری",
      time: "10:32"),
  Video(
      imageUrl: "https://s8.uupload.ir/files/12_9k1l.jpg",
      title: "مقدماتی 2",
      coach: "اردوان اسکندری",
      time: "20:12"),
  Video(
      imageUrl: "https://s8.uupload.ir/files/13_q9qs.jpg",
      title: "مقدماتی 3",
      coach: "اردوان اسکندری",
      time: "30:00"),
  Video(
      imageUrl: "https://s8.uupload.ir/files/11_6zt.jpg",
      title: "مقدماتی 4",
      coach: "اردوان اسکندری",
      time: "10:32"),
  Video(
      imageUrl: "https://s8.uupload.ir/files/10_0fad.jpg",
      title: "مقدماتی 5",
      coach: "اردوان اسکندری",
      time: "12:32"),
  Video(
      imageUrl: "https://s8.uupload.ir/files/9_91qw.jpg",
      title: "مقدماتی 1",
      coach: "اردوان اسکندری",
      time: "10:32"),
  Video(
      imageUrl: "https://s8.uupload.ir/files/12_9k1l.jpg",
      title: "مقدماتی 2",
      coach: "اردوان اسکندری",
      time: "20:12"),
  Video(
      imageUrl: "https://s8.uupload.ir/files/13_q9qs.jpg",
      title: "مقدماتی 3",
      coach: "اردوان اسکندری",
      time: "30:00"),
  Video(
      imageUrl: "https://s8.uupload.ir/files/11_6zt.jpg",
      title: "مقدماتی 4",
      coach: "اردوان اسکندری",
      time: "10:32"),
  Video(
      imageUrl: "https://s8.uupload.ir/files/10_0fad.jpg",
      title: "مقدماتی 5",
      coach: "اردوان اسکندری",
      time: "12:32"),
];

List<TabItem> tabItems = List.of([
  TabItem(Iconsax.home_15, "Home", AppSolidColors.primary,
      labelStyle: TextStyle(color: AppSolidColors.primary)),
  TabItem(FrinoIcons.f_gym, "Activity", AppSolidColors.primary,
      labelStyle: TextStyle(color: AppSolidColors.primary)),
  TabItem(Iconsax.record_circle5, "Record", AppSolidColors.primary,
      labelStyle: TextStyle(color: AppSolidColors.primary)),
  TabItem(FrinoIcons.f_female, "Account", AppSolidColors.primary,
      labelStyle: TextStyle(color: AppSolidColors.primary)),
]);


List<Exercises> exercisesList=[
  Exercises(title: "ABS",imageUrl: 'https://s8.uupload.ir/files/36_2rz6.jpg'),
  Exercises(title: "CrossFit",imageUrl: 'https://s8.uupload.ir/files/28_4b8u.jpg'),
  Exercises(title: "Karate",imageUrl:'https://s8.uupload.ir/files/40_93nu.jpg'),
  Exercises(title: "Trx",imageUrl: 'https://s8.uupload.ir/files/27_q133.jpg'),
  Exercises(title: "Yoga",imageUrl: 'https://s8.uupload.ir/files/34_75ai.jpg'),
  Exercises(title: "Zumba",imageUrl:'https://s8.uupload.ir/files/26_8np6.jpg'),
  Exercises(title: "Boxing",imageUrl: 'https://s8.uupload.ir/files/32_4gqe.jpg'),
  Exercises(title: "CX Worx",imageUrl: 'https://s8.uupload.ir/files/30_6oba.jpg'),
  Exercises(title: "Running",imageUrl: 'https://s8.uupload.ir/files/29_mpxo.jpg'),
  Exercises(title: "Gym",imageUrl:'https://s8.uupload.ir/files/31_bg3y.jpg'),
];

List<Active> activeList=[
  Active(title: "CrossFit",count: 8,maxCount: 18,isFirst: true),
  Active(title: "ABS",count: 2,maxCount: 15),
  Active(title: "CX Worx",count: 14,maxCount: 15),
];
