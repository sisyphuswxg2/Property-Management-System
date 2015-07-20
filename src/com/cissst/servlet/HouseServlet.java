package com.cissst.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cissst.entity.House;
import com.cissst.service.IHouseService;
import com.cissst.service.impl.HouseServiceImpl;

public class HouseServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		IHouseService ihs = new HouseServiceImpl();
		if("houseList".equals(action)){
			List<House> list =  ihs.findAllHouse();
			request.setAttribute("houses", list);
			RequestDispatcher rd = request.getRequestDispatcher("house/house-list.jsp");
			rd.forward(request, response);
		
		}else if("houseAdd".equals(action)){
			
//			int id = Integer.parseInt(request.getParameter("id"));
			String num = request.getParameter("num");
			String dep = request.getParameter("dep");
			String type = request.getParameter("type");
			String area = request.getParameter("area");
			String sell = request.getParameter("sell");
			String unit = request.getParameter("unit");
			String floor = request.getParameter("floor");
			String direction = request.getParameter("direction");
			String memo = request.getParameter("memo");
			String ownerid = request.getParameter("ownerid");

			House h = new House();
//			h.setId(id);
			h.setNum(num);
			h.setDep(dep);
			h.setType(type);
			h.setArea(area);
			h.setSell(sell);
			h.setUnit(unit);
			h.setFloor(floor);
			h.setDirection(direction);
			h.setMemo(memo);
			h.setOwnerid(ownerid);
			
			ihs.add(h);
			
			response.sendRedirect("house?action=houseList");
		}else if("findByOwnerid".equals(action)){
			String ownerid = request.getParameter("ownerid");
			
			List<House>  list = ihs.findByOwnerid(ownerid);
			
			request.setAttribute("houses", list);
			
			RequestDispatcher rd = request.getRequestDispatcher("house/user-house-list.jsp");
			rd.forward(request, response);
			
			
		}else if("houseEdit".equals(action)){
			int id = Integer.parseInt(request.getParameter("id"));
			String num = request.getParameter("num");
			String dep = request.getParameter("dep");
			String type = request.getParameter("type");
			String area = request.getParameter("area");
			String sell = request.getParameter("sell");
			String unit = request.getParameter("unit");
			String floor = request.getParameter("floor");
			String direction = request.getParameter("direction");
			String memo = request.getParameter("memo");
			String ownerid = request.getParameter("ownerid");
			House h = new House();
			
			h.setId(id);
			h.setNum(num);
			h.setDep(dep);
			h.setType(type);
			h.setArea(area);
			h.setSell(sell);
			h.setUnit(unit);
			h.setFloor(floor);
			h.setDirection(direction);
			h.setMemo(memo);
			h.setOwnerid(ownerid);

			ihs.update(h);
			
			response.sendRedirect("house?action=houseList");
		}else if("houseDelete".equals(action)){
			String id = request.getParameter("id");
			ihs.delete(id);
			response.sendRedirect("house?action=houseList");
		}else if("findById".equals(action)){
			String id = request.getParameter("id");
			
			House h = ihs.findById(id);
			
			request.setAttribute("house",h);
			
			RequestDispatcher rd = request.getRequestDispatcher("house/house-edit.jsp");
			rd.forward(request, response);
			
		}
	}
	
}
