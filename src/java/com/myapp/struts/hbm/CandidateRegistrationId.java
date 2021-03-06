package com.myapp.struts.hbm;
// Generated 21 Jun, 2011 6:59:42 PM by Hibernate Tools 3.2.1.GA



/**
 * CandidateRegistrationId generated by hbm2java
 */
public class CandidateRegistrationId  implements java.io.Serializable {


     private String enrollment;
     private String instituteId;
     private String electionId;
     private String position;

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getElectionId() {
        return electionId;
    }

    public void setElectionId(String electionId) {
        this.electionId = electionId;
    }

     
    public CandidateRegistrationId() {
    }

    public CandidateRegistrationId(String enrollment, String instituteId, String electionId,String position) {
       this.enrollment = enrollment;
       this.instituteId = instituteId;
       this.electionId = electionId;
       this.position=position;
    }
   
    public String getEnrollment() {
        return this.enrollment;
    }
    
    public void setEnrollment(String enrollment) {
        this.enrollment = enrollment;
    }
    public String getInstituteId() {
        return this.instituteId;
    }
    
    public void setInstituteId(String instituteId) {
        this.instituteId = instituteId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof CandidateRegistrationId) ) return false;
		 CandidateRegistrationId castOther = ( CandidateRegistrationId ) other; 
         
		 return ( (this.getEnrollment()==castOther.getEnrollment()) || ( this.getEnrollment()!=null && castOther.getEnrollment()!=null && this.getEnrollment().equals(castOther.getEnrollment()) ) )
 && ( (this.getInstituteId()==castOther.getInstituteId()) || ( this.getInstituteId()!=null && castOther.getInstituteId()!=null && this.getInstituteId().equals(castOther.getInstituteId()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getEnrollment() == null ? 0 : this.getEnrollment().hashCode() );
         result = 37 * result + ( getInstituteId() == null ? 0 : this.getInstituteId().hashCode() );
         return result;
   }   


}


