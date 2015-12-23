package com;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import sun.misc.BASE64Decoder;

public class UploadServlet extends HttpServlet {

	String[] images ; 
	String header = "data:image/jpeg;base64,";
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String image = request.getParameter("image");
		String id = request.getParameter("id");
		splitMsg(image);
	
		//判断头部是不是jpg，只允许jpg
		if(image.indexOf(header)!=0)
		{
			response.getWriter().print(wrapJson(false).toString());
			return ;
		}
		//创建保存的文件夹
		File folder = new File("D://Program Files//apache-tomcat-7.0.65//webapps//Car//img//"+id);
		boolean createFolder = (folder.exists()&&folder.isDirectory())?true:folder.mkdir();
		//去掉头部
		//image = image.substring(header.length());
		boolean success = false;
		int length = images.length;
		for (int i = 1; i < length; i++) {
			BASE64Decoder decoder = new BASE64Decoder();
			try {
				//写入磁盘
				byte[] decodertytes = decoder.decodeBuffer(images[i]);
				
				String imgFilePath = null ;
				if (createFolder) {
					imgFilePath = folder.getAbsolutePath()+"\\"+i+".jpg";
				}
				System.out.println(imgFilePath);
				FileOutputStream out = new FileOutputStream(imgFilePath);
				out.write(decodertytes);
				out.close();
				success = true;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				success = false;
			}
		}
		
		response.getWriter().print(wrapJson(success));
		System.err.println(wrapJson(success));
	}

	private JSONObject wrapJson(boolean success) {
		// TODO Auto-generated method stub
		JSONObject json = new JSONObject();   
		json.put("success", success);
		return json;
	}
	//取出每个img，images从1开始
	private void splitMsg(String msg)
	{
		images = msg.split("data:image/jpeg;base64,");
	}
}
