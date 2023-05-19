//package Filter;
//
//
//import java.io.IOException;
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//@WebFilter(urlPatterns={"/*"})
//public class Auth implements Filter {
//    public void init(FilterConfig config) throws ServletException {
//    }
//
//    public void destroy() {
//    }
//
//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
//        HttpServletRequest httpRequest = (HttpServletRequest) request;
//        HttpServletResponse httpRespone = (HttpServletResponse) response;
//        String url = httpRequest.getRequestURL().toString();
//        boolean check = url.endsWith(".jsp") && (url.endsWith("login.jsp") || url.endsWith("signup.jsp"));
//        if(check && httpRequest.getSession().getAttribute("user")!=null) {
//            httpRespone.sendRedirect(httpRequest.getContextPath()+"AnimeWeb/anime-main/Index");
//            return;
//
//        }
//        chain.doFilter(request, response);
//    }
//}
////package Filter;
////
////
////import java.io.IOException;
////import javax.servlet.Filter;
////import javax.servlet.FilterChain;
////import javax.servlet.FilterConfig;
////import javax.servlet.ServletException;
////import javax.servlet.ServletRequest;
////import javax.servlet.ServletResponse;
////import javax.servlet.annotation.WebFilter;
////
////import javax.servlet.http.HttpServletRequest;
////import javax.servlet.http.HttpServletResponse;
////import javax.servlet.http.HttpSession;
////
////@WebFilter(urlPatterns={"/*"})
////public class Auth implements Filter {
////    public void init(FilterConfig config) throws ServletException {
////    }
////
////    public void destroy() {
////    }
////
////    @Override
////    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
////        HttpServletRequest httpRequest = (HttpServletRequest) request;
////        HttpServletResponse httpRespone = (HttpServletResponse) response;
////        String url = httpRequest.getRequestURL().toString();
////        boolean check = url.endsWith(".jsp") && (url.endsWith("login.jsp") || url.endsWith("signup.jsp"));
////        if(check && httpRequest.getSession().getAttribute("user")!=null) {
////            httpRespone.sendRedirect(httpRequest.getContextPath()+"/anime-main/Index");
////            return;
////
////        }
////        chain.doFilter(request, response);
////    }
////}
