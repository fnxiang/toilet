package cn.edu.bjtu.toilet.domain.vo;

import cn.edu.bjtu.toilet.constant.ResultCode;
import cn.edu.bjtu.toilet.constant.StatusCode;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ResultVO {

    private Boolean success;

    // 状态码
    private int code;

    // 状态信息
    private String msg;

    private Object data;

    // 手动设置返回vo
    public ResultVO(int code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    // 默认返回成功状态码，数据对象
    public ResultVO(Object data) {
        this.code = ResultCode.SUCCESS.getCode();
        this.msg = ResultCode.SUCCESS.getMsg();
        this.success = Boolean.TRUE;
        this.data = data;
    }

    // 返回指定状态码，数据对象
    public ResultVO(StatusCode statusCode, Object data) {
        this.code = statusCode.getCode();
        this.msg = statusCode.getMsg();
        this.data = data;
    }

    // 只返回状态码
    public ResultVO(StatusCode statusCode) {
        this.code = statusCode.getCode();
        this.msg = statusCode.getMsg();
        this.data = null;
    }

    public static ResultVO success() {
        ResultVO resultVO = new ResultVO();
        resultVO.code = ResultCode.SUCCESS.getCode();
        resultVO.msg = ResultCode.SUCCESS.getMsg();
        resultVO.success = Boolean.TRUE;
        return resultVO;
    }

    public static ResultVO failed(String msg) {
        ResultVO resultVO = new ResultVO();
        resultVO.code = ResultCode.FAILED.getCode();
        resultVO.msg = msg;
        resultVO.success = Boolean.FALSE;
        return resultVO;
    }
}
