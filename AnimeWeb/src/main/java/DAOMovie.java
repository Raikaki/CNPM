package database;

import model.*;
import org.jdbi.v3.core.Jdbi;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

public class DAOMovie {
    public DAOMovie(){

    }
    public static List<Genre> listGenreHeader(){
        String query="select id,description from genres where status=1";
        Jdbi me = JDBiConnector.me();
        return me.withHandle(handle->{
            return handle.createQuery(query).mapToBean(Genre.class).list();
        });
    }
    public List<Producer> getProducers(int idMovie){
        String query="SELECT distinct pr.id,pr.name,pr.description FROM movies m join movie_producers p on m.id = p.idMovie join producers pr on p.idproducer = pr.id where pr.status=1 and m.id=:idMovie;";
        Jdbi me = JDBiConnector.me();
        return me.withHandle(handle->{
           return handle.createQuery(query).bind("idMovie",idMovie).mapToBean(Producer.class).list();
        });
    }
    public Bonus getMaxPercentSale(int idMovie){
        String query="SELECT id,percent,status\n" +
                "FROM bonus_movies\n" +
                "WHERE (idProducer IN (SELECT idProducer FROM movie_producers WHERE idMovie =:idMovie and status=1)\n" +
                "    OR idGenre IN (SELECT idGenre FROM movie_genres WHERE idMovie =:idMovie and status=1)\n" +
                "    OR idMovie =:idMovie and status=1)   \n" +
                "    AND dayBegin <= CURDATE()\n" +
                "  AND dayEnd >= CURDATE() and status=1  and percent is not null\n" +
                "order by percent DESC limit 1;";
        Jdbi me = JDBiConnector.me();
        return me.withHandle(handle->{
            return handle.createQuery(query).bind("idMovie",idMovie).mapToBean(Bonus.class).findFirst().orElse(new Bonus());
        });
    }
    public Bonus getMaxUnitPrice(int idMovie){
        String query="SELECT id,unitPrice,status\n" +
                "FROM bonus_movies\n" +
                "WHERE (idProducer IN (SELECT idProducer FROM movie_producers WHERE idMovie =:idMovie and status=1)\n" +
                "    OR idGenre IN (SELECT idGenre FROM movie_genres WHERE idMovie =:idMovie and status=1)\n" +
                "    OR idMovie =:idMovie and status=1)   \n" +
                "    AND dayBegin <= CURDATE()\n" +
                "  AND dayEnd >= CURDATE() and status=1  and unitPrice is not null\n" +
                "order by unitPrice DESC limit 1;";
        Jdbi me = JDBiConnector.me();
        return me.withHandle(handle->{
            return handle.createQuery(query).bind("idMovie",idMovie).mapToBean(Bonus.class).findFirst().orElse(new Bonus());
        });
    }
    public Bonus getMinSamePrice(int idMovie){
        String query="SELECT id,samePrice,status\n" +
                "FROM bonus_movies\n" +
                "WHERE (idProducer IN (SELECT idProducer FROM movie_producers WHERE idMovie =:idMovie and status=1)\n" +
                "    OR idGenre IN (SELECT idGenre FROM movie_genres WHERE idMovie =:idMovie and status=1)\n" +
                "    OR idMovie =:idMovie and status=1)   \n" +
                "    AND dayBegin <= CURDATE()\n" +
                "  AND dayEnd >= CURDATE() and status=1  and samePrice is not null\n" +
                "order by samePrice ASC limit 1;";
        Jdbi me = JDBiConnector.me();
        return me.withHandle(handle->{
            return handle.createQuery(query).bind("idMovie",idMovie).mapToBean(Bonus.class).findFirst().orElse(new Bonus());
        });
    }
    public int getViewsMovie(int idMovie){
        String query="select count(*) from user_views where idMovie =:idMovie;";
        Jdbi me = JDBiConnector.me();
        return me.withHandle(handle->{
           return handle.createQuery(query).bind("idMovie",idMovie).mapTo(Integer.class).findOne().orElse(0);
        });
    }
    public Movie getMoviebyId(int idMovie){
        String query="select id,name,currentEpisode,totalEpisode,descriptionVN,descriptionEN,price from movies where id=:idMovie and status=1;";
        Jdbi me = JDBiConnector.me();
        Movie result;
        result = me.withHandle(handle->{
           return handle.createQuery(query).bind("idMovie",idMovie).mapToBean(Movie.class).findFirst().orElse(new Movie());
        });

        result.setAvatars(getAvatarMovie(result.getId()));
        result.setGenres(getListGenre(result.getId()));
        result.setType(getTypeMovie(result.getId()));
        result.setViews(getViewsMovie(result.getId()));
        result.setMaxPercent(getMaxPercentSale(result.getId()));
        result.setMinSamePrice(getMinSamePrice(result.getId()));

        result.setListProducer(getProducers(result.getId()));
        return result;
    }

