package database;

import java.io.FileNotFoundException;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.List;

import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

import model.*;
import org.jdbi.v3.core.Jdbi;

public class DAOAccounts {

    public DAOAccounts() {

    }

    // 2.5 DAOAccount sẽ lấy dữ từ database tên animeweb và trả về dữ liệu người dùng
    public Account Login(String userName, String passWord) throws SQLException, FileNotFoundException {

        Account account = null;
        String query = "SELECT id,userName,password,email,avatar,isActive,fullName,phone,balance,status,externalId FROM accounts where userName= :UserName and password = :Password  and status=1 and typeId=1";
        Jdbi me = JDBiConnector.me();
        account = me.withHandle(handle -> {
            return handle.createQuery(query).bind("UserName", userName).bind("Password", passWord)
                    .mapToBean(Account.class).findFirst().orElse(null);

        });
        if (account != null) {
            account.setIsadmin(getRoleId(account.getId()));
            account.setRoles(getRoleUser(account.getId()));

        }
        return account;
    }

    public List<Role> getRoleUser(int idUser) {
        String query = "select a.idRole,description from account_roles a join roles r on a.idRole = r.id where a.idAccount=:idAccount";
        Jdbi me = JDBiConnector.me();
        return me.withHandle(handle -> {
            return handle.createQuery(query).bind("idAccount", idUser)
                    .map((resultSet, ctx) -> new Role(resultSet.getInt("idRole"), resultSet.getString("description")))
                    .list();
        });

    }

    public int getRoleId(int idUser) {
        String query = "SELECT r.id FROM account_roles a JOIN roles r ON a.idRole = r.id WHERE a.idAccount = :idAccount";
        Jdbi me = JDBiConnector.me();
        Integer roleId = me.withHandle(handle -> {
            Optional<Integer> result = handle.createQuery(query)
                    .bind("idAccount", idUser)
                    .mapTo(Integer.class)
                    .findFirst();
            return result.orElse(null);
        });
        return roleId != null ? roleId : 0;
    }


    public boolean blockAccount(int idUser) {
        Jdbi me = JDBiConnector.me();
        String query = "UPDATE `accounts` SET `isActive` = '0' WHERE (`id` =:idUser);";
        return me.withHandle(handle -> {
            return handle.createUpdate(query).bind("idUser", idUser).execute();
        }) == 1;
    }


    public int findIdByUserName(String userName) throws SQLException {
        int idUser = -1;
        Connection conn = DataSource.getConnection();
        PreparedStatement prepare = conn
                .prepareStatement("SELECT id FROM accounts where UserName=? and typeId=1 and status=1");
        prepare.setString(1, userName);
        ResultSet rs = prepare.executeQuery();
        if (rs.next()) {
            idUser = rs.getInt("id");
            return idUser;
        }
        return idUser;

    }

    public Account findUserByUserNameandEmail(String userName, String Email) {
        Jdbi me = JDBiConnector.me();
        String query = "SELECT id,UserName,Password,Email,avatar,typeId,isActive FROM accounts where UserName= :UserName or Email= :Email and typeId=1 and status=1";

        Account account;
        account = me.withHandle(handle -> {
            return handle.createQuery(query).bind("UserName", userName).bind("Email", Email).mapToBean(Account.class)
                    .findFirst().orElse(null);

        });
        return account;
    }


    public int findIdSocialUser(String externalId, String email) throws SQLException {
        int id;
        Jdbi me = JDBiConnector.me();

        String query = "SELECT id from accounts where externalId =:externalId and EMAIL=:Email";
        id = me.withHandle(handle -> {
            return handle.createQuery(query).bind("externalId", externalId).bind("Email", email).mapToBean(Account.class)
                    .findFirst().orElse(new Account()).getId();
        });
        return id;
    }

    public Account loginAccountSocialId(int idUser, int type) throws SQLException, FileNotFoundException {
        Account account = null;

        Jdbi me = JDBiConnector.me();
        String query = "SELECT id,UserName,Password,fullName,balance,Email,avatar,typeId,isActive FROM accounts where id=:idUser and typeId=:typeId and status=1";
        account = me.withHandle(handle -> {
            return handle.createQuery(query).bind("idUser", idUser).bind("typeId", type).mapToBean(Account.class)
                    .findFirst().orElse(null);
        });
        if (account != null) {
            account.setRoles(getRoleUser(idUser));
        }
        System.out.println(account);
        return account;
    }

    public int findIdUserAccount(String externalId, int type) throws SQLException {
        int id;

        Jdbi me = JDBiConnector.me();
        String query = "SELECT id from accounts where  externalId=:externalId and typeId =:typeId and status=1";
        id = me.withHandle(handle -> {
            return handle.createQuery(query).bind("externalId", externalId).bind("typeId", type).mapToBean(Account.class)
                    .findFirst().orElse(new Account()).getId();
        });
        return id;
    }

