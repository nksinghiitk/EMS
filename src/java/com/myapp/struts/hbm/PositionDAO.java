/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts.hbm;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;

/**
 *
 * @author Edrp-04
 */
public class PositionDAO {
public Candidate1 getCandidateDetailById(String enroll,int positionId,String electionId, String instituteId) {
        Session session =null;
    Candidate1 obj=null;
    try {
        session= HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createQuery("FROM Candidate1 where id.positionId=:positionId and id.electionId = :electionId and id.instituteId=:instituteId and enrollment=:candidateId");
            query.setInteger("positionId", positionId);
            query.setString("electionId",electionId );
             query.setString("instituteId", instituteId);
              query.setString("candidateId", enroll);
            obj= (Candidate1)query.uniqueResult();
            session.getTransaction().commit();
        }
        catch (RuntimeException e) {
          e.printStackTrace();
          throw e;


        }
    finally{
    session.close();
    }
        return obj;
    }
     public void insert(Position1 position){
    Session session =null;
    Transaction tx = null;
    try {
        session= HibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
        Criteria criteria = session.createCriteria(Position1.class)
                .setProjection(Projections.max("id.positionId"));
                 
            Integer maxPositionId = new Integer((Integer)criteria.uniqueResult()==null?0:(Integer)criteria.uniqueResult());
            maxPositionId++;
            System.out.println("Max Position Id="+maxPositionId);
            position.getId().setPositionId(maxPositionId);
        
            session.save(position);
            tx.commit();
        }
        catch (RuntimeException e) {
            if(position != null)
                tx.rollback();
            e.printStackTrace();
            throw e;
        }
        finally {
          session.close();
        }
    }

