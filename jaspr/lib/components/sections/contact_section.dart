import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/content_data.dart';

class ContactSection extends StatelessComponent {
  const ContactSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'contact', classes: 'section contact-section', [
      h2(classes: 'section-title', [.text("Let's Connect")]),
      div(classes: 'contact-container', [
        p(classes: 'contact-intro', [
          .text(
            'Interested in Flutter, Jaspr, 3D printing, content creation, or just want to chat about building things? Feel free to reach out.',
          ),
        ]),
        div(classes: 'contact-links-list', [
          // Email Row Group (Container + External Copy Button)
          div(classes: 'contact-row-wrapper', [
            div(classes: 'contact-row contact-row--flex', [
              div(classes: 'contact-label-group', [
                RawText(
                  '<svg class="contact-icon" viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><rect width="20" height="16" x="2" y="4" rx="2"/><path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/></svg>',
                ),
                span(classes: 'contact-label-text', [.text('EMAIL')]),
              ]),
              div(classes: 'contact-action-group', [
                a(
                  href: 'mailto:${PortfolioData.email}?subject=Hello%20Firdous',
                  classes: 'contact-value-link',
                  [.text(PortfolioData.email)],
                ),
              ]),
            ]),
            button(
              id: 'copy-email-btn',
              classes: 'contact-copy-btn',
              attributes: {
                'type': 'button',
                'aria-label': 'Copy email address',
                'title': 'Copy email to clipboard',
                'onclick': 'copyEmailToClipboard(this)',
              },
              [
                span(classes: 'copy-state-default', [
                  RawText(
                    '<svg class="copy-icon" viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><rect width="14" height="14" x="8" y="8" rx="2" ry="2"/><path d="M4 16c-1.1 0-2-.9-2-2V4c0-1.1.9-2 2-2h10c1.1 0 2 .9 2 2"/></svg>',
                  ),
                  span(classes: 'copy-label', [.text('Copy')]),
                ]),
                span(
                  classes: 'copy-state-copied',
                  attributes: {'aria-hidden': 'true'},
                  [
                    RawText(
                      '<svg class="check-icon" viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><polyline points="20 6 9 17 4 12"/></svg>',
                    ),
                    span(classes: 'copy-label', [.text('Copied!')]),
                  ],
                ),
              ],
            ),
          ]),

          // LinkedIn Row
          div(classes: 'contact-row', [
            div(classes: 'contact-label-group', [
              RawText(
                '<svg class="contact-icon" viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z"/><rect width="4" height="12" x="2" y="9"/><circle cx="4" cy="4" r="2"/></svg>',
              ),
              span(classes: 'contact-label-text', [.text('LINKEDIN')]),
            ]),
            div(classes: 'contact-action-group', [
              a(
                href: PortfolioData.linkedinUrl,
                target: Target.blank,
                attributes: {'rel': 'noopener noreferrer'},
                classes: 'contact-value-link',
                [.text('linkedin.com/in/iamfirdous')],
              ),
            ]),
          ]),

          // Divider: ——— or follow me on ———
          div(classes: 'contact-divider', [
            span([.text('or follow me on')]),
          ]),

          // Social Boxes: YouTube & Instagram
          div(classes: 'contact-social-grid', [
            a(
              href: PortfolioData.youtubeUrl,
              target: Target.blank,
              attributes: {
                'aria-label': 'YouTube channel',
                'rel': 'noopener noreferrer',
              },
              classes: 'contact-social-card',
              [
                RawText(
                  '<svg class="contact-social-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" fill="currentColor"><path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/></svg>',
                ),
                span(classes: 'contact-social-name', [.text('YouTube')]),
              ],
            ),
            a(
              href: PortfolioData.instagramUrl,
              target: Target.blank,
              attributes: {
                'aria-label': 'Instagram profile',
                'rel': 'noopener noreferrer',
              },
              classes: 'contact-social-card',
              [
                RawText(
                  '<svg class="contact-social-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="16" height="16" fill="currentColor"><path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/></svg>',
                ),
                span(classes: 'contact-social-name', [.text('Instagram')]),
              ],
            ),
          ]),
        ]),
      ]),
    ]);
  }
}