    public int addBaseUser(String userName, String password, String email, String fullName, String phoneNumber) {
        Encode encrypt = new Encode();
        String encryptPassword = encrypt.toSHA1(password);
        Jdbi me = JDBiConnector.me();
        String avatarPath = "/anime-main/storage/avatarUser/";

        final int[] idUserFinal = {-1};
        me.useHandle(handle -> {
            handle.begin();
            try {
                String query = "INSERT INTO accounts (userName, password,email,avatar,typeId,isActive,fullName,phone) VALUES (:Username,:Password,:Email,:avatar,1,1,:FullName,:PhoneNumber) ";
                int idUser = handle.createUpdate(query).bind("Username", userName).bind("Password", encryptPassword)
                        .bind("Email", email).bind("avatar", avatarPath + "defaultavatar.jpg")
                        .bind("FullName", fullName).bind("PhoneNumber", phoneNumber).executeAndReturnGeneratedKeys()
                        .mapTo(Integer.class).findFirst().orElse(-1);

                String query1 = "INSERT INTO  account_roles (idAccount, idRole) VALUES (:idUser,:idrole) ";
                handle.createUpdate(query1).bind("idUser", idUser).bind("idrole", Role.base_User).execute();
                handle.commit();
                idUserFinal[0] = idUser;
            } catch (Exception e) {
                e.printStackTrace();
                handle.rollback();

            }
        });
        return idUserFinal[0];

    }

    public void addGoogle(String externalId, String email, String userName, String avatar, String fullName, String phone)
            throws SQLException {

        Encode encrypt = new Encode();
        String pass = encrypt.toSHA1(externalId);

        Jdbi me = JDBiConnector.me();
        me.useHandle(handle -> {
            handle.begin();
            try {
                String query = "INSERT INTO accounts (Username, Password,Email,avatar,typeId,isActive,FullName,phone,externalId) VALUES (:Username,:Password,:Email,:avatar,2,1,:FullName,:PhoneNumber,:externalId) ";
                int idUser = handle.createUpdate(query).bind("Username", userName).bind("Password", pass)
                        .bind("Email", email).bind("avatar", avatar).bind("FullName", fullName)
                        .bind("PhoneNumber", phone).bind("externalId", externalId).executeAndReturnGeneratedKeys().mapTo(Integer.class).findFirst()
                        .orElse(-1);
                String query3 = "INSERT INTO  account_roles (idAccount, idrole) VALUES (:idUser,:idrole) ";
                handle.createUpdate(query3).bind("idUser", idUser).bind("idrole", Role.base_User).execute();
                handle.commit();
            } catch (Exception e) {
                e.printStackTrace();
                handle.rollback();

            }
        });

    }


    // log in withfb
    public Account checkAcountFacebook(String email, String idfb) throws SQLException, FileNotFoundException {
        Account account = null;
        String query = "SELECT a.idUser,a.UserName,a.Password,a.Email,a.avatar,a.typeId,a.isActive,fb.idFacebook FROM accounts a join accounts_facebook fb on a.idUser=fb.idUser where a.Email= ? and fb.idFacebook=? and a.typeId=3 and status=1;";

        Jdbi me = JDBiConnector.me();
        account = me.withHandle(handle -> {
            return handle.createQuery(query).bind(0, email).bind(1, idfb).mapToBean(Account.class).findFirst()
                    .orElse(null);

        });
        if (account != null) {
            account.setRoles(getRoleUser(account.getId()));
        }
        return account;

    }

    // add account fb if not exist on database
    public void createAccountByFB(String externalId, String email, String userName, String avatar, String fullName) throws SQLException {


        Encode encrypt = new Encode();
        String pass = encrypt.toSHA1(externalId);

        Jdbi me = JDBiConnector.me();
        me.useHandle(handle -> {
            handle.begin();
            try {
                String query = "INSERT INTO accounts (Username, Password,Email,avatar,typeId,isActive,FullName,phone,externalId) VALUES (:Username,:Password,:Email,:avatar,3,1,:FullName,null,:externalId) ";
                int idUser = handle.createUpdate(query).bind("Username", userName).bind("Password", pass)
                        .bind("Email", email).bind("avatar", avatar).bind("FullName", fullName)
                        .bind("externalId", externalId).executeAndReturnGeneratedKeys().mapTo(Integer.class).findFirst()
                        .orElse(-1);
                String query3 = "INSERT INTO  account_roles (idAccount, idrole) VALUES (:idUser,:idrole) ";
                handle.createUpdate(query3).bind("idUser", idUser).bind("idrole", Role.base_User).execute();
                handle.commit();
            } catch (Exception e) {
                e.printStackTrace();
                handle.rollback();

            }
        });

    }


    public static void main(String[] args) throws ClassNotFoundException, SQLException, FileNotFoundException {
//		System.out.println(new DAOAccounts().checkAcountFacebook("20130115@gmail.com", "12345678"));
//		new DAOAccounts().insertAcountFB("ádsada", "1231111", "he123he@gmail.com");
        // System.out.println(getListAccountNormal(0, 100).size());
        // System.out.println(getSizeListAccountNormal());
        //System.out.println(new DAOAccounts().getlistType());
//		System.out.println(new DAOAccounts().Login("admin","ZvniDNSIriVuH6j9pEQZHQey9e4="));
        //System.out.println(DAOAccounts.getPurchasedMovie(1));
//		System.out.println(new DAOAccounts().getListAccount(0,3));
//		System.out.println(new DAOAccounts().getSizeListAccountNormal());
        System.out.println(new DAOAccounts().getRoleId(1));

    }


}
