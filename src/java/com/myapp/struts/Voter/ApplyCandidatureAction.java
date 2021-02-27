/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts.Voter;

import com.myapp.struts.Candidate.CandidateRegistrationDAO;
import com.myapp.struts.hbm.CandidateRegistration;
import com.myapp.struts.hbm.CandidateRegistrationId;
import com.myapp.struts.hbm.Electionrule;
import com.myapp.struts.hbm.ElectionruleId;
import com.myapp.struts.hbm.PositionDAO;
import com.myapp.struts.hbm.Ruleanswer;
import com.myapp.struts.hbm.RuleanswerId;
import com.myapp.struts.utility.AppPath;
import java.io.File;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import net.sf.jasperreports.engine.JasperCompileManager;

import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JRExporterParameter;

import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.JRLoader;

import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;


/**
 *
 * @author faraz
 */
public class ApplyCandidatureAction extends org.apache.struts.action.Action {
    
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    
   
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession();
        String position = request.getParameter("position");
        String election = request.getParameter("election");
        String report =   request.getParameter("report");
        String institute_id =(String)session.getAttribute("institute_id");
        String enrollment =(String)session.getAttribute("staff_id");
        String data1=(String)request.getParameter("rule");
        StringTokenizer str=new StringTokenizer(data1,"|");
        System.out.println(institute_id+" "+election+" "+enrollment+report+data1);
       
        if(report!=null){

          

           System.out.println("enroll");
         List list;
              PositionDAO dao= new PositionDAO();

       
         JasperCompileManager.compileReportToFile(AppPath.getReportPath()+"CandidatureSend.jrxml");
        // String enroll=lf.getEnrollment();
 System.out.println("enroll");
        list=CandidateRegistrationDAO.searchCandidatedetail(enrollment,institute_id,position,election);
if(!list.isEmpty()){
        // System.out.println(list.get(0)+""+enroll);
         JRBeanCollectionDataSource data=new  JRBeanCollectionDataSource(list);

          OutputStream ouputStream = response.getOutputStream();
           response.setContentType("application/pdf");

         HashMap hash= new HashMap();
//         hash.put("image",list.get(11));


         JasperFillManager.fillReportToFile(AppPath.getReportPath()+"CandidatureSend.jasper",hash,data);

         File file= new File(AppPath.getReportPath()+"CandidatureSend.jrprint");

         JasperPrint print =(JasperPrint)JRLoader.loadObject(file);

         JRPdfExporter pdf=new JRPdfExporter();

         pdf.setParameter(JRExporterParameter.JASPER_PRINT, print);
         pdf.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, AppPath.getReportPath()+"CandidatureSend.pdf");

         pdf.exportReport();
         JRExporter exporter = null;
                exporter = new JRHtmlExporter();
            JasperExportManager.exportReportToPdfStream(print, ouputStream);





 // path=path+"/src/java/com/myapp/struts/circulation/JasperReport";
        }





        }







        CandidateRegistration candi1 = CandidateRegistrationDAO.getCandidateDetails1(institute_id, enrollment,election,position);
        if(candi1==null)
        {
        CandidateRegistrationId crId = new CandidateRegistrationId(enrollment, institute_id,election,position);
        CandidateRegistration ob = new CandidateRegistration(crId);

            ob.setPosition(position);
            ob.setStatus("not registered");
//            Candidate1Id pos1 = new Candidate1Id();
//            Candidate1 pos = new Candidate1();
//         pos1.setElectionId(election);
//         pos1.setInstituteId(institute_id);
//       pos1.setPositionId(Integer.parseInt(position));
//       //pos1.setCandidateId(Integer.parseInt());
//         pos.setCandidateName(username);
//         pos.setEnrollment(enrollment);
//         pos.setId(pos1);

        CandidateRegistrationDAO.insert(ob);
//        PositionDAO positiondao = new PositionDAO();

               // response.getWriter().write( "<messages><message>request for candidature has been sent succsessfully & PDF is generated please download it and submit to the Election Manager</message></messages>");
int i=0;
           while(str.hasMoreElements()){

           Ruleanswer obj=new Ruleanswer();
           RuleanswerId objid=new RuleanswerId();
           objid.setElectionId(election);
           objid.setInstituteId(institute_id);
           objid.setRuleId(String.valueOf(i+1));
           objid.setEnrollment(enrollment);
           obj.setAnswer(str.nextElement().toString());
           obj.setId(objid);
           objid.setPositionId(Integer.parseInt(position));
           CandidateRegistrationDAO.insert1(obj);
i++;

           }


        request.setAttribute("report", "report");
        response.setContentType("application/xml");
        response.getWriter().write( "<messages><message>request for candidature has been sent succsessfully </message></messages>");



        }
        else
        {
            response.setContentType("application/xml");
        response.getWriter().write( "<messages><message>You Already Send Candidature Request for this Election</message></messages>");
        }
     return null;
    }
}
