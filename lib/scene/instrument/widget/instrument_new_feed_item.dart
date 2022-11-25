import 'package:demo_fx_project/model/news_feed.dart';
import 'package:flutter/material.dart';
import 'package:demo_fx_project/util/date_helper.dart';

class InstrumentNewFeedItem extends StatelessWidget {
  final NewsFeed newsFeed;

  const InstrumentNewFeedItem({Key? key, required this.newsFeed})
      : super(key: key);

  Widget _buildImage(BuildContext context) {
    final url = newsFeed.bannerImage;
    if (url != null && url.isNotEmpty) {
      return Image.network(url);
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            SizedBox(width: 32, height: 32, child: _buildImage(context)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsFeed.title,
                    style: theme.textTheme.bodyText1,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    newsFeed.timePublished?.dateAgo() ?? '---',
                    style: theme.textTheme.caption,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
