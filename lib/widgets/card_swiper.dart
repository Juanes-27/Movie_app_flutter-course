import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // ignore: sized_box_for_whitespace
    return Container(
      width: size.width,
      height: size.height * 0.5,
      //color: Colors.lightBlue.withOpacity(0.5),
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage(
                    'https://vignette.wikia.nocookie.net/animebattlearenaaba/images/0/0b/Rock.png/revision/latest?cb=20191013204819'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
