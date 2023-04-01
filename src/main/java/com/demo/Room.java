package com.demo;

import java.sql.Date;

public class Room {

    private int street_number;
    private String street_name;
    private String city;
    private String stateProvince;
    private String zip;
    private int room_number;
    private double price;
    private int capacity;
    private String seaMountainView;
    private String problemsDamages;
    private Date check_in_date;
    private Date check_out_date;

    public Room(int street_number, String street_name, String city, String stateProvince, String zip, int room_number, double price, int capacity, String seaMountainView, String problemsDamages, Date check_in_date, Date check_out_date) {
        this.street_number = street_number;
        this.street_name = street_name;
        this.city = city;
        this.stateProvince = stateProvince;
        this.zip = zip;
        this.room_number = room_number;
        this.price = price;
        this.capacity = capacity;
        this.seaMountainView = seaMountainView;
        this.problemsDamages = problemsDamages;
        this.check_in_date = check_in_date;
        this.check_out_date = check_out_date;
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

    public int getRoom_number() {
        return room_number;
    }

    public void setRoom_number(int room_number) {
        this.room_number = room_number;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getSeaMountainView() {
        if (seaMountainView.equals("f")){
            return "NO";
        }
        else if(seaMountainView.equals("t")){
            return "YES";
        }
        else{
            return seaMountainView;
        }

    }

    public void setSeaMountainView(String seaMountainView) {
        this.seaMountainView = seaMountainView;
    }

    public String getProblemsDamages() {
        return problemsDamages;
    }

    public void setProblemsDamages(String problemsDamages) {
        this.problemsDamages = problemsDamages;
    }

    public Date getCheck_in_date() {
        return check_in_date;
    }

    public void setCheck_in_date(Date check_in_date) {
        this.check_in_date = check_in_date;
    }

    public Date getCheck_out_date() {
        return check_out_date;
    }

    public void setCheck_out_date(Date check_out_date) {
        this.check_out_date = check_out_date;
    }


    @Override
    public String toString() {
        return "Room{" +
                "street_number=" + street_number +
                ", street_name='" + street_name + '\'' +
                ", city='" + city + '\'' +
                ", stateProvince='" + stateProvince + '\'' +
                ", zip='" + zip + '\'' +
                ", room_number=" + room_number +
                ", price=" + price +
                ", capacity=" + capacity +
                ", seaMountainView='" + seaMountainView + '\'' +
                ", problemsDamages='" + problemsDamages + '\'' +
                ", check_in_date=" + check_in_date +
                ", check_out_date=" + check_out_date +
                '}';
    }
}
