class Author {
  const Author({
    required this.photoUrl,
    required this.name,
    required this.profession,
  });
  final String photoUrl;
  final String name;
  final String profession;
}

const authors = [
  Author(
    photoUrl: 'https://picsum.photos/seed/justin/100',
    name: 'Justin Botash',
    profession: 'UI Designer',
  ),
  Author(
    photoUrl: 'https://picsum.photos/seed/carlo/100',
    name: 'Carlo Septi',
    profession: 'Full-Stack Dev',
  ),
  Author(
    photoUrl: 'https://picsum.photos/seed/krishna/100',
    name: 'Krishna Thapa',
    profession: 'Flutter Developer',
  ),
];
