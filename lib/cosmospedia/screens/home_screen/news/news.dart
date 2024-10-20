/*
import 'package:cosmos_pedia/cosmospedia/get_api/apod_api/apod_endpoints/apod_endpoints.dart';
import 'package:cosmos_pedia/cosmospedia/models/apod_model/apod_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {

  late Future<List<NasaApodModel>> futureApods;
  final Dio _dio = Dio();

  final startDate = "2024-10-11";
  final endDate = "2024-10-20";

  Future<List<NasaApodModel>> fetchNasaAPOD() async {
    const String apiUrl = "https://api.nasa.gov/planetary/apod";
    try {
      // final response = await _dio.get("${ApodEndpoints.apodBaseUrl}&start_date=$startDate&end_date=$endDate");

      final response = await _dio.get(
          "$apiUrl?api_key=heuQbPNjrbidnK2ZCmLcimZpV9zuqhTKOijozJZb&start_date=2024-09-24&end_date=2024-10-04");
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        List<dynamic> data = response.data;
        return data.map((item) => NasaApodModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load APOD');
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    futureApods = fetchNasaAPOD();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NasaApodModel>>(
      future: futureApods,
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        List<NasaApodModel> apods = snapshot.data!;
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            // childAspectRatio: 1, // Aspect ratio of each grid item
          ),
          itemCount: apods.length, // Use the length of the fetched data
          itemBuilder: (context, index) {
            return Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  Image.network(
                    fit: BoxFit.cover,
                    apods[index].url ?? '',
                    height: 140,
                    width: 200,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text(apods[index].title ?? '',
                  //       style: TextStyle(fontWeight: FontWeight.bold)),
                  // ),
                  // Text(apods[index].explanation ?? ''),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
*/

import 'package:cosmos_pedia/cosmospedia/get_api/apod_api/apod_endpoints/apod_endpoints.dart';
import 'package:cosmos_pedia/cosmospedia/models/apod_model/apod_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  late Future<List<NasaApodModel>> futureApods;
  final Dio _dio = Dio();

  final startDate = "2024-10-11";
  final endDate = "2024-10-21";

  Future<List<NasaApodModel>> fetchNasaAPOD() async {
    const String apiUrl = "https://api.nasa.gov/planetary/apod";
    const String apiKey = "C2Di06dBWBfgrxjprDE6NIuYeGFcbUbSWaCkmS4r"; // Replace with your actual API key

    try {
      final response = await _dio.get(
          "$apiUrl?api_key=$apiKey&start_date=$startDate&end_date=$endDate"
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((item) => NasaApodModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load APOD, status code: ${response.statusCode}');
      }
    } catch (e) {
      final response = await _dio.get(
          "$apiUrl?api_key=$apiKey&start_date=$startDate&end_date=$endDate"
      );

      print("\n\n\n\n\n\n\n\n\n\n\nStatus Code : ${response.statusCode}\n\n\n\n\n\n\n\n\n\n\n");
      print(e); // Log the error for debugging
      return []; // Return an empty list on error
    }
  }

  @override
  void initState() {
    super.initState();
    futureApods = fetchNasaAPOD();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NasaApodModel>>(
      future: futureApods,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          print('Error: ${snapshot.error}');
          return Center(child: Text('Error: ${snapshot.error}',style: TextStyle(color: whiteColor),));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available'));
        }

        List<NasaApodModel> apods = snapshot.data!;
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: apods.length,
          itemBuilder: (context, index) {
            return Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  Image.network(
                    fit: BoxFit.cover,
                    apods[index].url ?? '',
                    height: 140,
                    width: 200,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

