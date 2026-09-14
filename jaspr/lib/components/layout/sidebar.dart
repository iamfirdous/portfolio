import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/content_data.dart';
import 'footer.dart';

class Sidebar extends StatelessComponent {
  final String activeSection;
  final ValueChanged<String> onNavClick;

  const Sidebar({
    super.key,
    required this.activeSection,
    required this.onNavClick,
  });

  @override
  Component build(BuildContext context) {
    return aside(classes: 'sidebar', [
      div(classes: 'sidebar-top', [
        // Status Eyebrow with pulsing dot
        div(classes: 'status-eyebrow', [
          span(classes: 'pulse-dot', []),
          span([.text('SENIOR SOFTWARE ENGINEER AT ')]),
          img(
            src: 'assets/nomni.svg',
            alt: 'Nomni',
            classes: 'company-logo',
          ),
        ]),

        // Two-tone Name Heading
        h1(classes: 'name-heading', [
          span(classes: 'name-first', [.text(PortfolioData.firstName)]),
          span(classes: 'name-last', [.text(PortfolioData.lastName)]),
        ]),

        // Bio Hook with strong keywords
        p(classes: 'bio-hook', [
          .text('I build '),
          strong([.text('white-label consumer apps')]),
          .text(' and the '),
          strong([.text('internal App Factory')]),
          .text(
            ' that produces them at Nomni, crafting instant-load web and mobile architectures.',
          ),
        ]),
      ]),

      // Vertical Scroll-Spy Navigation (Centered in the middle)
      nav(classes: 'nav-container', [
        ul(classes: 'nav-list', [
          _buildNavItem('about', 'ABOUT'),
          _buildNavItem('experience', 'EXPERIENCE'),
          _buildNavItem('projects', 'PROJECTS'),
          _buildNavItem('additional-experience', 'TALKS & AWARDS'),
          _buildNavItem('contact', 'CONTACT'),
        ]),
      ]),

      // Sidebar Footer: Socials + Resume + Copyright
      const PortfolioFooter(classes: 'sidebar-footer'),
    ]);
  }

  Component _buildNavItem(String id, String label) {
    final isActive = activeSection == id;
    return li([
      a(
        href: '#$id',
        classes: 'nav-link${isActive ? ' active' : ''}',
        onClick: () => onNavClick(id),
        [
          span(classes: 'nav-indicator', []),
          span(classes: 'nav-label', [.text(label)]),
        ],
      ),
    ]);
  }
}
