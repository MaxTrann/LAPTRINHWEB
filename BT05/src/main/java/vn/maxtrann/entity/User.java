package vn.maxtrann.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;

@Entity
@Table(name = "users")
@NamedQuery(name = "User.findAll", query = "SELECT c FROM User c")

public class User implements Serializable{

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "username", columnDefinition = "nvarchar(200)")
	private String username;
	
	@Column(name = "email", columnDefinition = "nvarchar(200)")
	private String email;
	
	@Column(name = "password", columnDefinition = "nvarchar(200)")
	private String password;
	
	@Column(name = "fullname", columnDefinition = "nvarchar(200)")
	private String fullname;

	@Column(name = "phone", columnDefinition = "nvarchar(200)")
	private String phone;

	@Column(name = "images", columnDefinition = "NVARCHAR(200)")
	private String images;

	@Column(name = "role", columnDefinition = "INT")
	private int role;

	
	public User() {
		super();
	}


	public User(int id, String name, String email, String password, String fullname, String phone, String images,
			int role) {
		super();
		this.id = id;
		this.username = name;
		this.email = email;
		this.password = password;
		this.fullname = fullname;
		this.phone = phone;
		this.images = images;
		this.role = role;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String name) {
		this.username = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getFullname() {
		return fullname;
	}


	public void setFullname(String fullname) {
		this.fullname = fullname;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getImages() {
		return images;
	}


	public void setImages(String images) {
		this.images = images;
	}


	public int getRole() {
		return role;
	}


	public void setRole(int role) {
		this.role = role;
	}
	
	
}