package Filter;


import model.Account;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter(urlPatterns={"/admin/*"})
public class Admin implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpRespone = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();
        Account account = (Account) session.getAttribute("user");
        boolean check = account==null;

        if(check) {
            httpRespone.sendRedirect(httpRequest.getContextPath()+"/anime-main/login.jsp");
            return;
        }if(!check&& !account.isManager()) {
            httpRespone.getWriter().println("bạn không có đủ quyền hạn");
            return;
        }

        chain.doFilter(request, response);
    }
}
