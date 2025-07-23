

abstract class Helper {


  String getMinute(Duration duration);

  String getSecond(Duration duration);

}

class HelperImpl implements Helper {


  @override
  String getMinute(Duration duration) {
    final minute = duration.inMinutes;
    return minute < 10 ? '0$minute' : '$minute';
  }

  @override
  String getSecond(Duration duration) {
    final second = duration.inSeconds % 60;
    return second < 10 ? '0$second' : '$second';
  }


}
