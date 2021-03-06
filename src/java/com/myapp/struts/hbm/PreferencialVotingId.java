package com.myapp.struts.hbm;
// Generated Oct 20, 2012 11:50:46 AM by Hibernate Tools 3.2.1.GA



/**
 * PreferencialVotingId generated by hbm2java
 */
public class PreferencialVotingId  implements java.io.Serializable {


     private String candidateId;
     private String positionId;
     private String electionId;
     private String voterId;

    public PreferencialVotingId() {
    }

    public PreferencialVotingId(String candidateId, String positionId, String electionId, String voterId) {
       this.candidateId = candidateId;
       this.positionId = positionId;
       this.electionId = electionId;
       this.voterId = voterId;
    }
   
    public String getCandidateId() {
        return this.candidateId;
    }
    
    public void setCandidateId(String candidateId) {
        this.candidateId = candidateId;
    }
    public String getPositionId() {
        return this.positionId;
    }
    
    public void setPositionId(String positionId) {
        this.positionId = positionId;
    }
    public String getElectionId() {
        return this.electionId;
    }
    
    public void setElectionId(String electionId) {
        this.electionId = electionId;
    }
    public String getVoterId() {
        return this.voterId;
    }
    
    public void setVoterId(String voterId) {
        this.voterId = voterId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof PreferencialVotingId) ) return false;
		 PreferencialVotingId castOther = ( PreferencialVotingId ) other; 
         
		 return ( (this.getCandidateId()==castOther.getCandidateId()) || ( this.getCandidateId()!=null && castOther.getCandidateId()!=null && this.getCandidateId().equals(castOther.getCandidateId()) ) )
 && ( (this.getPositionId()==castOther.getPositionId()) || ( this.getPositionId()!=null && castOther.getPositionId()!=null && this.getPositionId().equals(castOther.getPositionId()) ) )
 && ( (this.getElectionId()==castOther.getElectionId()) || ( this.getElectionId()!=null && castOther.getElectionId()!=null && this.getElectionId().equals(castOther.getElectionId()) ) )
 && ( (this.getVoterId()==castOther.getVoterId()) || ( this.getVoterId()!=null && castOther.getVoterId()!=null && this.getVoterId().equals(castOther.getVoterId()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getCandidateId() == null ? 0 : this.getCandidateId().hashCode() );
         result = 37 * result + ( getPositionId() == null ? 0 : this.getPositionId().hashCode() );
         result = 37 * result + ( getElectionId() == null ? 0 : this.getElectionId().hashCode() );
         result = 37 * result + ( getVoterId() == null ? 0 : this.getVoterId().hashCode() );
         return result;
   }   


}


