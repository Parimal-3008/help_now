final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    /// Add all fields
    id, name, contact, product_type, amount,amount_type, time,path
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String contact = 'contact';
  static final String product_type = 'product_type';
  static final String amount_type = 'amount_type';
  static final String amount = 'amount';
  static final String time = 'time';
  static final String path = 'path';
}

class Note {
  final int id;
  final String name;
  final String contact;
  final String product_type;
  final String amount_type;
  final String amount;
  final DateTime createdTime;
  final String path;

  const Note({
    this.id,
     this.name,
     this.contact,
     this.product_type,
     this.amount_type,
     this.amount,
     this.createdTime,
     this.path,
  });

  Note copy({
    int id,
    bool name,
    int contact,
    String product_type,
    String amount_type,
    String amount,
    DateTime createdTime,
    String path,
  }) =>
      Note(
        id: id ?? this.id,
        name: name ?? this.name,
        contact: contact ?? this.contact,
        product_type: product_type ?? this.product_type,
        amount_type: amount_type ?? this.amount_type,
        amount: amount ?? this.amount,
        createdTime: createdTime ?? this.createdTime,
        path: path ?? this.path,
      );

  static Note fromJson(Map<String, Object> json) { 
    return Note(
        id: json[NoteFields.id] as int,
        name: json[NoteFields.name] as String,
        contact: json[NoteFields.contact] as String,
        product_type: json[NoteFields.product_type] as String,
        amount_type: json[NoteFields.amount_type] as String,
        amount: json[NoteFields.amount] as String,
        createdTime: DateTime.parse(json[NoteFields.time] as String),
        path: json[NoteFields.path] as String,
      );
  }
  Map<String, Object> toJson() => {
        NoteFields.id: id,
        NoteFields.product_type: product_type,
        NoteFields.name: name ,
        NoteFields.contact: contact,
        NoteFields.amount_type: amount_type,
         NoteFields.amount: amount,
        NoteFields.time: createdTime.toIso8601String(),
        NoteFields.path: path,
      };
}