package com.myapp.struts.hbm;
// Generated Jun 13, 2011 4:44:17 PM by Hibernate Tools 3.2.1.GA



/**
 * Ballot generated by hbm2java
 */
public class Ballot  implements java.io.Serializable {


     private BallotId id;
     private String ballotName;

    public Ballot() {
    }

	
    public Ballot(BallotId id) {
        this.id = id;
    }
    public Ballot(BallotId id, String ballotName) {
       this.id = id;
       this.ballotName = ballotName;
    }
   
    public BallotId getId() {
        return this.id;
    }
    
    public void setId(BallotId id) {
        this.id = id;
    }
    public String getBallotName() {
        return this.ballotName;
    }
    
    public void setBallotName(String ballotName) {
        this.ballotName = ballotName;
    }




}


