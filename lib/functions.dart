class Metro {
  final line1 = [
    "Helwan",
    "Ain Helwan",
    "Helwan University",
    "Wadi Hof",
    "Hadayek Helwan",
    "El-Maasara",
    "Tora El-Asmant",
    "Kozzika",
    "Tora El-Balad",
    "Sakanat El Maadi",
    "El Maadi",
    "Hadayek El Maadi",
    "Dar El Salam",
    "El Zahraa",
    "Mar Girgis",
    "El Malek El Saleh",
    "El Sayeda Zeinab",
    "Saad Zaghloul",
    "Sadat",
    "Nasser",
    "Orabi",
    "El Shohadaa",
    "Ghamra",
    "El Demerdash",
    "Manshiet El Sadr",
    "Kobry El Qobba",
    "Hamamat El Qobba",
    "Saray El Qobba",
    "Hadayek El Zaitoun",
    "Helmeyet El Zeitoun",
    "El Matariya",
    "Ain Shams",
    "Ezbet El-Nakhl",
    "El Marg",
    "New Marg",
  ];

  final line2 = [
    "Shubra El Kheima",
    "Koliet El Zeraa",
    "Mezallat",
    "Khalafawy",
    "St. Teresa",
    "Rod El Farag",
    "Masarra",
    "El Shohadaa",
    "Attaba",
    "Naguib",
    "Sadat",
    "Opera",
    "Dokki",
    "El Bohoth",
    "Cairo University",
    "Faisal",
    "Giza",
    "Omm El-Masryeen",
    "Sakiat Mekky",
    "El Mounib",
  ];

  final line3 = [
    "Adly Mansour",
    "El Haykestep",
    "Omar Ibn El Khattab",
    "Qobaa",
    "Hesham Barakat",
    "El Nozha",
    "Nadi El Shams",
    "Alf Maskan",
    "Heliopolis",
    "Haroun",
    "Al Ahram",
    "Kolleyet El Banat",
    "Stadium",
    "Fair Zone",
    "Abbassiya",
    "Abdou Pasha",
    "El Geish",
    "Bab El Shaaria",
    "Attaba",
    "Nasser",
    "Maspero",
    "Safaa Hegazy",
    "Kit Kat",
    "Sudan",
    "Imbaba",
    "El-Bohy",
    "El-Qawmia",
    "Ring Road",
    "Rod El Farag Corridor",
  ];

  final line4 = [
    "Kit Kat",
    "Tawfikia",
    "Wadi El Nile",
    "Gamat El Dowal",
    "Boulak El Dakrour",
    "Cairo University",
  ];

  final interchangePoints = [
    'El Shohadaa',
    'Sadat',
    'Attaba',
    'Nasser',
    'Kit Kat',
    'Cairo University',
  ];

  List<String> _lineById(int id) {
    switch (id) {
      case 1:
        return line1;
      case 2:
        return line2;
      case 3:
        return line3;
      case 4:
        return line4;
      default:
        return [];
    }
  }

  List<String> getInterchangePoints(
    List<int> linesOfPoint1,
    List<int> linesOfPoint2,
  ) {
    List<String> interchangePoints = [];
    for (final linesOfPoint1 in linesOfPoint1) {
      for (final linesOfPoint2 in linesOfPoint2) {
        if ((linesOfPoint1 == 1 && linesOfPoint2 == 2) ||
            (linesOfPoint1 == 2 && linesOfPoint2 == 1)) {
          interchangePoints.addAll(['El Shohadaa', 'Sadat']);
        } else if ((linesOfPoint1 == 1 && linesOfPoint2 == 3) ||
            (linesOfPoint1 == 3 && linesOfPoint2 == 1)) {
          interchangePoints.add('Nasser');
        } else if ((linesOfPoint1 == 2 && linesOfPoint2 == 3) ||
            (linesOfPoint1 == 3 && linesOfPoint2 == 2)) {
          interchangePoints.add('Attaba');
        } else if ((linesOfPoint1 == 2 && linesOfPoint2 == 4) ||
            (linesOfPoint1 == 4 && linesOfPoint2 == 2)) {
          interchangePoints.add('Cairo University');
        } else if ((linesOfPoint1 == 3 && linesOfPoint2 == 4) ||
            (linesOfPoint1 == 4 && linesOfPoint2 == 3)) {
          interchangePoints.add('Kit Kat');
        }
      }
    }
    return interchangePoints.toSet().toList();
  }

  bool isInterchangePoint(String point) => interchangePoints.contains(point);

  List<String> getCommonLine(String p1, String p2) {
    if (line1.contains(p1) && line1.contains(p2)) return line1;
    if (line2.contains(p1) && line2.contains(p2)) return line2;
    if (line3.contains(p1) && line3.contains(p2)) return line3;
    if (line4.contains(p1) && line4.contains(p2)) return line4;
    return [];
  }

  bool areSameLine(String p1, String p2) =>
      (line1.contains(p1) && line1.contains(p2)) ||
      (line2.contains(p1) && line2.contains(p2)) ||
      (line3.contains(p1) && line3.contains(p2)) ||
      (line4.contains(p1) && line4.contains(p2));

  String getDirection(String startpoint, String endpoint) {
    // common lines only
    final line = getCommonLine(startpoint, endpoint);
    return line.indexOf(startpoint) < line.indexOf(endpoint)
        ? line.last
        : line.first;
  }

  String? tryGetDirection(String startpoint, String endpoint) {
    // in case not same line "for safety"
    final line = getCommonLine(startpoint, endpoint);
    if (line.isEmpty) return null;
    return getDirection(startpoint, endpoint);
  }

  List<int> getLines(String point) {
    final lines = <int>[];
    if (line1.contains(point)) lines.add(1);
    if (line2.contains(point)) lines.add(2);
    if (line3.contains(point)) lines.add(3);
    if (line4.contains(point)) lines.add(4);
    return lines;
  }

  List<String> printSameLine(String start, String end) {
    final commonLine = getCommonLine(start, end);
    if (commonLine.isEmpty) return [];
    final i = commonLine.indexOf(start), j = commonLine.indexOf(end);
    if (i < j) {
      return commonLine.sublist(i, j + 1);
    } else {
      return commonLine.sublist(j, i + 1).reversed.toList();
    }
  }

  List<List<String>> printNotSameLine(String start, String end) {
    final interchangePoints = getInterchangePoints(
      getLines(start),
      getLines(end),
    );
    final routes = <List<String>>[];
    for (final interchangePoint in interchangePoints) {
      final route1 = printSameLine(start, interchangePoint);
      final route2 = printSameLine(interchangePoint, end);
      if (route1.isEmpty || route2.isEmpty) continue;
      final route = <String>[];
      route.addAll(route1);
      route.removeLast();
      route.addAll(route2);
      routes.add(route);
    }
    return routes;
  }

  List<List<String>> allRoutes(String start, String end) {
    if (areSameLine(start, end)) {
      return [printSameLine(start, end)];
    }

    final routes = <List<String>>[];

    // one-interchange routes
    routes.addAll(printNotSameLine(start, end));

    // two-interchange routes
    final LinesOfStartPoint = getLines(start);
    final LinesOfEndPoint = getLines(end);

    for (var mid = 1; mid <= 4; mid++) {
      // max 16 interation
      final interchangePoints1 = getInterchangePoints(LinesOfStartPoint, [mid]);
      final interchangePoints2 = getInterchangePoints([mid], LinesOfEndPoint);
      if (interchangePoints1.isEmpty || interchangePoints2.isEmpty) continue;

      for (final interchange1 in interchangePoints1) {
        for (final interchange2 in interchangePoints2) {
          final midLine = _lineById(mid);
          if (!midLine.contains(interchange1) ||
              !midLine.contains(interchange2))
            continue;

          final a = printSameLine(start, interchange1);
          final b = printSameLine(interchange1, interchange2);
          final c = printSameLine(interchange2, end);

          if (a.isEmpty || b.isEmpty || c.isEmpty) continue;

          final route = <String>[];
          route.addAll(a);
          route.removeLast();
          route.addAll(b);
          route.removeLast();
          route.addAll(c);
          routes.add(route);
        }
      }
    }

    // Remove duplicates
    final seen = <String>{};
    final unique = <List<String>>[];
    for (final r in routes) {
      final routeAsString = r.join('->'); // to make the comparison possible
      if (seen.add(routeAsString)) unique.add(r);
    }
    unique.sort((a, b) => a.length.compareTo(b.length));
    return unique;
  }

  int stationCount(List<String> route) =>
      route.length <= 1 ? 0 : route.length - 1;
  int expectedTimeMin(List<String> route) => stationCount(route) * 2;
  int Price(List<String> route) {
    final s = stationCount(route);
    if (s <= 9) return 8;
    if (s <= 16) return 10;
    if (s <= 23) return 15;
    return 20;
  }
}
