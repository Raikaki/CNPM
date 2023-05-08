package model;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import database.DAOAccounts;



public class Account {
	private int id;
	private String userName;
	private String password;
	private String email;
	private String avatar;
	private AccountType type;
	private int isActive;
	private List<Role> roles;
	private int isadmin;
	private List<Movie> moviesFollow;
	private List<Movie> moviesPurchased;
	private LocalDateTime joinDate;
	private String fullName;
	private String phone;
	private double balance;

	public int getIsadmin() {
		return isadmin;
	}

	public void setIsadmin(int isadmin) {
		this.isadmin = isadmin;
	}

	private int status;
	private String externalId;

	static Map<Integer, String> isActiveMapping = new HashMap<>();
	static {
		isActiveMapping.put(0, "Bị khóa");
		isActiveMapping.put(1, "Đang hoạt động");
	}
	public static int LOCK = 0;
	public static int ACTIVED = 1;
	public Account() {
	}
	public Account(int id) {
		this.id = id;
	}
	public static String getIsActiveDescription(int idIsActive) {
		return isActiveMapping.get(idIsActive);
	}

	public String getFullJoinDate() {
		return joinDate.getDayOfMonth()+"/"+joinDate.getMonthValue()+"/"+joinDate.getYear(); 
	}


	public String getTypeAccount(){
		return type.getDescription();
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public List<Movie> getMoviesPurchased() {
		return moviesPurchased;
	}

	public void setMoviesPurchased(List<Movie> moviesPurchased) {
		this.moviesPurchased = moviesPurchased;
	}

	public Account(LocalDateTime date) {
		this.joinDate = date;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String passWord) {
		this.password = passWord;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}



	public int getIsActive() {
		return isActive;
	}
	public String getIsActiveDescription() {
		return isActiveMapping.get(isActive);
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> listRole) {
		this.roles = listRole;
	}

	public boolean isManager() {
		if(isAdmin()) {
			return true;
		}
		if(isadmin ==Role.administrator) return true;
		for (Role role : roles) {
			if (role.getId() == Role.manager) {
				return true;
			}
		}
		return false;
	}
	// Phương thức dùng để kiểm tra có là admin hay không
	public boolean isAdmin() {
		if(isadmin ==6) return true;
		for (Role role : roles) {
			if (role.getId() == Role.administrator) {
				return true;
			}
		}

		return false;
	}
	public boolean isAccountManager() {
		if(isAdmin()) {
			return true;
		}
		for(Role role : roles) {
			if(role.getId()==Role.account_manager) {
				return isManager();
			}
		}
		return false;
	}

	public List<Movie> getMoviesFollow() {
		return moviesFollow;
	}

	public void setMoviesFollow(List<Movie> moviesFollow) {
		this.moviesFollow = moviesFollow;
	}

	public LocalDateTime getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(LocalDateTime joinDate) {
		this.joinDate = joinDate;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phoneNumber) {
		this.phone = phoneNumber;
	}

	public AccountType getType() {
		return type;
	}

	public void setType(AccountType type) {
		this.type = type;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public String getExternalId() {
		return externalId;
	}

	public void setExternalId(String externalId) {
		this.externalId = externalId;
	}

	@Override
	public String toString() {
		return "Account{" +
				"id=" + id +
				", userName='" + userName + '\'' +
				", password='" + password + '\'' +
				", email='" + email + '\'' +
				", avatar='" + avatar + '\'' +
				", type=" + type +
				", isActive=" + isActive +
				", roles=" + roles +
				", moviesFollow=" + moviesFollow +
				", moviesPurchased=" + moviesPurchased +
				", joinDate=" + joinDate +
				", fullName='" + fullName + '\'' +
				", phone='" + phone + '\'' +
				", balance=" + balance +
				", status=" + status +
				", externalId='" + externalId + '\'' +
				'}';
	}
//	public int getmyRate(int idMovie) throws ClassNotFoundException, SQLException {
//		Rate rate = new Rate();
//		int rs = rate.getRate(userName, idMovie);
//		return rs;
//	}

	public static void main(String[] args) {
//		Jdbi me = JDBiConnector.me();
//		List<Account> products = me.withHandle(handle -> {
//			return handle.createQuery("select * from accounts LIMIT 1 OFFSET 0").mapToBean(Account.class).stream()
//					.collect(Collectors.toList());
//		});
//		System.out.println(products);
		DAOAccounts daoAccount = new DAOAccounts();
		boolean check = daoAccount.blockAccount(6);
//		System.out.println(check);
	}
}
