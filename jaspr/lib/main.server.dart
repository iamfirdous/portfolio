/// The entrypoint for the **server** environment.
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  runApp(Document(
    title: 'Firdous Ismail — Senior Software Engineer (Flutter & Jaspr)',
    meta: {
      'description':
          'Portfolio of Firdous Ismail, Senior Software Engineer specializing in Flutter, Jaspr, and white-label App Factory architectures.',
      'viewport': 'width=device-width, initial-scale=1.0',
      'og:title': 'Firdous Ismail — Senior Software Engineer',
      'og:description':
          'Shipping white-label consumer apps and the internal factory that produces them.',
      'og:type': 'website',
      'og:url': 'https://firdous.web.app',
      'twitter:card': 'summary_large_image',
    },
    head: [
      link(rel: 'stylesheet', href: 'styles.css'),
      link(rel: 'icon', type: 'image/png', href: 'favicon.png'),
      script(src: 'scroll_spy.js', defer: true),
      script(src: 'cursor_follower.js', defer: true),
    ],
    body: App(),
  ));
}
