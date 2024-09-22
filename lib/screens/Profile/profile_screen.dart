import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/profile3.png",
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  height: size.height * 0.4,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/profile3.png"),
                                radius: 30,
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green),
                                    child: const Icon(
                                      Icons.check,
                                      size: 14,
                                      color: Colors.white,
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.black54, width: 2),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: const Text(
                                  "ADD FRIEND",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                      fontSize: 12),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.pinkAccent),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: const Text(
                                  "Follow",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 12),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Winnie Vasquez",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                        ),
                      ),
                      const Text(
                        "Flutter Developer",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            color: Colors.black45),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "A Flutter developer is a software engineer who has proficiency with the Flutter framework to develop mobile, web,",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45
                        ),
                      ),
                      const Spacer(),
                      const Divider(
                        color: Colors.black12,
                      ),
                      const SizedBox(
                        height:45 ,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InfoCount(title: 'FRIEND', count: 2318),
                            InfoCount(title: 'FOLLOWING', count: 346),
                            InfoCount(title: 'FOLLOWER', count: 175),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class InfoCount extends StatelessWidget {
  final String title;
  final int count;

  const InfoCount({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "FRIEND",
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12),
        ),
        Text(
          "2380",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