    public List<Genre> getListGenre(int idMovie){
        String query="select distinct g.id,g.description from movie_genres mvg join genres g on mvg.idGenre = g.id and mvg.idMovie =:idMovie and g.status=1;";
        Jdbi me = JDBiConnector.me();
        return me.withHandle(handle->{
            return handle.createQuery(query).bind("idMovie",idMovie).mapToBean(Genre.class).list();
        });
    }
    public List<Movie> getPurchasedMovie(int idUser){
        String query="SELECT m.id,m.name,totalEpisode,m.currentEpisode,pc.purchaseAt,pc.purchasePrice FROM movies_purchased pc join movies m on pc.idMovie= m.id where idAccount=:idUser and m.status=1;";
        Jdbi me = JDBiConnector.me();
        List<Movie>result = me.withHandle(handle -> {
            return handle.createQuery(query).bind("idUser",idUser).mapToBean(Movie.class).list();
        });
        for(Movie m : result){
            m.setAvatars(getAvatarMovie(m.getId()));
            m.setGenres(getListGenre(m.getId()));
            m.setType(getTypeMovie(m.getId()));
            m.setViews(getViewsMovie(m.getId()));
        }
        return result;
    }
   public int totalMovie(){
        String query="select count(*) from movies;";
        Jdbi me = JDBiConnector.me();
        return me.withHandle(handle->{
           return handle.createQuery(query).mapTo(Integer.class).one();
        });
   }
    public List<Movie> renderMovie(int index,int totalItem,String param){
        List<Movie> result;
        Map<String,String> nameOrder = new HashMap<>();
        nameOrder.put("isAtoZ","name");
        nameOrder.put("notAtoZ","name");
        nameOrder.put("isDescPrice","price");
        nameOrder.put("notDescPrice","price");
        nameOrder.put("isDescDate","createAt");
        nameOrder.put("notDescDate","createAt");
        Map<String,String> sort = new HashMap<>();
        sort.put("isAtoZ","asc");
        sort.put("notAtoZ","desc");
        sort.put("isDescPrice","desc");
        sort.put("notDescPrice","asc");
        sort.put("isDescDate","desc");
        sort.put("notDescDate","asc");
        String order =  "order by " + nameOrder.get(param)+" "+sort.get(param);
        String query="select id,name,currentEpisode,totalEpisode,descriptionVN,descriptionEN,typeID,price,status\n" +
                "from movies\n" +
                "where status=1\n" +
                order+
        " limit :totalItem offset :index\n" +
                ";";

        Jdbi me = JDBiConnector.me();
        result = me.withHandle(handle->{
           return handle.createQuery(query).bind("totalItem",totalItem).bind("index",index).mapToBean(Movie.class).list();
        });
        for(Movie m : result){
            m.setAvatars(getAvatarMovie(m.getId()));
            m.setGenres(getListGenre(m.getId()));
            m.setType(getTypeMovie(m.getId()));
            m.setViews(getViewsMovie(m.getId()));
            m.setMaxPercent(getMaxPercentSale(m.getId()));
            m.setMinSamePrice(getMinSamePrice(m.getId()));


        }
        return result;
    }
    public List<Movie> getMoviesFollow(int idUser){
        String query ="SELECT m.id,m.name,totalEpisode,m.currentEpisode,m.price,f.followAt FROM follows f join movies m on f.idMovie= m.id where idAccount=:idUser and m.status=1";
        Jdbi me = JDBiConnector.me();

        List<Movie> result = me.withHandle(handle ->{
            return handle.createQuery(query).bind("idUser",idUser).mapToBean(Movie.class).list();
        });
        for(Movie m : result){
            m.setAvatars(getAvatarMovie(m.getId()));
            m.setGenres(getListGenre(m.getId()));
            m.setType(getTypeMovie(m.getId()));
            m.setViews(getViewsMovie(m.getId()));
            m.setMaxPercent(getMaxPercentSale(m.getId()));
            m.setMinSamePrice(getMinSamePrice(m.getId()));


        }
        return result;
    }

