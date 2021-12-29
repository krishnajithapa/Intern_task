class Course {
  const Course({
    required this.photoUrl,
    required this.lessonsCount,
    required this.timeInHours,
    required this.tags,
    required this.title,
    required this.author,
  });
  final String photoUrl;
  final int lessonsCount;
  final int timeInHours;
  final List<String> tags;
  final String title;
  final String author;
}

const courses = [
  Course(
    photoUrl: 'https://picsum.photos/200',
    lessonsCount: 25,
    timeInHours: 3,
    tags: ['UI DESIGN', 'INVISION'],
    title: 'Interaction Design With InVision',
    author: 'Jakob Levin',
  ),
  Course(
    photoUrl: 'https://picsum.photos/200',
    lessonsCount: 21,
    timeInHours: 3,
    tags: ['UI DESIGN', 'INVISION'],
    title: 'Tips and Tricks InVision',
    author: 'Chor Madar',
  ),
  Course(
    photoUrl: 'https://picsum.photos/200',
    lessonsCount: 18,
    timeInHours: 2,
    tags: ['UI DESIGN', 'INVISION'],
    title: 'Flutter Introductory Course',
    author: 'Krishna Thapa',
  ),
];
