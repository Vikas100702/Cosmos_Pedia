import 'package:cosmos_pedia/cosmospedia/utils/constants.dart';

class ApodEndpoints{
  static String? demoKey = ApiKey.demoKey;
  static String apodBaseUrl = "https://api.nasa.gov/planetary/apod?demo_key=$demoKey";
  static String count = "&count";
  static String startDate = "&start_date";
  static String endDate = "&end_date";
}