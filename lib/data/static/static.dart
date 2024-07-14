import 'package:halago/core/constant/imageasset.dart';
import 'package:halago/data/models/onboardingmodel.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "Request Ride",
      body:
          "Request a ride get picked up by a \n nearby community driver",
      image: AppImageAsset.onBoardingImageOne),
  OnBoardingModel(
      title: "Confirm Your Driver",
      body:
          "Huge drivers network helps you find \n comforable, safe and cheep ride",
      image: AppImageAsset.onBoardingImageTwo ),
  OnBoardingModel(
      title: "Track your ride",
      body:
          "Know your driver in advance and be \n able to view current location in real time \n on the map ",
      image: AppImageAsset.onBoardingImageThree),
  // OnBoardingModel(
  //     title: "Fast Delivery",
  //     body:
  //         "We Have a 100k Product , Choose \n Your Product From Our E-commerce Shop",
  //     image: AppImageAsset.onBoardingImageFour),
];