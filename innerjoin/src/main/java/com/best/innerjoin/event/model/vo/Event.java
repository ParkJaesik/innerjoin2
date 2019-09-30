package com.best.innerjoin.event.model.vo;


public class Event {

   private int eno;
   private String eTitle;
   private String eContent;
   private String eStart;
   private String eEnd;
   private int eLimit;
   private int eMemCount;
   private String gno;
   
   public Event() { }
   
   
   
   public Event(String eTitle, String eStart) {
      super();
      this.eTitle = eTitle;
      this.eStart = eStart;
   }

   

   public Event(String eTitle, String eStart, String eEnd) {
      super();
      this.eTitle = eTitle;
      this.eStart = eStart;
      this.eEnd = eEnd;
   }



   public Event(String eTitle, String eContent, String eStart, String eEnd, int eLimit) {
      super();
      this.eTitle = eTitle;
      this.eContent = eContent;
      this.eStart = eStart;
      this.eEnd = eEnd;
      this.eLimit = eLimit;
   }

   public Event(int eno, String eTitle, String eContent, String eStart, String eEnd, int eLimit, String gno, int eMemCount) {
      super();
      this.eno = eno;
      this.eTitle = eTitle;
      this.eContent = eContent;
      this.eStart = eStart;
      this.eEnd = eEnd;
      this.eLimit = eLimit;
      this.gno = gno;
      this.eMemCount = eMemCount;
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

   public String geteStart() {
      return eStart;
   }

   public void seteStart(String eStart) {
      this.eStart = eStart;
   }

   public String geteEnd() {
      return eEnd;
   }

   public void seteEnd(String eEnd) {
      this.eEnd = eEnd;
   }

   public int geteMemCount() {
      return eMemCount;
   }

   public void seteMemCount(int eMemCount) {
      this.eMemCount = eMemCount;
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
      return "Event [eno=" + eno + ", eTitle=" + eTitle + ", eContent=" + eContent + ", eStart=" + eStart + ", eEnd="
            + eEnd + ", eLimit=" + eLimit + ", eMemCount=" + eMemCount + ", gno=" + gno + "]";
   }

   @Override
   public int hashCode() {
      final int prime = 31;
      int result = 1;
      result = prime * result + ((eContent == null) ? 0 : eContent.hashCode());
      result = prime * result + ((eEnd == null) ? 0 : eEnd.hashCode());
      result = prime * result + eLimit;
      result = prime * result + eMemCount;
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
      if (eMemCount != other.eMemCount)
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