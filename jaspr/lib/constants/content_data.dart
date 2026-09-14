class ExperienceItem {
  final String role;
  final String company;
  final String period;
  final String location;
  final bool isCurrent;
  final List<String> highlights;
  final List<String> tags;

  const ExperienceItem({
    required this.role,
    required this.company,
    required this.period,
    required this.location,
    this.isCurrent = false,
    required this.highlights,
    required this.tags,
  });
}

class AdditionalItem {
  final String title;
  final String organization;
  final String date;
  final String description;
  final String? badge;
  final String? imagePath;

  const AdditionalItem({
    required this.title,
    required this.organization,
    required this.date,
    required this.description,
    this.badge,
    this.imagePath,
  });
}

class EducationItem {
  final String degree;
  final String institution;
  final String period;
  final String location;

  const EducationItem({
    required this.degree,
    required this.institution,
    required this.period,
    required this.location,
  });
}

class ProjectItem {
  final String id;
  final String title;
  final String subtitle;
  final String category;
  final String period;
  final String description;
  final List<String> tags;
  final String imagePath;
  final String? externalUrl;
  final String? actionLabel;

  const ProjectItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.period,
    required this.description,
    required this.tags,
    required this.imagePath,
    this.externalUrl,
    this.actionLabel,
  });
}

class PortfolioData {
  static const String firstName = 'Firdous';
  static const String lastName = 'Ismail';
  static const String eyebrow = 'SENIOR SOFTWARE ENGINEER AT NOMNI';
  static const String company = 'Nomni';
  static const String location = 'Chennai, Tamil Nadu, India';
  static const String email = 'thisisfirdous@gmail.com';
  static const String phone = '9940501048';
  
  static const String bioHook =
      'I build white-label consumer apps and the internal factory that produces them at Nomni, crafting instant-load web and mobile architectures.';

  static const List<String> aboutParagraphs = [
    "I'm a software engineer who builds mobile apps, web platforms, and the internal tools that power them. I enjoy turning complex workflows into simple, scalable systems that make life easier for both users and developers.",
    "At **Nomni** in Chennai, I build and maintain a multi-tenant Flutter platform that powers white-label apps for brands like **Shake Shack, Ben & Jerry's, Hungry Jack's** and **Lune**. I also built Online Ordering Studio, an internal App Factory using Jaspr and Flutter that enables non-engineers to configure, preview, and launch apps. Previously, I worked on fintech products at **Crayon Data** and spent over four years building mobile applications across multiple industries at **Calibraint**.",
    "Outside of work, I enjoy **3D printing** practical products, creating tech content for **YouTube** and **Instagram**, and sharing what I learn through community talks and developer events.",
  ];

  static const String githubUrl = 'https://github.com/iamfirdous';
  static const String linkedinUrl = 'https://linkedin.com/in/iamfirdous';
  static const String youtubeUrl = 'https://www.youtube.com/@NaanthaaAnthaPaiyan';
  static const String instagramUrl = 'https://www.instagram.com/naanthaaanthapaiyan/reels/';
  static const String mailtoUrl = 'mailto:thisisfirdous@gmail.com';
  static const String resumePdfPath = 'assets/resume.pdf';

