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
public class AdminAccountFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletRespone = (HttpServletResponse) response;
        HttpSession session = httpServletRequest.getSession();

        Account account = (Account) session.getAttribute("user");
        String url = httpServletRequest.getRequestURL().toString();
        boolean check = url.endsWith("User-List.jsp")||url.endsWith("User-Edit.jsp")||url.endsWith("UserEdit")||url.endsWith("UserList")||url.endsWith("UserAdd")||url.endsWith("User-Add.jsp");
        //httpServletRequest.setAttribute("realPath", httpServletRequest.getServletContext().getRealPath("/"));
        if (check && !account.isAccountManager()) {
            httpServletRespone.setContentType("text/html;charset=UTF-8");
            httpServletRespone.getWriter().print("Bạn không đủ quyền hạn");
            return;
        }

        chain.doFilter(request, response);
    }
}
