package com.versace.models;

public class UserDetails {
	private String firstName;
    private String lastName;
    private String username;
    private String address;
    private String email;
    private String password;
    private String userImage;
    private int contact;
	public UserDetails(String firstName, String lastName, String username, String address, String email,
			String password, String userImage, int contact) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.address = address;
		this.email = email;
		this.password = password;
		this.userImage = userImage;
		this.contact = contact;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
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
	public String getUserImage() {
		return userImage;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}
	public int getContact() {
		return contact;
	}
	public void setContact(int contact) {
		this.contact = contact;
	}
}
