package com.bankapp.pkg.models;

public class UserBean {
	private String username;
	private String password;
	private String firstName;
	private String lastName;
	private String phoneNo;
	private String sin;
	private String passportNo;
	private String address;
	private String zipCode;
	private String open_date;
	private String DOB;
	private boolean Chq_acc;
	private boolean sav_acc;
	private boolean credit_acc;
	public boolean valid;

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username the username to set
	 */
	public void setUserName(String newUsername) {
		username = newUsername;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * @return the phoneNo
	 */
	public String getPhoneNo() {
		return phoneNo;
	}

	/**
	 * @param phoneNo the phoneNo to set
	 */
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	/**
	 * @return the sin
	 */
	public String getSin() {
		return sin;
	}

	/**
	 * @param sin the sin to set
	 */
	public void setSin(String sin) {
		this.sin = sin;
	}

	/**
	 * @return the passportNo
	 */
	public String getPassportNo() {
		return passportNo;
	}

	/**
	 * @param passportNo the passportNo to set
	 */
	public void setPassportNo(String passportNo) {
		this.passportNo = passportNo;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * @return the zipCode
	 */
	public String getZipCode() {
		return zipCode;
	}

	/**
	 * @param zipCode the zipCode to set
	 */
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	/**
	 * @return the open_date
	 */
	public String getOpen_date() {
		return open_date;
	}

	/**
	 * @param open_date the open_date to set
	 */
	public void setOpen_date(String open_date) {
		this.open_date = open_date;
	}

	/**
	 * @return the dOB
	 */
	public String getDOB() {
		return DOB;
	}

	/**
	 * @param dOB the dOB to set
	 */
	public void setDOB(String dOB) {
		DOB = dOB;
	}

	/**
	 * @return the chq_acc
	 */
	public boolean isChq_acc() {
		return Chq_acc;
	}

	/**
	 * @param chq_acc the chq_acc to set
	 */
	public void setChq_acc(boolean chq_acc) {
		Chq_acc = chq_acc;
	}

	/**
	 * @return the sav_acc
	 */
	public boolean isSav_acc() {
		return sav_acc;
	}

	/**
	 * @param sav_acc the sav_acc to set
	 */
	public void setSav_acc(boolean sav_acc) {
		this.sav_acc = sav_acc;
	}

	/**
	 * @return the credit_acc
	 */
	public boolean isCredit_acc() {
		return credit_acc;
	}

	/**
	 * @param credit_acc the credit_acc to set
	 */
	public void setCredit_acc(boolean credit_acc) {
		this.credit_acc = credit_acc;
	}

	/**
	 * @return the valid
	 */
	public boolean isValid() {
		return valid;
	}

	/**
	 * @param valid the valid to set
	 */
	public void setValid(boolean valid) {
		this.valid = valid;
	}

}
