package com.demo;

public class Customer {

    private String SSNSIN;
    private String first_name;
    private String middle_name;
    private String last_name;
    private int street_number;
    private String street_name;
    private String city;
    private String stateProvince;
    private String apt_number;
    private String zip;
    private int room_number;
    private String registration_date;

    public Customer(String SSNSIN, String first_name, String middle_name, String last_name, int street_number, String street_name, String city, String stateProvince, String apt_number, String zip, int room_number, String registration_date) {
        this.SSNSIN = SSNSIN;
        this.first_name = first_name;
        this.middle_name = middle_name;
        this.last_name = last_name;
        this.street_number = street_number;
        this.street_name = street_name;
        this.city = city;
        this.stateProvince = stateProvince;
        this.apt_number = apt_number;
        this.zip = zip;
        this.room_number = room_number;
        this.registration_date = registration_date;
    }

    public String getSSNSIN() {
        return SSNSIN;
    }

    public void setSSNSIN(String SSNSIN) {
        this.SSNSIN = SSNSIN;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getMiddle_name() {
        return middle_name;
    }

    public void setMiddle_name(String middle_name) {
        this.middle_name = middle_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public int getStreet_number() {
        return street_number;
    }

    public void setStreet_number(int street_number) {
        this.street_number = street_number;
    }

    public String getStreet_name() {
        return street_name;
    }

    public void setStreet_name(String street_name) {
        this.street_name = street_name;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStateProvince() {
        return stateProvince;
    }

    public void setStateProvince(String stateProvince) {
        this.stateProvince = stateProvince;
    }

    public String getApt_number() {
        return apt_number;
    }

    public void setApt_number(String apt_number) {
        this.apt_number = apt_number;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public int getRoom_number() {
        return room_number;
    }

    public void setRoom_number(int room_number) {
        this.room_number = room_number;
    }

    public String getRegistration_date() {
        return registration_date;
    }

    public void setRegistration_date(String registration_date) {
        this.registration_date = registration_date;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "SSNSIN='" + SSNSIN + '\'' +
                ", first_name='" + first_name + '\'' +
                ", middle_name='" + middle_name + '\'' +
                ", last_name='" + last_name + '\'' +
                ", street_number=" + street_number +
                ", street_name='" + street_name + '\'' +
                ", city='" + city + '\'' +
                ", stateProvince='" + stateProvince + '\'' +
                ", apt_number='" + apt_number + '\'' +
                ", zip='" + zip + '\'' +
                ", room_number=" + room_number +
                ", registration_date='" + registration_date + '\'' +
                '}';
    }
}
