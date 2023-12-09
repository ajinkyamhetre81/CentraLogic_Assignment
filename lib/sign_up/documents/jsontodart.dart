
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    List<Value> value;

    Welcome({
        required this.value,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "value": List<dynamic>.from(value.map((x) => x.toJson())),
    };
}

class Value {
    List<Joining> joining;
    List<Transaction> transaction;
    List<Joining> team;
    List<Joining> tax;

    Value({
        required this.joining,
        required this.transaction,
        required this.team,
        required this.tax,
    });

    factory Value.fromJson(Map<String, dynamic> json) => Value(
        joining: List<Joining>.from(json["joining"].map((x) => Joining.fromJson(x))),
        transaction: List<Transaction>.from(json["transaction"].map((x) => Transaction.fromJson(x))),
        team: List<Joining>.from(json["team"].map((x) => Joining.fromJson(x))),
        tax: List<Joining>.from(json["tax"].map((x) => Joining.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "joining": List<dynamic>.from(joining.map((x) => x.toJson())),
        "transaction": List<dynamic>.from(transaction.map((x) => x.toJson())),
        "team": List<dynamic>.from(team.map((x) => x.toJson())),
        "tax": List<dynamic>.from(tax.map((x) => x.toJson())),
    };
}

class Joining {
    String title;
    String size;
    String url;

    Joining({
        required this.title,
        required this.size,
        required this.url,
    });

    factory Joining.fromJson(Map<String, dynamic> json) => Joining(
        title: json["title"],
        size: json["size"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "size": size,
        "url": url,
    };
}

class Transaction {
    String address;
    int transactionId;
    String date;
    String dateType;
    List<Document> documents;

    Transaction({
        required this.address,
        required this.transactionId,
        required this.documents,
        required this.date,
        required this.dateType
    });

    factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        address: json["address"],
        transactionId: json["transactionId"],
        date: json["transaction_date"],
        dateType: json["date_type"],
        documents: List<Document>.from(json["documents"].map((x) => Document.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "transactionId": transactionId,
        "transaction_date": date,
        "date_type": dateType,
        "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
    };
}

class Document {
    Title title;
    CheckListName checkListName;
    DateTime date;
    Status status;
    String url;

    Document({
        required this.title,
        required this.checkListName,
        required this.date,
        required this.status,
        required this.url,
    });

    factory Document.fromJson(Map<String, dynamic> json) => Document(
        title: titleValues.map[json["title"]]!,
        checkListName: checkListNameValues.map[json["checkListName"]]!,
        date: DateTime.parse(json["date"]),
        status: statusValues.map[json["status"]]!,
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "title": titleValues,
        "checkListName": checkListNameValues.reverse[checkListName],
        "date": date.toIso8601String(),
        "status": statusValues.reverse[status],
        "url": url,
    };
}

enum CheckListName {
    DEMO_NAME
}

final checkListNameValues = EnumValues({
    "Demo Name": CheckListName.DEMO_NAME
});

enum Status {
    APPROVED,
    UNAPPROVED
}

final statusValues = EnumValues({
    "Approved": Status.APPROVED,
    "Unapproved": Status.UNAPPROVED
});

enum Title {
    LICENSE_DOCUMENT_PDF
}

final titleValues = EnumValues({
     "License Document.pdf":Title.LICENSE_DOCUMENT_PDF
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<String, T> reverseMap;

    EnumValues(this.map);

    Map<String, T> get reverse {
        reverseMap = map.map((k, v) => MapEntry(k, v));
        return reverseMap;
    }
}
