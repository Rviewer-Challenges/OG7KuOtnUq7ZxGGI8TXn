class DateEspEn {
  static Map<String, String> esp_en = {
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

  static parse(String string) {
    for (var key in esp_en.keys) {
      string = string.replaceAll(key, esp_en[key]!);
    }
    return string;
  }
}
