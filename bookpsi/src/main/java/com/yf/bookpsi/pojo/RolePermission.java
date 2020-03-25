package com.yf.bookpsi.pojo;

import javax.persistence.*;

@Entity
@Table(name = "role_permission")
public class RolePermission  {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	private int roleid;

	private int permissid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRoleid() {
		return roleid;
	}

	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}

	public int getPermissid() {
		return permissid;
	}

	public void setPermissid(int permissid) {
		this.permissid = permissid;
	}
}
