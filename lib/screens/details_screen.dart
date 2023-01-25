import 'package:flutter/material.dart';
import 'package:movies_app/widgets/widgets.dart';

class DatailScreen extends StatelessWidget {
  const DatailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TO: Cambiar luego por una instancia de movie.
    //final String movie =
    //ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          _PosterAndTitle(),
          _Overview(),
          _Overview(),
          const CastingCards()
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.blueGrey,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        centerTitle: true,
        title: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          width: double.infinity * 0.9,
          child: const Text(
            'movie-.title',
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(
              'https://vignette.wikia.nocookie.net/animebattlearenaaba/images/0/0b/Rock.png/revision/latest?cb=20191013204819'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'),
            image: NetworkImage(
                'https://4.bp.blogspot.com/-e4SZ3lIUd3I/VUzod0kghOI/AAAAAAAAAFQ/76eGBumJQjs/s1600/YuGiOh-Series0.jpg'),
            height: 150,
            width: 110,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('movie.title',
                style: textTheme.headlineMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2),
            Text('movie.originaltitle',
                style: textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2),
            Row(
              children: [
                const Icon(
                  Icons.star_outline,
                  size: 20,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'move.voteAverage',
                  style: textTheme.bodySmall,
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        'Ullamco sit nisi voluptate duis adipisicing ad anim. Ut aliquip adipisicing non occaecat. Ad irure elit velit quis ipsum occaecat dolore nulla labore ad nulla laborum elit. Tempor eiusmod mollit sit dolore est aute reprehenderit anim sit cillum pariatur enim qui ut. Mollit excepteur exercitation voluptate consectetur irure proident reprehenderit. Voluptate consequat exercitation sit voluptate duis nostrud dolore eiusmod exercitation anim non labore esse voluptate. Lorem culpa sunt irure quis sunt commodo magna qui et proident nulla.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
