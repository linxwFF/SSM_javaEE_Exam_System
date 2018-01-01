package com.common.model;

import java.io.Serializable;

import net.sf.json.JSONObject;

public class UUserRole  implements Serializable{
	private static final long serialVersionUID = 1L;
	 /**{@link UUser.id}*/
    private Long uid;
    /**{@link URole.id}*/
    private Long rid;

    public UUserRole(Long uid,Long rid) {
    	this.uid = uid;
    	this.rid = rid;
	}
    public UUserRole() {
    }
    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Long getRid() {
        return rid;
    }

    public void setRid(Long rid) {
        this.rid = rid;
    }
    public String toString(){
    	return JSONObject.fromObject(this).toString();
    }
}