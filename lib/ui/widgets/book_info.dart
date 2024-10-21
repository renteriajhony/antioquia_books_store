import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../antioquia_bookstore.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BooksProvider>(
      builder: (BuildContext context, bookProvider, Widget? child) {
        if (bookProvider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          BookDetailResponse bookDetailResponse =
              bookProvider.bookDetailResponse;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                key: const Key('rich_text_author'),
                text: TextSpan(
                  text: UiLabelsApp.labelsApp['BookInfo']['author'],
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: bookDetailResponse.authors ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: UiLabelsApp.labelsApp['BookInfo']['publisher'],
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: bookDetailResponse.publisher ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: UiLabelsApp.labelsApp['BookInfo']['language'],
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: bookDetailResponse.language ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: UiLabelsApp.labelsApp['BookInfo']['pages'],
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: bookDetailResponse.pages ?? '',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: UiLabelsApp.labelsApp['BookInfo']['year'],
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: bookDetailResponse.year ?? '',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: UiLabelsApp.labelsApp['BookInfo']['rating'],
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: bookDetailResponse.rating ?? '',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ]),
              RichText(
                text: TextSpan(
                  text: UiLabelsApp.labelsApp['BookInfo']['price'],
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: bookDetailResponse.price ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorsApp.highlight,
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              if (bookDetailResponse.desc != null)
                RichText(
                  text: TextSpan(
                    text: UiLabelsApp.labelsApp['BookInfo']['desc'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: bookDetailResponse.desc ?? '',
                          style: DefaultTextStyle.of(context).style),
                    ],
                  ),
                ),
              SizedBox(height: DimensionsDoubleApp.tenD),
              RichText(
                text: TextSpan(
                  text: UiLabelsApp.labelsApp['BookInfo']['url'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: bookDetailResponse.url ?? '',
                      style: const TextStyle(color: ColorsApp.colorSchemeSeed),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          String url = bookDetailResponse.url ?? '';
                          Uri uri = Uri.parse(url);
                          launchUrl(uri);
                        },
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
