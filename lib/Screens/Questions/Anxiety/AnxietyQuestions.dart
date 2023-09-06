class AnxietyQuestions {
  static List<AnxietyQuestion> questions = [
    AnxietyQuestion(
      'I worry about bad things happening or things going wrong.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    AnxietyQuestion(
      'I often find myself feeling restless, unable to stay calm, and constantly on edge.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    AnxietyQuestion(
      'I have trouble concentrating or staying focused.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    AnxietyQuestion(
      'I feel tension or tightness in my muscles, especially in my neck, shoulders, or back.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    AnxietyQuestion(
      'I have trouble sleeping or experience restless sleep because of anxiety.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    AnxietyQuestion(
      'I often experience headaches, trembling, twitching, or shaking as a result of feeling nervous.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    AnxietyQuestion(
      "When I'm anxious or stressed, I often experience feelings of lightheadedness, dizziness, or a sensation that I might faint.",
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    AnxietyQuestion(
      "When I'm anxious or stressed, I tend to sweat excessively, get hot flashes, or have sweaty palms.",
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    AnxietyQuestion(
      "When I'm anxious or stressed, I frequently experience a rapid or irregular heartbeat and may feel short of breath.",
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    AnxietyQuestion(
      'I experience physical symptoms like nausea, stomachaches, digestive problems, dry mouth, difficulty swallowing, and a lump in my throat when I feel anxious or stressed.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    AnxietyQuestion(
      'I have racing thoughts, excessive worry, or find it hard to make decisions because of anxiety.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    AnxietyQuestion(
      'I tend to avoid certain situations or activities, particularly social situations, as they tend to make me feel anxious or distressed.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    AnxietyQuestion(
      'I frequently find myself dealing with distressing thoughts or images that repeatedly come to my mind without my control and are closely related to my anxiety.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    AnxietyQuestion(
      'I have difficulty relaxing or find it hard to let go of tension and stress.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    AnxietyQuestion(
      'I feel irritable or easily agitated because of anxiety.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
  ];
}

class AnxietyQuestion {
  final String questionText;
  final List<String> options;

  AnxietyQuestion(this.questionText, this.options);
}
