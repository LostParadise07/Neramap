class DepressionQuestions {
  static List<DepressionQuestion> questions = [
    DepressionQuestion(
      'I have felt sad or down most of the time.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    DepressionQuestion(
      'I have lost interest or enjoyment in things I used to love.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    DepressionQuestion(
      'I have felt very tired or lacking energy.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    DepressionQuestion(
      'I have had trouble concentrating or staying focused.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    DepressionQuestion(
      'I have felt guilty, worthless, or excessively self-critical.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    DepressionQuestion(
      'I have had negative thoughts about the future or a sense of hopelessness or a negative outlook.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    DepressionQuestion(
      'I have had thoughts of self-harm or suicide.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    DepressionQuestion(
      'I have experienced difficulties with sleep (e.g., trouble falling asleep, staying asleep, or waking up too early).',
      [
        'No difficulties',
        'Mild and occasional difficulties',
        'Moderate and frequent difficulties',
        'Severe and persistent difficulties'
      ],
    ),
    DepressionQuestion(
      'I have noticed significant changes in my appetite or weight, (experiencing either an increase or decrease in hunger and body weight).',
      ['No change', 'Mild change', 'Moderate change', 'Severe change'],
    ),
    DepressionQuestion(
      'I have experienced significant slowing down in my movements and thoughts.',
      [
        'No change',
        'Mild slowing down',
        'Moderate slowing down',
        'Severe slowing down'
      ],
    ),
    DepressionQuestion(
      'I always feel inadequate and hopeless about the future.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    DepressionQuestion(
      'I have consistently felt like a failure in everything I\'ve attempted.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    DepressionQuestion(
      'I have experienced moments where I feel like something bad might happen, anticipating punishment, and even feeling like I\'m being punished.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    DepressionQuestion(
      'I blame myself for everything and find fault in all that I do.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    DepressionQuestion(
      'I often find myself crying due to overwhelming sadness and disappointment.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    DepressionQuestion(
      'I have had difficulty connecting with others or feeling emotionally distant.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    DepressionQuestion(
      'I have lost motivation or interest in completing tasks.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    DepressionQuestion(
      'I have had trouble getting things done or being productive.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    DepressionQuestion(
      'I have struggled with making decisions or felt unsure.',
      [
        'Never or rarely',
        'Occasionally or sometimes',
        'Moderately or frequently',
        'Often or most of the time'
      ],
    ),
    DepressionQuestion(
      'I have noticed a decrease in my sexual drive or interest.',
      ['No change', 'Mild change', 'Moderate change', 'Severe change'],
    ),
  ];
}

class DepressionQuestion {
  final String questionText;
  final List<String> options;

  DepressionQuestion(this.questionText, this.options);
}
