class Helper {
  static String formatNumberWithCommas(dynamic input) {
    if (input is int || input is double || input is String) {
      // Chuyển đổi input thành double để xử lý cả số nguyên và số thập phân
      double number = double.parse(input.toString());

      // Biểu thức chính quy để chia nhóm mỗi ba chữ số trước và sau dấu thập phân
      RegExp regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))|(\.\d+)');

      // Sử dụng replaceAllMapped để thêm dấu phẩy giữa các nhóm
      String formattedNumber = number.toString().replaceAllMapped(
            regex,
            (Match match) => match[1] != null ? '${match[1]},' : match[3]!,
          );
      return formattedNumber;
    } else {
      throw ArgumentError(
          'Invalid input type. Supported types: int, double, String');
    }
  }
}
