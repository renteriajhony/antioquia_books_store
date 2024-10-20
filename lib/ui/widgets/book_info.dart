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
                  text: 'Autor: ',
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
                  text: 'Editorial: ',
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
                  text: 'Idioma: ',
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
                        text: 'Páginas: ',
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
                        text: 'Año: ',
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
                        text: 'Clasificación: ',
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
                  text: 'Precio: ',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: bookDetailResponse.price ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              if (bookDetailResponse.desc != null)
                RichText(
                  text: TextSpan(
                    text: 'Descripción: ',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: bookDetailResponse.desc ?? '',
                          style: DefaultTextStyle.of(context).style),
                    ],
                  ),
                ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Url: ',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: bookDetailResponse.url ?? '',
                      style: const TextStyle(color: Colors.blue),
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
