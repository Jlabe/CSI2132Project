package com.demo;

public class Room {

    private int street_number;
    private String street_name;
    private String city;
    private String stateProvince;
    private String zip;
    private int room_number;
    private int price;
    private int capacity;
    private int seaMountainView;
    private int problemsDamages;

    public Room(int street_number, String street_name, String city, String stateProvince, String zip, int room_number, int price, int capacity, int seaMountainView, int problemsDamages) {
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getSeaMountainView() {
        return seaMountainView;
    }

    public void setSeaMountainView(int seaMountainView) {
        this.seaMountainView = seaMountainView;
    }

    public int getProblemsDamages() {
        return problemsDamages;
    }

    public void setProblemsDamages(int problemsDamages) {
        this.problemsDamages = problemsDamages;
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
                ", seaMountainView=" + seaMountainView +
                ", problemsDamages=" + problemsDamages +
                '}';
    }
}
