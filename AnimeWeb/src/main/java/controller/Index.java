package controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import database.DAOMovie;
import model.Account;
import model.LocalDateTimeAdapter;
import model.Movie;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/anime-main/Index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		Gson gson = new GsonBuilder()
				.registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
				.create();
		try {
			String indexNumber = request.getParameter("index");
			int index = indexNumber == null ? 0 : Integer.parseInt(indexNumber);
			String param = request.getParameter("filter") == null ? "isAtoZ" : request.getParameter("filter");
			HttpSession session = request.getSession();
			Account user = (Account) session.getAttribute("user");
			boolean isAtoZ = Boolean.parseBoolean(request.getParameter("isAtoZ"));
			boolean isDescPrice = Boolean.parseBoolean(request.getParameter("isDescPrice"));
			boolean isDescDate = Boolean.parseBoolean(request.getParameter("isDescDate"));

			DAOMovie daoMovie = new DAOMovie();
			int calcPage = daoMovie.totalMovie() / 9;
			int totalMovie = daoMovie.totalMovie() % 9 == 0 ? calcPage : calcPage + 1;
			List<Movie> renderMovies = daoMovie.renderMovie(index * 9, 9, param);
			List<Integer> purchasedIds = new ArrayList<>();




			session.setAttribute("purchasedIds", purchasedIds);

			request.setAttribute("renderMovies", renderMovies);
			request.setAttribute("totalMovie", totalMovie);
			request.setAttribute("index", index);
			request.setAttribute("param", param);
			request.getSession().removeAttribute("order");

			request.getRequestDispatcher("/anime-main/index.jsp").forward(request, response);
		} catch (Exception e) {
//				response.getWriter().println("<img class=\"rsImg\" src=\"/AnimeWeb/error.png"+"\">");
			response.getWriter().println(e.getMessage());

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