     public void insert1(Electionrule position){
    Session session =null;
    Transaction tx = null;
   
    try {
        session= HibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();
//        Criteria criteria = session.createCriteria(Position1.class)
//                .setProjection(Projections.max("id.positionId"));
//
//            Integer maxPositionId = new Integer((Integer)criteria.uniqueResult()==null?0:(Integer)criteria.uniqueResult());
//            maxPositionId++;
//            System.out.println("Max Position Id="+maxPositionId);
//            position.getId().setPositionId(maxPositionId);
//
            session.save(position);
            tx.commit();
        }
        catch (RuntimeException e) {
            if(position != null)
                tx.rollback();
            e.printStackTrace();
            throw e;
        }
        finally {
          session.close();
        }
    }
     public void updatePosition(Position1 position) {
        Session session =null;
    Transaction tx = null;
    try {
        session= HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.update(position);
            tx.commit();
        }
        catch (RuntimeException e) {
          
                tx.rollback();
                e.printStackTrace();
            throw e;
        }
        finally {
           session.close();
        }
    }
     public void deletePosition(Position1 position) {
        Session session =null;
    Transaction tx = null;
    try {
        session= HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.delete(position);
            tx.commit();
        }
        catch (RuntimeException e) {
         e.printStackTrace();
                tx.rollback();
            throw e;
        }
        finally {
           session.close();
        }
    }
      public void insertcandidate(Candidate1 candidate){
    Session session =null;
    Transaction tx = null;
    try {
        session= HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();



            Criteria criteria = session.createCriteria(Candidate1.class);
            Criterion a = Restrictions.eq("id.positionId", candidate.getId().getPositionId());
            Criterion b = Restrictions.eq("id.electionId", candidate.getId().getElectionId());
            Criterion c = Restrictions.eq("id.instituteId", candidate.getId().getInstituteId());
            LogicalExpression le =Restrictions.and(a, b);
            LogicalExpression le1 = Restrictions.and(le, c);
            Integer maxPositionId = new Integer((Integer)criteria.add(le1).setProjection(Projections.max("id.candidateId")).uniqueResult()==null?0:(Integer)criteria.add(le1).setProjection(Projections.max("id.candidateId")).uniqueResult());
            maxPositionId++;
            System.out.println("Max Candidate Id="+maxPositionId);
            candidate.getId().setCandidateId(maxPositionId);

            session.save(candidate);
            tx.commit();
        }
        catch (RuntimeException e) {
            if(candidate != null)
                tx.rollback();
         e.printStackTrace();
            throw e;
        }
        finally {
         session.close();
        }
    }
public void updateCandidate(Candidate1 candiadte) {
        Session session =null;
    Transaction tx = null;
    try {
        session= HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.update(candiadte);
            tx.commit();
        }
        catch (RuntimeException e) {
          e.printStackTrace();
                tx.rollback();
            throw e;
        }
        finally {
           session.close();
        }
    }

public Position1 getPositionByName(String positionName,String electionId, String instituteId) {
        Session session =null;
    
    Position1 obj=null;
    try {
        session= HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createQuery("FROM Position1 where id.electionId = :electionId and id.instituteId=:instituteId and positionName=:positionName");
             query.setString("electionId",electionId );
             query.setString("instituteId", instituteId);
             query.setString("positionName", positionName);
         obj= (Position1)query.uniqueResult();
         session.getTransaction().commit();
        }
        catch (RuntimeException e) {
          e.printStackTrace();
          throw e;


        }
    finally{
    session.close();
    }
        return obj;
    }

public Electionrule getRuleByName(String positionName,String electionId, String instituteId) {
        Session session =null;

    Electionrule obj=null;
    try {
        session= HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createQuery("FROM Electionrule where id.electionId = :electionId and id.instituteId=:instituteId and criteria=:positionName");
             query.setString("electionId",electionId );
             query.setString("instituteId", instituteId);
             query.setString("positionName", positionName);
         obj= (Electionrule)query.uniqueResult();
         session.getTransaction().commit();
        }
        catch (RuntimeException e) {
          e.printStackTrace();
          throw e;


        }
    finally{
    session.close();
    }
        return obj;
    }
public List<PositionWithCandidature> getPositionWithCandidature(String electionId, String instituteId) {
        Session session =null;

    List<PositionWithCandidature> obj=null;
    try {
        session= HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createSQLQuery("select p.position_id,p.position_name,(select count(*) from candidate_registration cr where cr.`position`=p.position_id and cr.institute_id=p.institute_id and cr.status1='REGISTERED') candidature from position1 p where p.election_id = :electionId and p.institute_id=:instituteId");
             query.setString("electionId",electionId );
             query.setString("instituteId", instituteId);
             query.setResultTransformer(Transformers.aliasToBean(PositionWithCandidature.class));
             System.out.println(query.getQueryString()+" electionId="+electionId+" instituteId="+instituteId);
          obj=(List<PositionWithCandidature>)query.list();
          session.getTransaction().commit();
        }
        catch (RuntimeException e) {
            e.printStackTrace();
            throw e;


        }
    finally{
        session.close();
    }
        return obj;
    }
public List<Position1> getPosition(String electionId, String instituteId) {
        Session session =null;
    List<Position1> obj=null;
    try {
        session= HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createQuery("FROM Position1 where id.electionId = :electionId and id.instituteId=:instituteId ORDER BY id.positionId ");
             query.setString("electionId",electionId );
             query.setString("instituteId", instituteId);

           obj= (List<Position1>)query.list();
           session.getTransaction().commit();
        }
        catch (RuntimeException e) {
          e.printStackTrace();
          throw e;

            
        }
    finally{
        session.close();
    }
        return obj;
    }

public List<Candidate1> getCandidate(int positionId,String electionId, String instituteId) {
        Session session =null;
   List<Candidate1> cand=null;
    try {
        System.out.println(positionId+"   "+electionId+"  "+instituteId);
        session= HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createQuery("SELECT c1 FROM Candidate1 c1,CandidateRegistration cr where c1.id.electionId=cr.id.electionId and c1.id.instituteId=cr.id.instituteId and c1.id.positionId=cr.id.position and c1.id.electionId =:electionId and c1.id.instituteId=:instituteId and c1.enrollment=cr.id.enrollment and cr.status = 'REGISTERED' and c1.id.positionId=:positionId");
            query.setString("positionId", String.valueOf(positionId));
            query.setString("electionId",electionId );
             query.setString("instituteId", instituteId);
          cand= (List<Candidate1>)query.list();
          session.getTransaction().commit();
        }
        catch (RuntimeException e) {
         System.out.println("Candidate Query Error:"+e.getStackTrace().toString());
         throw e;

        }
   finally{
   session.close();
   }
        return cand;
    }
public Candidate1 getCandidateDetailByName(String candidateName,int positionId,String electionId, String instituteId) {
        Session session =null;
    Candidate1 obj=null;
    try {
        session= HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createQuery("FROM Candidate1 where id.positionId=:positionId and id.electionId = :electionId and id.instituteId=:instituteId and candidateName=:candidateId");
            query.setInteger("positionId", positionId);
            query.setString("electionId",electionId );
             query.setString("instituteId", instituteId);
              query.setString("candidateId", candidateName);
            obj= (Candidate1)query.uniqueResult();
            session.getTransaction().commit();
        }
        catch (RuntimeException e) {
          e.printStackTrace();
          throw e;


        }
    finally{
    session.close();
    }
        return obj;
    }
public Candidate1 getCandidateByName(String candidateId,int positionId,String electionId, String instituteId) {
        Session session =null;
   Candidate1 obj=null;
    try {
        session= HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = session.createQuery("FROM Candidate1 where id.positionId=:positionId and id.electionId = :electionId and id.instituteId=:instituteId and id.candidateId=:candidateId");
            query.setInteger("positionId", positionId);
            query.setString("electionId",electionId );
             query.setString("instituteId", instituteId);
              query.setString("candidateId", candidateId);
            obj= (Candidate1)query.uniqueResult();
            session.getTransaction().commit();
        }
        catch (RuntimeException e) {
          
          e.printStackTrace();
          throw e;


        }
    finally{
    session.close();
    }
        return obj;
    }
public Candidate1 checkCandidateByName(String candidateName,String candidateId,int positionId,String electionId, String instituteId) {
        Session session =null;
   Candidate1 obj=null;
    try {
        session= HibernateUtil.getSessionFactory().openSession();
             session.beginTransaction();
            Query query = session.createQuery("FROM Candidate1 where id.positionId=:positionId and id.electionId = :electionId and id.instituteId=:instituteId and candidateName=:candidateName and id.candidateId!=:candidateId");
            query.setInteger("positionId", positionId);
            query.setString("electionId",electionId );
             query.setString("instituteId", instituteId);
              query.setString("candidateName", candidateName);
              query.setString("candidateId", candidateId);
            obj= (Candidate1)query.uniqueResult();
         session.getTransaction().commit();
        }
        catch (RuntimeException e) {

          e.printStackTrace();
          throw e;


        }
    finally{
    session.close();
    }
        return obj;
    }