  static const List<ExperienceItem> experiences = [
    ExperienceItem(
      role: 'Senior Flutter Engineer',
      company: 'Nomni (formerly Liven)',
      period: 'APR 2024 — PRESENT',
      location: 'Chennai',
      isCurrent: true,
      highlights: [
        'Built Online Ordering Studio, an internal App Factory that enables non-engineers to configure, brand, preview, and generate white-label Flutter apps through a Jaspr web wizard with a live Flutter preview. Automated the workflow with AI-assisted brand intake, one-click demo APK generation, and Firebase tenant provisioning, reducing manual engineering setup.',
        'Built and maintained the multi-tenant Flutter architecture powering 10+ production brands, including Shake Shack, Ben & Jerry\'s, Hungry Jack\'s and Lune, reducing tenant onboarding from 4–5 days to under a day (~80–90% reduction).',
      ],
      tags: [
        'Flutter',
        'Jaspr',
        'Dart',
        'BLoC',
        'Firebase',
        'Cloud Functions',
        'TypeScript',
        'Node.js',
        'GitLab CI',
        'GCP',
        'WebP',
        'SSE',
      ],
    ),
    ExperienceItem(
      role: 'Software Engineer — Flutter',
      company: 'Crayon Data',
      period: 'DEC 2022 — APR 2024',
      location: 'Chennai',
      isCurrent: false,
      highlights: [
        'Built a Flutter microfinance app for a Tanzanian bank that enables customers to purchase smartphones on short-term loans and make daily repayments, with NIDA/KYC verification, credit scoring, and an agent app for customer onboarding.',
      ],
      tags: ['Flutter', 'Dart', 'Fintech', 'KYC Verification', 'Credit Scoring', 'REST APIs', 'BLoC'],
    ),
    ExperienceItem(
      role: 'Software Engineer → Associate Technical Lead (Mobile)',
      company: 'Calibraint',
      period: 'MAR 2018 — NOV 2022',
      location: 'Chennai',
      isCurrent: false,
      highlights: [
        'Developed mobile and web applications across multiple industries, including fintech, healthcare, education, agriculture, retail, and on-demand services, using Flutter, Native Android, Ionic, Angular, Firebase, and Node.js.',
        'Built and shipped products including a farm-management platform for South African farmers, a cataract-surgery IOL simulation app for Alcon, asset-management and QR-scanning solutions, English-learning and education apps, retail counting tools, Wi-Fi management, and an on-demand household-services marketplace.',
      ],
      tags: ['Flutter', 'Android', 'Kotlin', 'Java', 'Angular', 'Ionic', 'QR Systems', 'Architecture'],
    ),
    ExperienceItem(
      role: 'Android Developer — Intern',
      company: 'Nexusinfo',
      period: 'NOV 2017 — FEB 2018',
      location: 'Bengaluru',
      isCurrent: false,
      highlights: [
        'Assisted in Android app dev and feature implementation; gained hands-on experience across the app lifecycle and debugging.',
      ],
      tags: ['Android', 'Java', 'App Lifecycle', 'Debugging'],
    ),
  ];

  static const List<AdditionalItem> additionalExperience = [
    AdditionalItem(
      title: 'Building Instant-First Web Experiences using Jaspr + Flutter',
      organization: 'Namma Flutter (Flutter Chennai)',
      date: 'MAY 2026',
      description:
          'Showcased Online Ordering Studio as a real-world Jaspr + Flutter case study, illustrating how static site generation combined with embedded Flutter runtimes achieves sub-second first paints and seamless preview capability. Awarded "Consistent Contributor" by the Namma Flutter community.',
      badge: 'Community Talk & Award',
      imagePath: 'assets/hover_images/talks_awards_4.png',
    ),
    AdditionalItem(
      title: 'Speaker, FOSS United Chennai',
      organization: 'IIT Madras',
      date: 'APR 2026',
      description:
          'Delivered a technical session at IIT Madras on using Jaspr to radically improve Flutter Web load performance, first contentful paint, and search engine crawlability, demonstrated live on a personal portfolio project.',
      badge: 'Conference Session',
      imagePath: 'assets/hover_images/talks_awards_3.png',
    ),
    AdditionalItem(
      title: 'Creating Major Impact with Minor Changes',
      organization: 'Namma Flutter (Flutter Chennai), hosted by YuniQ',
      date: 'NOV 2024',
      description:
          'Presented on impactful Dart tips, pattern matching optimizations, and compiler idioms for building cleaner, standardized, and more maintainable codebases.',
      badge: 'Community Talk',
      imagePath: 'assets/hover_images/talks_awards_2.png',
    ),
    AdditionalItem(
      title: 'Best Team Player',
      organization: 'Calibraint Annual Awards',
      date: '2021',
      description:
          'Recognized for high-level productivity, dependable technical mentorship, and outstanding collaborative performance across multiple mobile teams.',
      badge: 'Annual Excellence Award',
      imagePath: 'assets/hover_images/talks_awards_1.png',
    ),
  ];

