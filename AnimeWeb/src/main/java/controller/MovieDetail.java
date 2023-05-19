package controller;

import database.DAOMovie;
import model.Account;
import model.Movie;

import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "MovieDetail", value = "/anime-main/MovieDetail")
public class MovieDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("user");
        try{
            boolean isFollow=false;
            int idMovie = Integer.parseInt(request.getParameter("idMovie"));
            DAOMovie daoMovie = new DAOMovie();
            Movie movie = daoMovie.getMoviebyId(idMovie);
            request.setAttribute("movie",movie);
            request.setAttribute("idMovie",idMovie);
            if(user!= null){
                int purchasedId = daoMovie.getDetailMoviePurchased(user.getId(), idMovie);

                session.setAttribute("purchasedId",purchasedId);

            }

            request.getRequestDispatcher("/anime-main/anime-detail.jsp").forward(request,response);
        }catch( Exception e){
            e.printStackTrace();
            request.getRequestDispatcher("/anime-main/Index").forward(request,response);
        }




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
