package cn.edu.bjtu.toilet.common.exception;

import lombok.Data;

@Data
public class ToiletBizException extends RuntimeException {

    private Integer errorCode;

    private String info;

    private static final  StackTraceElement UNKNOWN_CALLER = new StackTraceElement("unknown", "unknown", "unknown", 0);

    public ToiletBizException(String message, Integer code) {
        super(message);
        this.errorCode = code;
    }
}
