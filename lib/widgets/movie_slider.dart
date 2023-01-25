import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity * 0.9,
      height: 260,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Populares',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (context, index) => const _MoviePoster()),
        )
      ]),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 130,
        height: 190,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details',
                  arguments: 'movie-instance'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: const FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(
                      'https://vignette.wikia.nocookie.net/animebattlearenaaba/images/0/0b/Rock.png/revision/latest?cb=20191013204819'),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Rock Lee vs Gara: La pelea del año',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
