package com.boyaa.checkjar.test;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

import org.junit.After;

import com.robotium.solo.By;
import com.robotium.solo.RobotiumUtils;
import com.robotium.solo.Solo;
import com.robotium.solo.WebElement;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.test.ActivityInstrumentationTestCase2;
import android.util.Log;
import android.view.View;
import android.widget.Button;

@SuppressLint("NewApi")
public class OpenHuodong extends ActivityInstrumentationTestCase2<Activity> {
	public String LogTag="===>";
	@SuppressLint("SdCardPath")
	public static String RobotiumScreenshotsPath = "/sdcard/Robotium-Screenshots/";
	@SuppressLint("SdCardPath")
	public static String propertyFile = "/sdcard/download/config.ini";
	public Solo solo;
	boolean flag=false; 
    Common common = new Common();
    BitmapCompare bitmapCompare = new BitmapCompare();
	
	public static final String LAUNCHER_ACTIVITY_FULL_CLASSNAME = "com.boyaa.checkjar.MainActivity";
	public static Class<?> launcherActivityClass;
	static{
		try{
			launcherActivityClass = Class.forName(LAUNCHER_ACTIVITY_FULL_CLASSNAME);
			Common.analyProperty(propertyFile);// 解析配置文件
		}catch(ClassNotFoundException e){
			throw new RuntimeException(e);
		}
	}
	@SuppressWarnings("unchecked")
	public OpenHuodong(){
		super((Class<Activity>) launcherActivityClass);
	}
	@Override
    protected void setUp() throws Exception {
         solo = new Solo(getInstrumentation(), getActivity());
    }
	@After
	public void tearDown() throws Exception {
		solo.finishOpenedActivities();
	}
 	
