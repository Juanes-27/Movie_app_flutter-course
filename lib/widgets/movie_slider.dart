import 'package:flutter/material.dart';
import 'package:movies_app/models/models.dart';

class MovieSlider extends StatefulWidget {
  final List<Movie> movies;
  final String? tittle;
  final Function onNextPage;
  const MovieSlider(
      {super.key, required this.movies, this.tittle, required this.onNextPage});

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity * 0.9,
      height: 260,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (widget.tittle != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              widget.tittle!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        const SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (context, index) {
                final movie = widget.movies[index];
                return _MoviePoster(popularMovie: movie);
              }),
        )
      ]),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie popularMovie;

  const _MoviePoster({required this.popularMovie});

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
                  arguments: 'popularMovies-instance'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(popularMovie.fullPosterImg),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              popularMovie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
