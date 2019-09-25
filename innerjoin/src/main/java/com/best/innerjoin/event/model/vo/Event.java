package com.best.innerjoin.event.model.vo;

import java.sql.Date;

public class Event {

	private int eno;
	private String eTitle;
	private String eContent;
	private Date eStart;
	private Date eEnd;
	private int eLimit;
	private String gno;
	
	public Event() { }
	
	public Event(String eTitle, String eContent, Date eStart, Date eEnd, int eLimit) {
		super();
		this.eTitle = eTitle;
		this.eContent = eContent;
		this.eStart = eStart;
		this.eEnd = eEnd;
		this.eLimit = eLimit;
	}

	public Event(int eno, String eTitle, String eContent, Date eStart, Date eEnd, int eLimit, String gno) {
		super();
		this.eno = eno;
		this.eTitle = eTitle;
		this.eContent = eContent;
		this.eStart = eStart;
		this.eEnd = eEnd;
		this.eLimit = eLimit;
		this.gno = gno;
	}
	
	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public String geteTitle() {
		return eTitle;
	}

	public void seteTitle(String eTitle) {
		this.eTitle = eTitle;
	}

	public String geteContent() {
		return eContent;
	}

	public void seteContent(String eContent) {
		this.eContent = eContent;
	}

	public Date geteStart() {
		return eStart;
	}

	public void seteStartDay(Date eStart) {
		this.eStart = eStart;
	}

	public Date geteEnd() {
		return eEnd;
	}

	public void seteEndDay(Date eEnd) {
		this.eEnd = eEnd;
	}

	public int geteLimit() {
		return eLimit;
	}

	public void seteLimit(int eLimit) {
		this.eLimit = eLimit;
	}

	public String getGno() {
		return gno;
	}

	public void setGno(String gno) {
		this.gno = gno;
	}

	@Override
	public String toString() {
		return "Event [eno=" + eno + ", eTitle=" + eTitle + ", eContent=" + eContent + ", eStart=" + eStart
				+ ", eEnd=" + eEnd + ", eLimit=" + eLimit + ", gno=" + gno + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((eContent == null) ? 0 : eContent.hashCode());
		result = prime * result + ((eEnd == null) ? 0 : eEnd.hashCode());
		result = prime * result + eLimit;
		result = prime * result + ((eStart == null) ? 0 : eStart.hashCode());
		result = prime * result + ((eTitle == null) ? 0 : eTitle.hashCode());
		result = prime * result + eno;
		result = prime * result + ((gno == null) ? 0 : gno.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Event other = (Event) obj;
		if (eContent == null) {
			if (other.eContent != null)
				return false;
		} else if (!eContent.equals(other.eContent))
			return false;
		if (eEnd == null) {
			if (other.eEnd != null)
				return false;
		} else if (!eEnd.equals(other.eEnd))
			return false;
		if (eLimit != other.eLimit)
			return false;
		if (eStart == null) {
			if (other.eStart != null)
				return false;
		} else if (!eStart.equals(other.eStart))
			return false;
		if (eTitle == null) {
			if (other.eTitle != null)
				return false;
		} else if (!eTitle.equals(other.eTitle))
			return false;
		if (eno != other.eno)
			return false;
		if (gno == null) {
			if (other.gno != null)
				return false;
		} else if (!gno.equals(other.gno))
			return false;
		return true;
	}
	
}