 public  Position1 searchPosition(Integer PositionID) {
        Session session =null;
Position1 obj=null;
        try {
            session= HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Criteria criteria = session.createCriteria(Position1.class)
                    .add(Restrictions.conjunction()
                    .add(Restrictions.eq("id.positionId", PositionID)));
            obj= (Position1) criteria.uniqueResult();


        session.getTransaction().commit();
        }
        catch (RuntimeException e) {

          e.printStackTrace();
          throw e;


        }
    finally{
    session.close();
    }
        return obj;
    }

  public  Position1 searchPosition1(Integer PositionID,String electionid,String instituteid) {
        Session session =null;
        Position1 obj=null;
        try {
            session= HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Criteria criteria = session.createCriteria(Position1.class)
                    .add(Restrictions.conjunction()
                    .add(Restrictions.eq("id.positionId", PositionID)))
                    .add(Restrictions.eq("id.electionId", electionid))
                    .add(Restrictions.eq("id.instituteId",instituteid));
            obj= (Position1) criteria.uniqueResult();


        session.getTransaction().commit();
        }
        catch (RuntimeException e) {

          e.printStackTrace();
          throw e;


        }
    finally{
    session.close();
    }
        return obj;
    }

   public  List<Electionrule> searchCriteria(Integer PositionID,String electionid,String instituteid) {
        Session session =null;
        List<Electionrule> obj=null;
        try {
            session= HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Criteria criteria = session.createCriteria(Electionrule.class)
                    .add(Restrictions.conjunction()
                    .add(Restrictions.eq("id.positionId", PositionID)))
                    .add(Restrictions.eq("id.electionId", electionid))
                    .add(Restrictions.eq("id.instituteId",instituteid));
            obj= (List<Electionrule>) criteria.list();


        session.getTransaction().commit();
        }
        catch (RuntimeException e) {

          e.printStackTrace();
          throw e;


        }
    finally{
    session.close();
    }
        return obj;
    }


