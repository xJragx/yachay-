import 'package:aprendiendoflutter/domain/entities/user/notif/notif.dart';

class NotifMapper {
  static Notif notifJsonToEntity(Map<String, dynamic> json) => Notif(
        id: json['id'],
        idUser: json['idUser'],
        type: json['type'],
        message: json['message'],
        url: json['url'],
        read: json['read'],
      );
}
