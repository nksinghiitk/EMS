package com.myapp.struts.hbm;
// Generated Jun 13, 2011 4:44:17 PM by Hibernate Tools 3.2.1.GA



/**
 * Position1Id generated by hbm2java
 */
public class Position1Id  implements java.io.Serializable {


     private int positionId;
     private String electionId;
     private String instituteId;

    public Position1Id() {
    }

    public Position1Id(int positionId, String electionId, String instituteId) {
       this.positionId = positionId;
       this.electionId = electionId;
       this.instituteId = instituteId;
    }
   
    public int getPositionId() {
        return this.positionId;
    }
    
    public void setPositionId(int positionId) {
        this.positionId = positionId;
    }
    public String getElectionId() {
        return this.electionId;
    }
    
    public void setElectionId(String electionId) {
        this.electionId = electionId;
    }
    public String getInstituteId() {
        return this.instituteId;
    }
    
    public void setInstituteId(String instituteId) {
        this.instituteId = instituteId;
    }


   


}


