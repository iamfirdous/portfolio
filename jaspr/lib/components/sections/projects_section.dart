import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../../constants/content_data.dart';

class ProjectsSection extends StatelessComponent {
  const ProjectsSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'projects', classes: 'section projects-section', [
      h2(classes: 'section-title', [.text('Projects & Creations')]),
      p(classes: 'section-lead', [
        .text(
          'Software platforms, internal App Factory tooling, physical 3D designs, and developer content.',
        ),
      ]),
      div(classes: 'projects-list', [
        for (final project in PortfolioData.projects)
          article(
            classes: 'project-row',
            attributes: {
              'data-preview': project.imagePath,
              'data-lightbox-src': project.imagePath,
              'data-lightbox-caption': project.title,
            },
            [
              // Desktop Anchor Hover Preview (Fixed outside left edge)
              div(classes: 'card-hover-preview', [
                img(
                  src: project.imagePath,
                  alt: project.title,
                  classes: 'card-hover-preview-img',
                ),
                div(classes: 'card-hover-preview-backdrop', []),
              ]),

              div(classes: 'project-meta', [
                span(classes: 'project-category', [.text(project.category)]),
                span(classes: 'project-period', [.text(project.period)]),
              ]),
              div(classes: 'project-header', [
                div(classes: 'project-title-row', [
                  h3(classes: 'project-title', [.text(project.title)]),
                  if (project.imagePath.isNotEmpty)
                    button(
                      classes: 'mobile-photo-btn',
                      attributes: {
                        'type': 'button',
                        'aria-label': 'View photo: ${project.title}',
                        'title': 'View photo',
                        'data-lightbox-src': project.imagePath,
                        'data-lightbox-caption': project.title,
                      },
                      [
                        RawText(
                          '<svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><circle cx="8.5" cy="8.5" r="1.5"></circle><polyline points="21 15 16 10 5 21"></polyline></svg>',
                        ),
                      ],
                    ),
                ]),
                p(classes: 'project-subtitle', [.text(project.subtitle)]),
              ]),
              p(classes: 'project-desc', [.text(project.description)]),

              div(classes: 'project-footer', [
                div(classes: 'project-tags', [
                  for (final tag in project.tags)
                    span(classes: 'tech-tag', [.text(tag)]),
                ]),
              ]),
            ],
          ),
      ]),
    ]);
  }
}
