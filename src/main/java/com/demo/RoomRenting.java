package com.demo;

import java.sql.Date;

public class RoomRenting {

    private int street_number;
    private String street_name;
    private String city;
    private String state_province;
    private String zip;
    private int room_number;
    private Date check_in_date;
    private Date check_out_date;
    private String worker_ssn;

    public RoomRenting(int street_number, String street_name, String city, String state_province, String zip, int room_number, Date check_in_date, Date check_out_date, String worker_ssn, String ssn) {
        this.street_number = street_number;
        this.street_name = street_name;
        this.city = city;
        this.state_province = state_province;
        this.zip = zip;
        this.room_number = room_number;
        this.check_in_date = check_in_date;
        this.check_out_date = check_out_date;
        this.worker_ssn = worker_ssn;
        this.ssn = ssn;
    }

    private String ssn;

    public RoomRenting(int street_number, String street_name, String city, String state_province, String zip, int room_number, Date booking_date, Date check_in_date, Date check_out_date, String ssn) {
        this.street_number = street_number;
        this.street_name = street_name;
        this.city = city;
        this.state_province = state_province;
        this.zip = zip;
        this.room_number = room_number;
        this.check_in_date = check_in_date;
        this.check_out_date = check_out_date;
        this.ssn = ssn;
    }

    public String getWorker_ssn() {
        return worker_ssn;
    }

    public void setWorker_ssn(String worker_ssn) {
        this.worker_ssn = worker_ssn;
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

    public String getState_province() {
        return state_province;
    }

    public void setState_province(String state_province) {
        this.state_province = state_province;
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

    public String getSsn() {
        return ssn;
    }

    public void setSsn(String ssn) {
        this.ssn = ssn;
    }

    @Override
    public String toString() {
        return "RoomRenting{" +
                "street_number=" + street_number +
                ", street_name='" + street_name + '\'' +
                ", city='" + city + '\'' +
                ", state_province='" + state_province + '\'' +
                ", zip='" + zip + '\'' +
                ", room_number=" + room_number +
                ", check_in_date=" + check_in_date +
                ", check_out_date=" + check_out_date +
                ", worker_ssn='" + worker_ssn + '\'' +
                ", ssn='" + ssn + '\'' +
                '}';
    }

}
