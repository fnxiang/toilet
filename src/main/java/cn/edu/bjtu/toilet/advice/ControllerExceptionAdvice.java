package cn.edu.bjtu.toilet.advice;

import cn.edu.bjtu.toilet.common.exception.APIException;
import cn.edu.bjtu.toilet.common.exception.ToiletBizException;
import cn.edu.bjtu.toilet.common.exception.ToiletSystemException;
import cn.edu.bjtu.toilet.constant.ResultCode;
import cn.edu.bjtu.toilet.domain.vo.ResultVO;
import org.springframework.validation.BindException;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

public class ControllerExceptionAdvice {

    @ExceptionHandler({Exception.class, BindException.class})
    @ResponseBody
    public ResultVO MethodArgumentNotValidExceptionHandler(BindException e) {
        // 从异常对象中拿到ObjectError对象
        ObjectError objectError = e.getBindingResult().getAllErrors().get(0);
        return new ResultVO(ResultCode.VALIDATE_ERROR, objectError.getDefaultMessage());
    }

    @ExceptionHandler({APIException.class, ToiletBizException.class, ToiletSystemException.class})
    @ResponseBody
    public ResultVO APIExceptionHandler(APIException e) {
        // log.error(e.getMessage(), e); 由于还没集成日志框架，暂且放着，写上TODO
        return new ResultVO(e.getCode(), e.getMsg(), e.getMessage());
    }
}
