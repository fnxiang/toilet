package cn.edu.bjtu.toilet.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

    public static String toStandardFormat(Date time) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        return dateFormat.format(time);
    }
}
