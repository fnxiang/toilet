package cn.edu.bjtu.toilet.intercepter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Objects;

@Component
public class AuthInterceptor implements HandlerInterceptor {
    private final Logger logger = LoggerFactory.getLogger(getClass());

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        logger.info("AuthInterceptor received request, URI:{}, session: {}", request.getRequestURI(), request.getSession().toString());
        if (Objects.isNull(request.getSession())) {
            return false;
        }

        String uId = (String) request.getSession().getAttribute("uId");
        String role = (String) request.getSession().getAttribute("role");


        if (!StringUtils.isEmpty(uId)&&!StringUtils.isEmpty(role)) {
            logger.info("try authenticate by role");

            String uri = request.getRequestURI();
            String param = request.getQueryString();

            if (!Objects.isNull(param) && param.contains(role)) {
                return true;
            }

            return uri.contains(role);
        }
        response.sendRedirect("/toilet/login/index");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