  static const List<EducationItem> education = [
    EducationItem(
      degree: 'Master of Computer Applications (MCA)',
      institution: 'AMS College of Engineering',
      period: '2016 — 2018',
      location: 'Chennai',
    ),
    EducationItem(
      degree: 'Bachelor of Computer Applications (BCA)',
      institution: 'The New College',
      period: '2013 — 2016',
      location: 'Chennai',
    ),
  ];

  static const List<String> spokenLanguages = [
    'Urdu (Native)',
    'Tamil (Native)',
    'English (Fluent)',
    'Hindi (Fluent)',
  ];

  static const List<String> technologies = [
    'Dart',
    'Flutter',
    'Jaspr',
    'BLoC',
    'Clean Architecture',
    'GoRouter',
    'Firebase (Auth, Firestore, Hosting, Cloud Functions)',
    'TypeScript',
    'Node.js',
    'GitLab CI',
    'GCP',
    'Fastlane',
    'WebP',
    'SSE',
    'Kotlin',
    'Java',
    'Angular',
    'REST APIs',
  ];

  static const List<ProjectItem> projects = [
    ProjectItem(
      id: 'app-factory-consumer-apps',
      title: 'Online Ordering Studio',
      subtitle: 'The platform behind multiple restaurant apps',
      category: 'FLUTTER · JASPR · INTERNAL TOOLING',
      period: '2024 — PRESENT',
      description: 'Built an internal App Factory that allows non-engineers to configure, preview, and launch branded mobile apps. It powers a multi-tenant Flutter platform used across restaurant brands including Roll\'d, Lune, Dumpling Chef, and others.',
      tags: [
        'Flutter',
        'Jaspr',
        'Dart',
        'BLoC',
        'Multi-Tenancy',
        'Firebase',
        'GitLab CI',
        'GCP',
        'SSE',
      ],
      imagePath: 'assets/hover_images/online_ordering_studio.png',
    ),
    ProjectItem(
      id: '3d-printing-maker',
      title: '3D Printing & Maker Projects',
      subtitle: 'Functional prints for everyday use',
      category: '3D PRINTING · MAKER',
      period: 'PERSONAL',
      description: 'I enjoy 3D printing practical items for my workspace and home, from desk accessories and mounts to custom organizers and functional upgrades. I focus on useful prints rather than decorative models.',
      tags: ['3D Printing', 'CAD Modeling', 'FDM Prototyping', 'Product Design', 'Makerspace'],
      imagePath: 'assets/hover_images/3d_printing.png',
      actionLabel: 'See Prints',
      externalUrl: 'https://www.instagram.com/naanthaaanthapaiyan/reels/',
    ),
    ProjectItem(
      id: 'tech-content-creation',
      title: 'Tech Content Creation',
      subtitle: 'YouTube, Instagram & maker projects',
      category: 'CONTENT · COMMUNITY',
      period: '@NAANTHAAANTHAPAIYAN',
      description: 'I create videos about technology, gadgets, workspace setups, DIY and 3D printing. My goal is to share practical ideas, experiments, and projects that others can learn from or build themselves.',
      tags: ['YouTube', 'Instagram', 'DIY', 'Gadgets', 'Tech Ed', '3D Printing'],
      imagePath: 'assets/hover_images/content_creation.png',
      actionLabel: 'Watch Channel',
      externalUrl: 'https://www.youtube.com/@NaanthaaAnthaPaiyan',
    ),
  ];
}
