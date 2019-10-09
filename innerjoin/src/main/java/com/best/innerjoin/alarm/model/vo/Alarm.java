package com.best.innerjoin.alarm.model.vo;

public class Alarm {
	
	private String alarmId;
	private String alarmMsg;
	private String senderId;
	private int alarmCode;
	private String receiveId;
	public Alarm() {
		super();
	}
	public Alarm(String alarmId, String alarmMsg, String senderId, int alarmCode, String receiveId) {
		super();
		this.alarmId = alarmId;
		this.alarmMsg = alarmMsg;
		this.senderId = senderId;
		this.alarmCode = alarmCode;
		this.receiveId = receiveId;
	}
	public String getAlarmId() {
		return alarmId;
	}
	public void setAlarmId(String alarmId) {
		this.alarmId = alarmId;
	}
	public String getAlarmMsg() {
		return alarmMsg;
	}
	public void setAlarmMsg(String alarmMsg) {
		this.alarmMsg = alarmMsg;
	}
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	public int getAlarmCode() {
		return alarmCode;
	}
	public void setAlarmCode(int alarmCode) {
		this.alarmCode = alarmCode;
	}
	public String getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}
	@Override
	public String toString() {
		return "Alarm [alarmId=" + alarmId + ", alarmMsg=" + alarmMsg + ", senderId=" + senderId + ", alarmCode="
				+ alarmCode + ", receiveId=" + receiveId + "]";
	}
	

}
