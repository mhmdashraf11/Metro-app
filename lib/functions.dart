class Metro {
  final line1 = [
    "Helwan",
    "Ain Helwan",
    "Helwan University",
    "Wadi Hof",
    "Hadayek Helwan",
    "El-Masara",
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
    "Kobri El Qobba",
    "Hammamat El Qobba",
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
    List<String> possibleInterchangePoints = [];
    for (int i = 0; i < linesOfPoint1.length; i++) {
      for (int j = 0; j < linesOfPoint2.length; j++) {
        if ((linesOfPoint1[i] == 1 && linesOfPoint2[j] == 2) ||
            (linesOfPoint1[i] == 2) && linesOfPoint2[j] == 1)
          possibleInterchangePoints.addAll(['El Shohadaa', 'Sadat']);
        else if ((linesOfPoint1[i] == 1 && linesOfPoint2[j] == 3) ||
            (linesOfPoint1[i] == 3) && linesOfPoint2[j] == 1)
          possibleInterchangePoints.add('Nasser');
        else if ((linesOfPoint1[i] == 2 && linesOfPoint2[j] == 3) ||
            (linesOfPoint1[i] == 3) && linesOfPoint2[j] == 2)
          possibleInterchangePoints.addAll(['Attaba']);
        else if ((linesOfPoint1[i] == 2 && linesOfPoint2[j] == 4) ||
            (linesOfPoint1[i] == 4) && linesOfPoint2[j] == 2)
          possibleInterchangePoints.addAll(['Cairo University']);
        else if ((linesOfPoint1[i] == 3 && linesOfPoint2[j] == 4) ||
            (linesOfPoint1[i] == 4) && linesOfPoint2[j] == 3)
          possibleInterchangePoints.addAll(['Kit Kat']);
      }
    }
    possibleInterchangePoints = possibleInterchangePoints.toSet().toList();
    return possibleInterchangePoints;
  }

  bool isInterchangePoint(String point) {
    if (interchangePoints.contains(point))
      return true;
    else
      return false;
  }

  List<String> getCommonLine(String point1, String point2) {
    if (line1.contains(point1) && line1.contains(point2)) {
      return line1;
    } else if (line2.contains(point1) && line2.contains(point2)) {
      return line2;
    } else if (line3.contains(point1) && line3.contains(point2)) {
      return line3;
    } else if (line4.contains(point1) && line4.contains(point2)) {
      return line4;
    } else
      return [];
  }

  List<int> getLines(String point) {
    List<int> lines = [];
    if (line1.contains(point)) lines.add(1);
    if (line2.contains(point)) lines.add(2);
    if (line3.contains(point)) lines.add(3);
    if (line4.contains(point)) lines.add(4);
    return lines;
  }

  bool areSameLine(String point1, String point2) {
    if (line1.contains(point1) && line1.contains(point2) ||
        line2.contains(point1) && line2.contains(point2) ||
        line3.contains(point1) && line3.contains(point2) ||
        line4.contains(point1) && line4.contains(point2))
      return true;
    else
      return false;
  }

  String getDirection(String startpoint, String endpoint) {
    final commonLine = getCommonLine(startpoint, endpoint);
    if (commonLine.indexOf(startpoint) < commonLine.indexOf(endpoint))
      return commonLine.last;
    else
      return commonLine.first;
  }

  List<String> printSameLine(String startpoint, String endpoint) {
    List<String> tempLine = getCommonLine(startpoint, endpoint);
    if (tempLine.indexOf(startpoint) < tempLine.indexOf(endpoint)) {
      return tempLine.sublist(
        tempLine.indexOf(startpoint),
        tempLine.indexOf(endpoint) + 1,
      );
    } else {
      return tempLine
          .sublist(tempLine.indexOf(endpoint), tempLine.indexOf(startpoint) + 1)
          .reversed
          .toList();
    }
  }

  List<List<String>> printNotSameLine(String start, String end) {
    final xs = getInterchangePoints(getLines(start), getLines(end));
    final routes = <List<String>>[];
    for (final x in xs) {
      final p1 = printSameLine(start, x);
      final p2 = printSameLine(x, end);
      if (p1.isEmpty || p2.isEmpty) continue;
      final r = <String>[];
      r.addAll(p1);
      r.removeLast();
      r.addAll(p2);
      routes.add(r);
    }
    return routes;
  }

  List<List<String>> allRoutes(String start, String end) {
    for (final ln in [line1, line2, line3, line4]) {
      if (ln.contains(start) && ln.contains(end)) {
        return [printSameLine(start, end)];
      }
    }

    final routes = <List<String>>[];

    routes.addAll(printNotSameLine(start, end));

    final startLs = getLines(start);
    final endLs = getLines(end);

    for (var mid = 1; mid <= 4; mid++) {
      final xs = getInterchangePoints(startLs, [mid]);
      final ys = getInterchangePoints([mid], endLs);
      if (xs.isEmpty || ys.isEmpty) continue;

      for (final x in xs) {
        for (final y in ys) {
          final midLine = _lineById(mid);
          if (!midLine.contains(x) || !midLine.contains(y)) continue;

          final a = printSameLine(start, x);
          final b = printSameLine(x, y);
          final c = printSameLine(y, end);

          if (a.isEmpty || b.isEmpty || c.isEmpty) continue;

          final r = <String>[];
          r.addAll(a);
          r.removeLast();
          r.addAll(b);
          r.removeLast();
          r.addAll(c);
          routes.add(r);
        }
      }
    }
    final seen = <String>{};
    final unique = <List<String>>[];
    for (final r in routes) {
      final key = r.join('->');
      if (seen.add(key)) unique.add(r);
    }

    unique.sort((a, b) => a.length.compareTo(b.length));
    return unique;
  }

  int stationCount(List<String> r) => r.length <= 1 ? 0 : r.length - 1;
  int expectedTimeMin(List<String> r) => stationCount(r) * 2;
  int fareEGP(List<String> r) {
    final s = stationCount(r);
    if (s <= 9) return 8;
    if (s <= 16) return 10;
    if (s <= 23) return 15;
    return 20;
  }
}