 	public void testOpenHuoDong() throws Exception{
 		Stack<WebElement> taskStack = new Stack<WebElement>();
 		Stack<WebElement> taskStackButton = new Stack<WebElement>();
 		List<String> existPage = new ArrayList<>();
 		List<WebElement> blackList = new ArrayList<>();
 		List<WebElement> blackButtonList = new ArrayList<>();
 		int count=0;
 		//截屏图片保存在手机的地址
 		File destDir = new File(RobotiumScreenshotsPath);
 		//开始执行前清空目录
 		common.DeleteFile(destDir);
 		String act_id[] = Common.act_id;
 		for (int i = 0; i < act_id.length; i++) {
 			Log.d(LogTag,"act_id:"+act_id[i]);
 	 		common.HuodongPage(solo, act_id[i],"com.boyaa.checkjar:id/button_jump");//打开活动页面
 	 		Thread.sleep(5000);
 	 		common.takeScreenshot(solo, act_id[i]+"_"+count); //截屏
 	 		Thread.sleep(1000);
 	 		taskStack = common.Search(solo);//遍历搜索Web元素
 	 		taskStackButton = common.SearchButton(solo);
 	 		existPage.add(RobotiumScreenshotsPath+act_id[i]+"_"+count+".jpg");  //当前第一个页面添加为已存在的页面
 	 		count++;	
 	 		while (!taskStackButton.isEmpty()) { 
 	 			WebElement thisButton = taskStackButton.pop();
	 			 if (!common.blackkfiter(thisButton,blackButtonList)) {
	 				 blackButtonList.add(thisButton);
	 				 try{
						Log.d(LogTag, "thisnode:"+thisButton);
						Log.d(LogTag, "thisnode:"+thisButton.getClassName());
						Log.d(LogTag, "thisnode:"+thisButton.getTagName());
						Log.d(LogTag, "thisnode:"+thisButton.getText());
						solo.clickOnWebElement(thisButton);
						}catch(Exception e){
							Log.d(LogTag,"元素不存在");
							continue;
						}
					Thread.sleep(1000);
					common.takeScreenshot(solo, act_id[i]+"_"+count);
					count++;
	 	 			Log.d(LogTag,"总图片数："+count);
					solo.hideSoftKeyboard();
					taskStackButton = common.SearchButton(solo);
				
					try{
			     		List<WebElement> elementList = solo.getWebElements(By.xpath("//*[contains(@href,'javascript:;')]"));
			     		Log.d(LogTag, "elementList size:"+elementList.size());
			    		for(WebElement element : elementList){ 
			    			solo.clickOnWebElement(element);
			    			continue;
			     		}
			     	}catch(Exception e){
			     		e.printStackTrace();
			     		continue;
			     	}  	
					try{
			     		List<WebElement> elementList = solo.getWebElements(By.xpath("//*[contains(text(),'确定')]"));
			     		Log.d(LogTag, "elementList size:"+elementList.size());
			    		for(WebElement element : elementList){ 
			    			solo.clickOnWebElement(element);
			    			continue;
			     		}
			     	}catch(Exception e){
			     		e.printStackTrace();
			     		continue;
			     	}  	
					try{
			     		List<WebElement> elementList = solo.getWebElements(By.xpath("//*[contains(.,' strong-dlg-a dlg-submit-btn')]"));
			     		Log.d(LogTag, "elementList size:"+elementList.size());
			    		for(WebElement element : elementList){ 
			    			solo.clickOnWebElement(element);
			    			continue;
			     		}
			     	}catch(Exception e){
			     		e.printStackTrace();
			     		continue;
			     	}  	

	 		 }else{
	 			 continue;
	 		 	}
 	 		}	
 	 		
 	 		//开始进入页面遍历点击页面，并截图
 	 		 while (!taskStack.isEmpty()) { 
 	 			 WebElement thisnode = taskStack.pop();
 	 			 if (!common.blackkfiter(thisnode,blackList)) {
 	 				 blackList.add(thisnode);
					 Log.d(LogTag,"thisnode:"+thisnode);
					 Log.d(LogTag,"thisnode:"+thisnode.getText());

					 try{
						 String string = thisnode.getTagName();
						 Log.d(LogTag, "thisnode:"+string);
						 solo.clickOnWebElement(thisnode);			
					 	}catch(SecurityException e){
					 		Log.d(LogTag,"权限不够");
					 		continue;
					 	}catch(Exception e){
							Log.d(LogTag,"元素不存在");
							continue;
					 	}
					common.takeScreenshot(solo, act_id[i]+"_"+count);
	 	 			count++;
	 	 			Log.d(LogTag,"总图片数："+count);	
					solo.hideSoftKeyboard();
					taskStack = common.Search(solo);
					
					
			     	try{
			     		List<WebElement> elementList = solo.getWebElements(By.xpath("//*[contains(@href,'javascript:;')]"));
//			     		RobotiumUtils.removeInvisibleViews(elementList);
			     		Log.d(LogTag, "elementList size:"+elementList.size());
			    		for(WebElement element : elementList){ 
			    			solo.clickOnWebElement(element);
			    			continue;
				     		}
				     	}catch(Exception e){
				     		e.printStackTrace();
				     		continue;
				     		}  
					try{
			     		List<WebElement> elementList = solo.getWebElements(By.xpath("//*[contains(text(),'确定')]"));
			     		Log.d(LogTag, "elementList size:"+elementList.size());
			    		for(WebElement element : elementList){ 
			    			solo.clickOnWebElement(element);
			    			continue;
			     		}
			     	}catch(Exception e){
			     		e.printStackTrace();
			     		continue;
			     	}  	
 	 			 
 	 			 

 	 			 }
 	 		 }
 	 		//筛选图片
 	 		bitmapCompare.PictureFilter(count, act_id[i], existPage);	 		
	 		count = 0;
	 		try{
	 			solo.clickOnView(solo.getView(Button.class, 0));
			}catch(junit.framework.AssertionFailedError e){
				Log.d(LogTag,"未找到元素");
				continue;
			}
	 		existPage.clear();
 		}
 	}
 }
   

