package com.cissst.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cissst.entity.Inspection;
import com.cissst.service.IInspectionService;
import com.cissst.service.impl.InspectionServiceImpl;

public class InspectionServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		IInspectionService iis = new InspectionServiceImpl();
		if("inspectionList".equals(action)){
			List<Inspection> list =  iis.findAllinspections();
			request.setAttribute("inspections", list);
			RequestDispatcher rd = request.getRequestDispatcher("inspection/inspection-list.jsp");
			rd.forward(request, response);
		
		}else if("inspectionAdd".equals(action)){
			
			String person = request.getParameter("person");
			String type = request.getParameter("type");
			String itime = request.getParameter("itime");
			String conductor = request.getParameter("conductor");
			String party = request.getParameter("party");
			String result = request.getParameter("result");
			String memo = request.getParameter("memo");

			Inspection i = new Inspection();
			i.setPerson(person);
			i.setType(type);
			i.setItime(itime);
			i.setConductor(conductor);
			i.setParty(party);
			i.setResult(result);
			i.setMemo(memo);
			
			iis.save(i);
			
			response.sendRedirect("inspection?action=inspectionList");
		}else if("findById".equals(action)){
			String id = request.getParameter("id");
			
			Inspection i = iis.findById(id);
			
			request.setAttribute("inspection", i);
			
			RequestDispatcher rd = request.getRequestDispatcher("inspection/inspection-edit.jsp");
			rd.forward(request, response);
			
			
		}else if("inspectionEdit".equals(action)){
			int id = Integer.parseInt(request.getParameter("id"));
			String person = request.getParameter("person");
			String type = request.getParameter("type");
			String itime = request.getParameter("itime");
			String conductor = request.getParameter("conductor");
			String party = request.getParameter("party");
			String result = request.getParameter("result");
			String memo = request.getParameter("memo");
			
			Inspection i = new Inspection();
			i.setId(id);
			i.setPerson(person);
			i.setType(type);
			i.setItime(itime);
			i.setConductor(conductor);
			i.setParty(party);
			i.setResult(result);
			i.setMemo(memo);
			
			iis.update(i);
			
			response.sendRedirect("inspection?action=inspectionList");
		}else if("inspectionDelete".equals(action)){
			String id = request.getParameter("id");
			iis.delete(id);
			response.sendRedirect("inspection?action=inspectionList");
		}
	}
}
