package com.cissst.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cissst.entity.Notice;
import com.cissst.service.INoticeService;
import com.cissst.service.impl.NoticeServiceImpl;

public class NoticeServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action=request.getParameter("action");
		INoticeService noticeservice=new NoticeServiceImpl();
		if("noticelist".equals(action)){
			List<Notice> list=new ArrayList<Notice>();
			list=noticeservice.FindAll();
			request.setAttribute("notice", list);
			RequestDispatcher rd=request.getRequestDispatcher("notice/notice-list.jsp");
			rd.forward(request,response);
		}
		else if("noticeadd".equals(action)){
			String content=request.getParameter("content");
			String ndate=request.getParameter("ndate");
			String title=request.getParameter("title");
			String uper=request.getParameter("uper");
			Notice n=new Notice();
			n.setContent(content);
			n.setNdate(ndate);
			n.setTitle(title);
			n.setUper(uper);
			noticeservice.Add(n);
			response.sendRedirect("notice?action=noticelist");
		}
		else if("noticedelete".equals(action)){
			String id=request.getParameter("id");
			noticeservice.Delete(id);
			response.sendRedirect("notice?action=noticelist");
		}
		else if("noticeselect".equals(action)){
			String id=request.getParameter("id");
			Notice n=noticeservice.Select(id);
            request.setAttribute("notice", n);
			RequestDispatcher rd = request.getRequestDispatcher("notice/notice-edit.jsp");
			rd.forward(request, response);
			
		}
		else if("noticeedit".equals(action)){
			String content=request.getParameter("content");
			String ndate=request.getParameter("ndate");
			String title=request.getParameter("title");
			String uper=request.getParameter("uper");
			int id= Integer.parseInt(request.getParameter("id"));
			Notice n=new Notice();
			n.setId(id);
			n.setContent(content);
			n.setNdate(ndate);
			n.setTitle(title);
			n.setUper(uper);
			noticeservice.Update(n);
			response.sendRedirect("notice?action=noticelist");
		}
		else if("noticeview".equals(action)){
			String id=request.getParameter("id");
			Notice n=noticeservice.Select(id);
			request.setAttribute("notice", n);
			RequestDispatcher rd =request.getRequestDispatcher("notice/notice-view.jsp");
			rd.forward(request,response);
		}
		else if("listforuser".equals(action)){
			List<Notice> list=new ArrayList<Notice>();
			list=noticeservice.FindAll();
			request.setAttribute("notice", list);
			RequestDispatcher rd=request.getRequestDispatcher("notice/user-notice-list.jsp");
			rd.forward(request,response);
		}
	}

}