    public List<AvartarMovie> getAvatarMovie(int idMovie){
        String query ="SELECT name FROM avatars_movie where idMovie=:idMovie;";
        Jdbi me = JDBiConnector.me();
        List<AvartarMovie> result = me.withHandle(handle->{
            return handle.createQuery(query).bind("idMovie",idMovie).mapToBean(AvartarMovie.class).list();
        });
        return result;
    }
    public TypeMovie getTypeMovie(int idMovie){
        String query="select t.id,t.description from movies m join types_movie t on m.typeID = t.id where m.id=:idMovie;";
        Jdbi me = JDBiConnector.me();
        return me.withHandle(handle->{
           return handle.createQuery(query).bind("idMovie",idMovie).mapToBean(TypeMovie.class).one();
        });
    }
    public int getDetailMoviePurchased(int idAccount,int idMovie){
        int check;
        String query = "select  idMovie FROM movies_purchased where idMovie=:idMovie and idAccount=:idAccount;";
        Jdbi me = JDBiConnector.me();
        return me.withHandle(handle->{
            return handle.createQuery(query).bind("idMovie",idMovie).bind("idAccount",idAccount).mapTo(Integer.class).findOne().orElse(0);
        });

    }

    public List<AvartarMovie> getFirstAvt(int idMovie) {
        Jdbi me = JDBiConnector.me();
        String query = "SELECT name,id FROM avatars_movie where idMovie=:idMovie LIMIT 1";
        return me.withHandle(handle -> {
            return handle.createQuery(query).bind("idMovie", idMovie).mapToBean(AvartarMovie.class).list();
        });
    }


    public static void main(String[] args) {
//        System.out.println(DAOMovie.views(10));
//          System.out.println(new DAOMovie().getMaxPercentSale(15));
//        System.out.println(new DAOMovie().getMinSamePrice(10));
//        System.out.println(new DAOMovie().getMaxUnitPrice(10));
//        System.out.println(new DAOMovie().getMaxUnitPrice(11));
//        System.out.println(new DAOMovie().getMaxUnitPrice(14));
//        System.out.println(new DAOMovie().getMaxUnitPrice(15));
//        System.out.println(new DAOMovie().getMaxUnitPrice(16));
//        System.out.println(new DAOMovie().getMaxUnitPrice(17));
//        System.out.println(new DAOMovie().getMaxUnitPrice(18));
//        System.out.println(new DAOMovie().getMaxUnitPrice(19));
//        System.out.println(new DAOMovie().renderMovie(0,8,true,false,false));
//        System.out.println(new DAOMovie().renderMovie(8,8,true,false,false));
//        System.out.println(new DAOMovie().getMoviebyId(14));
//        System.out.println(new DAOMovie().getMoviebyId(14).getRenderPrice());
//        System.out.println(new DAOMovie().getProducers(10));
//        System.out.println(new DAOMovie().totalMovie());

//        System.out.println(new DAOMovie().renderMovie(0,9,"isAtoZ"));
//        System.out.println(DAOMovie.getListGenreHeader());
//        System.out.println(new DAOMovie().getPurchasedMovie(1));
    }


}
