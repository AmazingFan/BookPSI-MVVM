package com.yf.bookpsi.pojo;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "role")
public class Role  {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	private String name;

	private String zhname;

	private boolean enabled;
	@Transient
	private List<Permission> perms;
	@Transient
	private List<Menu> menus;

	public List<Permission> getPerms() {
		return perms;
	}

	public void setPerms(List<Permission> perms) {
		this.perms = perms;
	}

	public List<Menu> getMenus() {
		return menus;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getZhname() {
		return zhname;
	}

	public void setZhname(String zhname) {
		this.zhname = zhname;
	}

	public boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
}
