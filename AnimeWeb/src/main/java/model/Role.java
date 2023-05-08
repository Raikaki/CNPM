package model;

import java.util.HashMap;
import java.util.Map;

public class Role {
	private int id;
	private String description;
	public static int base_User = 1;
	public static int movie_manager = 2;
	public static int manager = 4;
	public static int content_manager = 5;
	public static int administrator = 6;
	public static int blog_manager = 7;
	public static int account_manager = 8;
	static Map<Integer, String> roleMapping = new HashMap<>();
	static {
		
		roleMapping.put(1, "base_User");
		roleMapping.put(2, "movie manager");
		roleMapping.put(4, "manager");
		roleMapping.put(5, "content manager");
		roleMapping.put(6, "administrator");
		roleMapping.put(7, "blog manager");
		roleMapping.put(8, "account manager");
	}

	public Role(int id, String description) {
		super();
		this.id = id;
		this.description = description;
	}
	public Role() {

	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public static String getDescriptionById(int id) {
		return roleMapping.get(id);
	}

	@Override
	public String toString() {
		return "Role{" +
				"id=" + id +
				", description='" + description + '\'' +
				'}';
	}
}
