package com.demo;

public class Hotel {
    private String chain_name;
    private int street_number;
    private String street_name;
    private String city;
    private String stateProvince;
    private String zip;
    private int num_of_rooms;
    private String contact_email;
    private String category;

    public Hotel(String chain_name, int street_number, String street_name, String city, String stateProvince, String zip, int num_of_rooms, String contact_email, String category) {
        this.chain_name = chain_name;
        this.street_number = street_number;
        this.street_name = street_name;
        this.city = city;
        this.stateProvince = stateProvince;
        this.zip = zip;
        this.num_of_rooms = num_of_rooms;
        this.contact_email = contact_email;
        this.category = category;
    }

    public String getChain_name() {
        return chain_name;
    }

    public void setChain_name(String chain_name) {
        this.chain_name = chain_name;
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

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public int getNum_of_rooms() {
        return num_of_rooms;
    }

    public void setNum_of_rooms(int num_of_rooms) {
        this.num_of_rooms = num_of_rooms;
    }

    public String getContact_email() {
        return contact_email;
    }

    public void setContact_email(String contact_email) {
        this.contact_email = contact_email;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Hotel{" +
                "chain_name='" + chain_name + '\'' +
                ", street_number=" + street_number +
                ", street_name='" + street_name + '\'' +
                ", city='" + city + '\'' +
                ", stateProvince='" + stateProvince + '\'' +
                ", zip='" + zip + '\'' +
                ", num_of_rooms=" + num_of_rooms +
                ", contact_email='" + contact_email + '\'' +
                ", category='" + category + '\'' +
                '}';
    }
}
