import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task/colors.dart';
import 'package:task/models/author.dart';
import 'package:task/models/course.dart';
import 'package:task/widgets/widgets.dart';

class ZhiftScreen extends StatelessWidget {
  const ZhiftScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [
                Colors.pink,
                Colors.orange,
              ],
            ).createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            blendMode: BlendMode.srcIn,
            child: const Text(
              'Zhift',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          automaticallyImplyLeading: false,
          actions: [
            CircularIcon(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            CircularIcon(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_outlined,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
          ],
        ),
        body: ListView(
          children: [
            const HeadingRow(title: 'IN PROGRESS'),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: const [
                  ProgressCard(
                    title: 'Learning Figma',
                    author: 'Gustavo Franco',
                    percent: 83,
                  ),
                  ProgressCard(
                    title: 'Learning Figma',
                    author: 'Gustavo Franco',
                    percent: 83,
                  ),
                  ProgressCard(
                    title: 'Learning Figma',
                    author: 'Gustavo Franco',
                    percent: 83,
                  ),
                  ProgressCard(
                    title: 'Learning Figma',
                    author: 'Gustavo Franco',
                    percent: 83,
                  ),
                ],
              ),
            ),
            const HeadingRow(title: 'FAVORITE MENTOR'),
            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: authors.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return AuthorCard(author: authors[index]);
                },
              ),
            ),
            const HeadingRow(title: 'COURSE FOR YOU'),
            SizedBox(
              height: 232,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return CourseCard(course: courses[index]);
                },
              ),
            )
          ],
        ),
        bottomNavigationBar: const TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.pink,
          labelColor: Colors.pink,
          unselectedLabelColor: Colors.black,
          tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.content_copy)),
            Tab(icon: Icon(Icons.cable)),
            Tab(icon: Icon(Icons.cake)),
            Tab(icon: Icon(Icons.directions_bike)),
          ],
        ),
      ),
    );
  }
}

class HeadingRow extends StatelessWidget {
  const HeadingRow({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          CircularIcon(
            onPressed: () {},
            icon: const Icon(
              Icons.chevron_right,
              color: pink,
            ),
          )
        ],
      ),
    );
  }
}

class ProgressCard extends StatelessWidget {
  const ProgressCard({
    Key? key,
    required this.title,
    required this.author,
    required this.percent,
  }) : super(key: key);

  final String title;
  final String author;
  final int percent;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 21 / 9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: textTheme.bodyText1,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 10,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(author),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: LinearProgressIndicator(
                        minHeight: 6,
                        value: percent / 100,
                        backgroundColor: const Color(0xFFF5F5F5),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text('$percent %')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AuthorCard extends StatelessWidget {
  const AuthorCard({
    Key? key,
    required this.author,
  }) : super(key: key);

  final Author author;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        child: AspectRatio(
          aspectRatio: 4 / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(author.photoUrl),
                radius: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    author.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.blue,
                    maxRadius: 8,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 12,
                      ),
                    ),
                  )
                ],
              ),
              Text(
                author.profession.toUpperCase(),
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 16 / 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          course.photoUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black38,
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.cake_outlined,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    '${course.lessonsCount} lessons',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.black38,
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.timer,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    '${course.timeInHours} hrs',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: course.tags
                    .map(
                      (tag) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Chip(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            label: Text(tag),
                            backgroundColor: getRandomColor(),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    )
                    .toList(),
              ),
              Text(course.title),
              Row(
                children: [
                  const Icon(Icons.person),
                  Text(course.author),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color getRandomColor() {
  final index = Random().nextInt(Colors.primaries.length);
  return Colors.primaries[index];
}
