package com.xt.common;

public class JsonObject<T> {

	private String msg;
	private Integer status;
	private T result;
	
	
	public JsonObject(String msg, Integer status) {
		super();
		this.msg = msg;
		this.status = status;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public T getResult() {
		return result;
	}
	public void setResult(T result) {
		this.result = result;
	}
	public JsonObject(String msg, Integer status, T result) {
		super();
		this.msg = msg;
		this.status = status;
		this.result = result;
	}
	public JsonObject() {
		super();
	}
	
	
	
}
