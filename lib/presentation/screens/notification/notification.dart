import 'package:aprendiendoflutter/domain/entities/curso/curso_model.dart';
import 'package:aprendiendoflutter/domain/entities/notif/notif.dart';
import 'package:aprendiendoflutter/infrastructure/mappers/notif_mapper.dart';
import 'package:aprendiendoflutter/infrastructure/shared/services/key_value_storage_service_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  static const String name = 'notificacion_screen';

  @override
  State<NotificationScreen> createState() =>
      _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  bool _isLoading = true;
  List<Notif> _notif = [];

  void initState() {
    super.initState();
    _fetchNotifications();
  }

  Future<void> _fetchNotifications() async {
    final storageService = KeyValueStorageServiceImpl();
    final username =
        await storageService.getValue<String>('username');
    print('username: $username');
    try {
      const token =
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImVtYWlsIjoiYXNoZWwudmFzcXVlekB1bm1zbS5lZHUucGUiLCJpYXQiOjE3MjAxMzAzMzV9.oQPmPW0jNh-iQTZNZmQqrOj7geibmsvV2PaSd8iX8GY';
      print('token: $token');
      final dio = Dio();

      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer $token';
          return handler
              .next(options); // Deja que la solicitud continúe
        },
      ));

      final response = await dio.get(
          'https://yachay-backend.onrender.com/v1/notifications');
      print('${response}');
      if (response.statusCode == 200) {
        setState(() {
          _notif = List<Notif>.from(response.data
              .map((x) => NotifMapper.notifJsonToEntity(x)));
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 44),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 30, 44),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.pop()),
        title: const Text(
          'Notificaciones',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 15.0,
        ),
        child: Column(
          children: [
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(40, 0, 40, 8),
                          child: Builder(
                            builder: (BuildContext context) {
                              if (_notif.isEmpty) {
                                return const Center(
                                  child: Column(
                                    children: <Widget>[
                                      Text('No se encontraron cursos',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0,
                                              fontWeight:
                                                  FontWeight.bold)),
                                    ],
                                  ),
                                );
                              } else {
                                return Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Wrap(
                                        children: [
                                          ..._notif.map((notif) {
                                            var sizedBox =
                                                const SizedBox(
                                              height: 25,
                                            );
                                            return Column(
                                              children: [
                                                Notif_widget(notif),
                                                sizedBox
                                              ],
                                            );
                                          })
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }
                            },
                          ),
                        )
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class Notif_widget extends StatelessWidget {
  final Notif notif;
  const Notif_widget(
    this.notif, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.notifications_active_outlined,
            size: 60, color: Colors.white),
        // CircleAvatar(
        //   backgroundImage: NetworkImage(
        //       'https://img.bekia.es/celebrities/th/1000/1082.jpg'),
        //   radius:
        //       30.0, // Ajusta el tamaño del radio según necesites
        // ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${notif.type}',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10.0),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                      color: Colors.white, fontSize: 18.0),
                  children: _buildTextSpans('${notif.message}'),
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ],
    );
  }

  List<TextSpan> _buildTextSpans(String text) {
    List<TextSpan> textSpans = [];

    RegExp regExp = RegExp(r'\*\*(.*?)\*\*');
    Iterable<Match> matches = regExp.allMatches(text);

    int lastIndex = 0;

    matches.forEach((match) {
      // Text before the match
      if (match.start > lastIndex) {
        textSpans.add(
          TextSpan(text: text.substring(lastIndex, match.start)),
        );
      }

      // Text within the asterisks (to be bold)
      String boldText =
          text.substring(match.start + 2, match.end - 2);
      textSpans.add(
        TextSpan(
          text: boldText,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );

      lastIndex = match.end;
    });

    // Text after the last match
    if (lastIndex < text.length) {
      textSpans.add(
        TextSpan(text: text.substring(lastIndex)),
      );
    }

    return textSpans;
  }
}
