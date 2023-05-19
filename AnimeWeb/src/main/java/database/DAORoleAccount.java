package database;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.jdbi.v3.core.Jdbi;

import model.Account;
import model.Role;

public class DAORoleAccount {
	public DAORoleAccount() {

	}

	public List<Role> getUnableAddRoles(Account account) {
		List<Role> listRole = new ArrayList<>();
		Role role;
		Jdbi me;
		if (!account.isManager()) {
			role = new Role(Role.manager, Role.getDescriptionById(Role.manager));
			listRole.add(role);
			return listRole;
		}
		me = JDBiConnector.me();
		String query = "select distinct id,description from animeweb.roles where id not in(select idRole from animeweb.account_roles where idAccount=:idUser) and id <>1";
		listRole = me.withHandle(handle -> {
			return handle.createQuery(query).bind("idUser", account.getId()).mapToBean(Role.class).stream()
					.collect(Collectors.toList());
		});

		return listRole;
	}

	public boolean addRoleUser(int idUser, int idRole) {
		Jdbi me = JDBiConnector.me();
		String query = "INSERT INTO animeweb.account_roles (idAccount, idrole) VALUES (:idUser, :idrole);";
		return me.withHandle(handle -> {
			return handle.createUpdate(query).bind("idUser", idUser).bind("idrole", idRole).execute();
		}) == 1;
	}

	public void removeAllManagerRole(int idUser) {
		Jdbi me = JDBiConnector.me();
		String query = "delete account_roles from account_roles where idAccount=:idUser and idrole<>1 ;";
		me.withHandle(handle -> {
			return handle.createUpdate(query).bind("idUser", idUser).execute();
		});
	}

	public boolean removeRoleUser(int idUser, int idRole) {
		Jdbi me = JDBiConnector.me();
		if(idRole==Role.manager) {
			removeAllManagerRole(idUser);
		}
		String query = "delete account_roles from account_roles where idAccount=:idUser and idrole=:idrole";
		return me.withHandle(handle -> {
			return handle.createUpdate(query).bind("idUser", idUser).bind("idrole", idRole).execute();
		}) == 1;
	}

	public static void main(String[] args) {
		List<Role> updateRoleUser = new DAOAccounts().getRoleUser(14);
		for (Role r : updateRoleUser) {
			System.out.println(r);
		}
	}
}
