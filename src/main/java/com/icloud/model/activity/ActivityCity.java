package com.icloud.model.activity;

public class ActivityCity {
    private Long id;

    private String name;

    private String codeno;

    private String pcodeno;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getCodeno() {
        return codeno;
    }

    public void setCodeno(String codeno) {
        this.codeno = codeno == null ? null : codeno.trim();
    }

    public String getPcodeno() {
        return pcodeno;
    }

    public void setPcodeno(String pcodeno) {
        this.pcodeno = pcodeno == null ? null : pcodeno.trim();
    }
}