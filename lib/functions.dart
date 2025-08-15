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
    List<String> xs = [];
    for (final a in linesOfPoint1) {
      for (final b in linesOfPoint2) {
        if ((a == 1 && b == 2) || (a == 2 && b == 1)) {
          xs.addAll(['El Shohadaa', 'Sadat']);
        } else if ((a == 1 && b == 3) || (a == 3 && b == 1)) {
          xs.add('Nasser');
        } else if ((a == 2 && b == 3) || (a == 3 && b == 2)) {
          xs.add('Attaba');
        } else if ((a == 2 && b == 4) || (a == 4 && b == 2)) {
          xs.add('Cairo University');
        } else if ((a == 3 && b == 4) || (a == 4 && b == 3)) {
          xs.add('Kit Kat');
        }
      }
    }
    return xs.toSet().toList();
  }

  bool isInterchangePoint(String point) => interchangePoints.contains(point);

  List<String> getCommonLine(String p1, String p2) {
    if (line1.contains(p1) && line1.contains(p2)) return line1;
    if (line2.contains(p1) && line2.contains(p2)) return line2;
    if (line3.contains(p1) && line3.contains(p2)) return line3;
    if (line4.contains(p1) && line4.contains(p2)) return line4;
    return [];
  }

  bool areSameLine(String a, String b) =>
      (line1.contains(a) && line1.contains(b)) ||
      (line2.contains(a) && line2.contains(b)) ||
      (line3.contains(a) && line3.contains(b)) ||
      (line4.contains(a) && line4.contains(b));

  String getDirection(String startpoint, String endpoint) {
    final line = getCommonLine(startpoint, endpoint);
    return line.indexOf(startpoint) < line.indexOf(endpoint)
        ? line.last
        : line.first;
  }

  String? tryGetDirection(String startpoint, String endpoint) {
    final line = getCommonLine(startpoint, endpoint);
    if (line.isEmpty) return null;
    return getDirection(startpoint, endpoint);
  }

  List<int> getLines(String point) {
    final ls = <int>[];
    if (line1.contains(point)) ls.add(1);
    if (line2.contains(point)) ls.add(2);
    if (line3.contains(point)) ls.add(3);
    if (line4.contains(point)) ls.add(4);
    return ls;
  }

  List<String> printSameLine(String start, String end) {
    final ln = getCommonLine(start, end);
    if (ln.isEmpty) return [];
    final i = ln.indexOf(start), j = ln.indexOf(end);
    if (i < j) {
      return ln.sublist(i, j + 1);
    } else {
      return ln.sublist(j, i + 1).reversed.toList();
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

    // one-interchange routes
    routes.addAll(printNotSameLine(start, end));

    // two-interchange routes
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

    // deduplicate
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