   public  List<Candidate1> ElectionId(Integer PositionID,String instituteid) {
        Session session = null;
        List<Candidate1> obj=null;
        try {
            session=HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Criteria criteria = session.createCriteria(Candidate1.class)
                    .add(Restrictions.conjunction()
                    .add(Restrictions.eq("id.positionId", PositionID)))
                    .add(Restrictions.eq("id.instituteId", instituteid));
        obj= (List<Candidate1>) criteria.list();


        session.getTransaction().commit();
        }
        catch (RuntimeException e) {

          e.printStackTrace();
          throw e;


        }
    finally{
    session.close();
    }
        return obj;
    }
 public  List<Electionrule> getRules(String instituteid,String electionid,int pos_id) {
        Session session = null;
        List<Electionrule> obj=null;
        try {
            session=HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Criteria criteria = session.createCriteria(Electionrule.class)
                    .add(Restrictions.conjunction()
                    .add(Restrictions.eq("id.electionId", electionid))
                     .add(Restrictions.eq("id.positionId", pos_id)))
                    .add(Restrictions.eq("id.instituteId", instituteid));
        obj= (List<Electionrule>) criteria.list();


        session.getTransaction().commit();
        }
        catch (RuntimeException e) {

          e.printStackTrace();
          throw e;


        }
    finally{
    session.close();
    }
        return obj;
    }
  public  List<Electionrule> getRules1(String instituteid,String electionid,int pos) {
        Session session = null;
        List<Electionrule> obj=null;
        try {
            session=HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Criteria criteria = session.createCriteria(Electionrule.class)
                    .add(Restrictions.conjunction()
                    .add(Restrictions.eq("id.positionId", pos))
                    .add(Restrictions.eq("id.electionId", electionid)))
                    .add(Restrictions.eq("id.instituteId", instituteid));
        obj= (List<Electionrule>) criteria.list();


        session.getTransaction().commit();
        }
        catch (RuntimeException e) {

          e.printStackTrace();
          throw e;


        }
    finally{
    session.close();
    }
        return obj;
    }
public  Electionrule getRulesbyId(String instituteId,String electionId,String ruleId,Integer positionId) {
        Session session = null;
        Electionrule obj=null;
        try {
            session=HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
             Query query = session.createQuery("FROM Electionrule where id.instituteId=:instituteId and id.ruleId = :ruleId and id.electionId=:electionId and id.positionId=:positionId");
            query.setString("instituteId", instituteId);
            query.setString("ruleId", ruleId);
            query.setString("electionId",electionId);
            query.setInteger("positionId",positionId);
             
//            Criteria criteria = session.createCriteria(Electionrule.class)
//                    .add(Restrictions.conjunction()
//                    .add(Restrictions.eq("id.electionId", electionid)))
//                    .add(Restrictions.eq("id.instituteId", instituteid))
//                    .add(Restrictions.eq("id.ruleId", ruleid));
     //   obj= (Electionrule) criteria.uniqueResult();
         obj= (Electionrule) query.uniqueResult();
        session.getTransaction().commit();
        }
        catch (RuntimeException e) {

          e.printStackTrace();
          throw e;


        }
    finally{
    session.close();
    }
        return obj;
    }
public void updateRule(Electionrule rule) {
        Session session =null;
    Transaction tx = null;
    try {
        session= HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            session.update(rule);
            tx.commit();
        }
        catch (RuntimeException e) {
          e.printStackTrace();
                tx.rollback();
            throw e;
        }
        finally {
           session.close();
        }
    }
public void deleteRule(List<Electionrule> rule) {
        Session session =null;
    Transaction tx = null;
    try {
        session= HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            for(int i=0;i<rule.size();i++)
            {
                Electionrule ruleobj=(Electionrule)rule.get(i);
                session.delete(ruleobj);
            }


            tx.commit();
        }
        catch (RuntimeException e) {
          e.printStackTrace();
                tx.rollback();
            throw e;
        }
        finally {
           session.close();
        }
    }
public void deleteRule(Electionrule rule) {
        Session session =null;
    Transaction tx = null;
    try {
        session= HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();

            session.delete(rule);



            tx.commit();
        }
        catch (RuntimeException e) {
          e.printStackTrace();
                tx.rollback();
            throw e;
        }
        finally {
           session.close();
        }
    }

}
