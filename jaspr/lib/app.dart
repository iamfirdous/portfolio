import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'components/layout/footer.dart';
import 'components/layout/sidebar.dart';
import 'components/sections/about_section.dart';
import 'components/sections/additional_experience_section.dart';
import 'components/sections/contact_section.dart';
import 'components/sections/experience_section.dart';
import 'components/sections/projects_section.dart';

@client
class App extends StatefulComponent {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  String activeSection = 'about';

  void _onNavClick(String id) {
    setState(() {
      activeSection = id;
    });
  }

  @override
  Component build(BuildContext context) {
    return div(classes: 'portfolio-container', [
      Sidebar(
        activeSection: activeSection,
        onNavClick: _onNavClick,
      ),
      div(
        classes: 'content-column',
        attributes: {'role': 'main'},
        [
          const AboutSection(),
          const ExperienceSection(),
          const ProjectsSection(),
          const AdditionalExperienceSection(),
          const ContactSection(),
          const PortfolioFooter(classes: 'mobile-footer'),
        ],
      ),

      // Shared Image Lightbox Modal for mobile photo viewing
      div(
        id: 'image-lightbox',
        classes: 'image-lightbox',
        attributes: {
          'role': 'dialog',
          'aria-modal': 'true',
          'aria-label': 'Photo preview',
          'aria-hidden': 'true',
        },
        [
          div(classes: 'lightbox-backdrop', []),
          div(classes: 'lightbox-container', [
            div(classes: 'lightbox-content', [
              button(
                classes: 'lightbox-close-btn',
                attributes: {
                  'type': 'button',
                  'aria-label': 'Close photo preview',
                  'title': 'Close',
                },
                [
                  RawText(
                    '<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>',
                  ),
                ],
              ),
              img(
                id: 'lightbox-img',
                src: '',
                alt: 'Preview',
                classes: 'lightbox-img',
              ),
              div(id: 'lightbox-caption', classes: 'lightbox-caption', []),
            ]),
          ]),
        ],
      ),
    ]);
  }
}
