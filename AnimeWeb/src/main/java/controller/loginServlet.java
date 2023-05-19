package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Log.Log;
import database.DAOAccounts;

import database.JDBiConnector;
import model.Account;
import model.Encode;

@WebServlet("/anime-main/login")
public class loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    Encode encrypt = new Encode();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        // 2.1. Truy cập vào chức năng từ login.jsp dòng 159
        // 2.2.Nhập dữ liệu userName password vào form login ở trang login.jsp dòng 267
        // 2.3. Khi ấn sumit tại dòng 281 thì sẽ nhận dữ liệu trong các thẻ input và gửi dữ liệu sang servlet để gọi phương thức login
        String userName = request.getParameter("loginName");
        String passWord = request.getParameter("loginPassword");
        HttpSession session = request.getSession();
        String error = String.valueOf(session.getAttribute("countError"));
        String encryptPass = encrypt.toSHA1(passWord);
        Account user = null;
        DAOAccounts daoAccount = new DAOAccounts();
        String ipClient = request.getRemoteAddr();

        Log log = new Log(Log.INFO, -1, ipClient, "LoginServlet", null, 0);

        String direct = "/anime-main/login.jsp";

        try {

//			2.4. Gọi phương thức login từ DAOAccount tại dòng 26
            user = daoAccount.Login(userName, encryptPass);
            // 5. DAOAccount sẽ lấy dữ từ database tên animeweb
            // loginServlet sẽ nhận lại thông tin user do DAOAccounts trả về
//          2.6.1. kiểm tra xem user có tồn tại hay không
            if (user != null) {
                log.setUserId(user.getId());
                // 2.8.1.Kiểm tra xem tài khoản có bị khóa hay không
                if (user.getIsActive() == 1) {
                    // 2.9.Kiểm tra xem tài khoản có phải là admin hay không gọi tới phương thức isAdmin ở Account dòng 159
                    if (user.isAdmin()) {
                        // 2.10.1. Gọi quyền admin của tài khoản dùng cho phiên đăng nhập của tài khoản lưu session cho phiên làm việc
                        session.setAttribute("user", user);
                        // 2.11.1. Điều hướng admin đến trang admin
                        request.getRequestDispatcher("/anime-main/admin.jsp").forward(request, response);
                        return;
                    }
                    // 2.10.2. Gọi quyền user của tài khoản dùng cho phiên đăng nhập của tài khoản lưu session cho phiên làm việc
                    session.setAttribute("user", user);
                    System.out.println(user);
                    session.removeAttribute("countError");
                    // 2.11.2. Điều hướng admin đến trang index.jsp
                    direct = "/anime-main/Index";
                    session.removeAttribute("errorLogin");
                    log.setContent("Login sucess");


                } else {
                    //2.8.2 Nếu tài khoản bị khóa thì Gửi atrribute cho trang login tại dòng 290 thông tin là tài khoản đã bị khóa và dừng phương thức login
                    session.setAttribute("errorLogin", "Tài khoản của bạn đã bị khóa do nhập sai quá nhiều lần, vui lòng liên hệ quản trị viên để mở khóa");

                    log.setContent("Account has been locked");

                }
            } else {
                // 2.7.1 Hệ thống kiểm tra tài khoản đang được đăng nhập có đúng mật khẩu đã lưu của user đang được đăng nhập hay không
                int idUser = daoAccount.findIdByUserName(userName);
                int countError = 1;
                if (idUser != -1) {
                    log.setUserId(idUser);
                    String oldUserName = (String) session.getAttribute("oldUserName");
                    //2.7.2 Nếu có tồn tại tài khoản mà người dung nhập sai mật khẩu thì sẽ Gửi atrribute cho trang login tại dòng 290 là sai mật khẩu và dừng phương thức login
                    session.setAttribute("errorLogin", "Sai mật khảu");
                    if (!error.equals("null")) {
                        if (userName.equalsIgnoreCase(oldUserName)) {
                            countError = Integer.parseInt(error) + 1;
                        } else {
                            session.setAttribute("oldUserName", userName);
                        }

                    }

                    log.setContent("login fail");
                    log.setLevel(Log.ALERT);
                    session.setAttribute("countError", countError);

                    if (countError >= 5) {

                        daoAccount.blockAccount(idUser);
                        log.setLevel(Log.DANGER);
                        log.setContent("Lock account");

                        session.setAttribute("errorLogin", "Tài khoản của bạn đã bị khóa do nhập sai quá nhiều lần, vui lòng liên hệ quản trị viên để mở khóa");

                    }

                } else {

                    log.setContent("login fail");
                    log.setLevel(Log.ALERT);
                    //2.6.2 Gửi atrribute cho trang login tại dòng 290 là không tồn tại tài khoản và dừng phương thức login
                    session.setAttribute("errorLogin", "Tài khoản không tồn tại");

                }
            }

            new JDBiConnector().insert(log);
            response.sendRedirect(getServletContext().getContextPath() + direct);

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<img class=\"rsImg\" src=\"/AnimeWeb/error.png" + "\">");
        }


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);
    }

}
