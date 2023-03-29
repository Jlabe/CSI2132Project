package com.demo;

public class Employee {

    private String worker_ssn;
    private String manager_ssn;
    private String first_name;
    private String middle_name;
    private String last_name;
    private int street_number;
    private int apt_number;
    private String street_name;
    private String city;
    private String stateProvince;
    private String zip;

    public Employee(String worker_ssn, String manager_ssn, String first_name,String middle_name, String last_name, int street_number, String street_name, int apt_number, String city, String stateProvince, String zip) {
        this.worker_ssn = worker_ssn;
        this.manager_ssn = manager_ssn;
        this.first_name = first_name;
        this.middle_name = middle_name;
        this.last_name = last_name;
        this.street_number = street_number;
        this.street_name = street_name;
        this.apt_number = apt_number;
        this.city = city;
        this.stateProvince = stateProvince;
        this.zip = zip;
    }

    public String getWorker_ssn() {
        return worker_ssn;
    }

    public void setWorker_ssn(String worker_ssn) {
        this.worker_ssn = worker_ssn;
    }

    public String getManager_ssn() {
        return manager_ssn;
    }
    public void setManager_ssn(String manager_ssn) {
        this.manager_ssn = manager_ssn;
    }

    public int getApt_number() {
        return apt_number;
    }
    public void setApt_number(int apt_number) {
        this.apt_number = apt_number;
    }

    public String getMiddle_name() {
        return middle_name;
    }

    public void setMiddle_name(String middle_name) {
        this.middle_name = middle_name;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
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

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "worker_ssn=" + worker_ssn + '\'' +
                "manager_ssn=" + manager_ssn + '\'' +
                ", first_name='" + first_name + '\'' +
                ", last_name='" + last_name + '\'' +
                ", street_number=" + street_number +
                ", street_name='" + street_name + '\'' +
                ", city='" + city + '\'' +
                ", stateProvince='" + stateProvince + '\'' +
                ", zip='" + zip + '\'' +
                '}';
    }
}
