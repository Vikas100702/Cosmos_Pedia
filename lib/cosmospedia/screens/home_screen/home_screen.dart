import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cosmos_pedia/cosmospedia/custom_widgets/custom_app_bar/custom_app_bar.dart';
import 'package:cosmos_pedia/cosmospedia/custom_widgets/custom_navigation_bar/custom_navigation_bar.dart';
import 'package:cosmos_pedia/cosmospedia/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List imageList = [
    {"id": 1, "image_path": "https://i.pinimg.com/enabled/236x/02/30/2f/02302f471262c78ad2bf5ba72ce829aa.jpg"},
    {"id": 2, "image_path": "https://i.pinimg.com/enabled/564x/47/1c/82/471c8214aaaffff7b4ab04f9cf34a5e4.jpg"},
    {"id": 3, "image_path": "https://i.pinimg.com/enabled/564x/f8/d6/eb/f8d6eb94847689976b3bad13bd164121.jpg"},
    {"id": 4, "image_path": "https://i.pinimg.com/736x/53/90/20/539020cce8be5a508d1ccbac6652a5a3.jpg"},
    {"id": 5, "image_path": "https://i.pinimg.com/736x/ed/0e/9a/ed0e9ad05f88d546a732bdc66a745d75.jpg"},
  ];

  final CarouselSliderController carouselController = CarouselSliderController();
  int currentIndex = 0;
  dynamic _previewData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/background.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Image carousel
              CarouselSlider(
                items: imageList
                    .map((item) => Image.network(
                  item['image_path'],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ))
                    .toList(),
                carouselController: carouselController,
                options: CarouselOptions(
                  scrollPhysics: BouncingScrollPhysics(),
                  aspectRatio: 2,
                  viewportFraction: 1,
                  height: 200.0, // Set the height for the carousel
                  autoPlay: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: currentIndex == entry.key ? 12.0 : 8.0,
                      height: currentIndex == entry.key ? 12.0 : 8.0,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 4.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == entry.key
                            ? Colors.blueAccent
                            : Colors.grey,
                      ),
                    ),
                  );
                }).toList(),
              ),
          
              // Wrapping the LinkPreview in a Card for better UI
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LinkPreview(
                      enableAnimation: true,
                      onPreviewDataFetched: (data) {
                        setState(() {
                          _previewData = data;
                        });
                      },
                      previewData: _previewData, // Pass the preview data from the state
                      text: 'https://flyer.chat',
                      width: MediaQuery.of(context).size.width * 0.9, // Adjust width
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: whiteColor,
          shape: const CircleBorder(),
          onPressed: () {
            // Handle FAB press
          },
          child: const Icon(Icons.home),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomNavigationBar(), // Custom bottom navigation bar
      ),
    );
  }
}
