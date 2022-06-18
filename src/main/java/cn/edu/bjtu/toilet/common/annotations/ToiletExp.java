package cn.edu.bjtu.toilet.common.annotations;

import java.lang.annotation.*;

@Retention(RetentionPolicy.RUNTIME)
@Target( value = {ElementType.METHOD, ElementType.TYPE})
@Documented
@Inherited
public @interface ToiletExp {
}
