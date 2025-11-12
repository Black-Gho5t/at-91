class NotifyModel {
  final int id;
  final int idUsr;
  final String title;
  final String body;
  final DateTime date;
  final bool isRead;
  final String link;

  NotifyModel({
    required this.id,
    required this.idUsr,
    required this.title,
    required this.body,
    required this.date,
    this.isRead = false,
    required this.link,
  });

  // Permite crear una copia inmutable del modelo con valores modificados
  NotifyModel copyWith({
    int? id,
    int? idUsr,
    String? title,
    String? body,
    DateTime? date,
    bool? isRead,
    String? link,
  }) {
    return NotifyModel(
      id: id ?? this.id,
      idUsr: idUsr ?? this.idUsr,
      title: title ?? this.title,
      body: body ?? this.body,
      date: date ?? this.date,
      isRead: isRead ?? this.isRead,
      link: link ?? this.link,
    );
  }
}
