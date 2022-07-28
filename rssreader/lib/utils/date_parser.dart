class DateEspEn {
  static Map<String, String> espEn = {
    'lun': 'Mon',
    'mar': 'Tue',
    'mie': 'Wed',
    'jue': 'Thu',
    'vie': 'Fri',
    'sab': 'Sat',
    'dom': 'Sun',
    'ene': 'Jan',
    'feb': 'Feb',
    'may': 'May',
    'jun': 'Jun',
    'jul': 'Jul',
    'ago': 'Aug',
    'sep': 'Sep',
    'oct': 'Oct',
    'nov': 'Nov',
    'dic': 'Dec',
    '.': ''
  };

  static Map<int, String> monthName = {
    1: "Enero",
    2: "Febrero",
    3: "Marzo",
    4: "Abril",
    5: "Mayo",
    6: "Junio",
    7: "Julio",
    8: "Agosto",
    9: "Septiembre",
    10: "Octubre",
    11: "Noviembre",
    12: "Diciembre",
  };

  static parse(String string) {
    for (var key in espEn.keys) {
      string = string.replaceAll(key, espEn[key]!);
    }
    return string;
  }
}
