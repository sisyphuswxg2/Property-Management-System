package com.cissst.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cissst.entity.Admin;
import com.cissst.entity.CustomAccount;
import com.cissst.service.IAdminService;
import com.cissst.service.ICustomAccountService;
import com.cissst.service.impl.AdminServiceImpl;
import com.cissst.service.impl.CustomAccountServiceImpl;
import com.cissst.util.MD5Util;

public class UserServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String action = request.getParameter("action");
		IAdminService as = new AdminServiceImpl();
		ICustomAccountService cs = new CustomAccountServiceImpl();
		HttpSession session = request.getSession();
		if("login".equals(action)){
			String name = request.getParameter("username");
			String password = MD5Util.encode(request.getParameter("password"));
			String usertype = request.getParameter("usertype");
			Admin a = as.findBynp(name, password);
			CustomAccount c = cs.findBynp(name, password);
			if(a != null){
				String n = a.getName();
				String p = a.getPassword();
				if(n.equals(name) && p.equals(password)&&"admin".equals(usertype)){
					session.setAttribute("admin", a);
					response.sendRedirect("index.jsp");

				}else{
				response.getWriter().write("<script charset='UTF-8'>alert(\"用户名或密码错误！\");" +
                        "location.href='index.jsp';</script>");
				}
			}else if(c != null){
				String n = c.getUsername();
				String p = c.getPassword();
				if(n.equals(name) && p.equals(password)&&"user".equals(usertype)){
					session.setAttribute("customAccount", c);
					response.sendRedirect("index2.jsp");

				}else{
				response.getWriter().write("<script charset='UTF-8'>alert(\"用户名或密码错误！\");" +
                        "location.href='index.jsp';</script>");
				}
			}else{
				response.getWriter().write("<script charset='UTF-8'>alert(\"用户名或密码错误！\");" +
                        "location.href='index.jsp';</script>");
			}
			
		}else if("logout".equals(action)){
				session.invalidate();
				//if (request.getSession(false)==null) System.out.println(123);
				response.sendRedirect("login.jsp");
		}else if("relogin".equals(action)){
				session.invalidate();
				response.sendRedirect("login.jsp");
		}
		}
	}

		
