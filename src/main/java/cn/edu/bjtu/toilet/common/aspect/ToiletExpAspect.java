package cn.edu.bjtu.toilet.common.aspect;

import cn.edu.bjtu.toilet.common.ToiletBizException;
import cn.edu.bjtu.toilet.common.ToiletSystemException;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


@Aspect
@Component
public class ToiletExpAspect {

    private static final Logger LOGGER = LoggerFactory.getLogger("cn.edu.bjtu.toilet");

    @Pointcut("@annotation(cn.edu.bjtu.toilet.common.annotations.ToiletExp)")
    public void pointCut() {
    }

    @Around( value = "pointCut() && execution(* cn.edu.bjtu.toilet..*(..))")
    public Object aroundMethod(ProceedingJoinPoint jp) {
        try {
            return jp.proceed();
        } catch (ToiletBizException | ToiletSystemException e) {
            LOGGER.error("");
        } catch (Throwable e) {
            LOGGER.error("");
        }
        return null;
    }
}
