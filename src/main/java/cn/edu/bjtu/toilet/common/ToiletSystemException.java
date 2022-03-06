package cn.edu.bjtu.toilet.common;

import lombok.Data;

@Data
public class ToiletSystemException extends RuntimeException {

    private String errorCode;

    private String info;

    private static final  StackTraceElement UNKNOWN_CALLER = new StackTraceElement("unknown", "unknown", "unknown", 0);

    public ToiletSystemException(String message, String code) {
        super(message);
        this.errorCode = code;
    }
}
