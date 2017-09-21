package com.boyaa.checkjar.test;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.io.StringWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Stack;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import android.annotation.SuppressLint;
import com.robotium.solo.Solo;

public class Common {
	
	/*
	 * 深度遍历搜索
	 */
	public void Search() throws Exception{ 
 		int thisDepth = 0, newTaskCount, count=0, depth=5;
 		UiNode thisNode;
 		String thisWindowID, thisPageSource;
        Stack<UiNode> children;
        Stack<UiNode> existsTaskStack;
        Stack<UiNode> taskStack;
        List<UiNode> blackList = new ArrayList<UiNode>();
//        List<String> blackList = new ArrayList<>();
        List<String> existWin = new ArrayList<String>();
        List<String> existPage = new ArrayList<String>();

        // 首次获取窗口内容thisPageSource和窗口唯一标识thisWindowID
        thisPageSource = 
//        System.out.println(thisPageSource);
        thisWindowID = getCurrentWindowID(thisPageSource);
        //获取当前页面的所有元素，存入栈中
        taskStack = getTaskStack(thisWindowID);
        System.out.println("stack size "+taskStack.size());
        // 活动首页截图
        takesScreenShot(driver, count+".png");
        count++;
        //出现过的窗口加入List标记
        existWin.add(thisWindowID);
        existPage.add(thisPageSource);
   
        while (!taskStack.isEmpty()) {
            thisNode = taskStack.pop();
            blackList.add(thisNode);
            System.out.println("现在还有" + taskStack.size() + "个任务待点击");
            try { 
            	thisNode.getElement().click();
            	Thread.sleep(1000);
            	thisPageSource = driver.getPageSource();
            	thisWindowID = getCurrentWindowID(thisPageSource);  
            	//判断当前窗口是否已截图，如未截图则进行截图
            	while(!searchWinID(thisPageSource, existPage)){
            		takesScreenShot(driver, count + ".png");
        			existPage.add(thisPageSource);
        			count++;
                	try{
                		List<WebElement> elementList = driver.findElements(By.xpath("//*[@clickable='true' and @enabled='true']"));
                		for(WebElement element : elementList){ 
                			if(element.getText().contains("取消")){
                				element.click();
                			}else if(element.getAttribute("name").contains("javascript:;")){
                				element.click();
                			}else if(element.getAttribute("name").contains("确定")){
                				element.click();
                			}else if(element.getAttribute("name").contains("关闭")){
                				element.click();
                			}else if(element.getAttribute("name").contains("取消")){
                				element.click();
                			}
                			else if(element.getAttribute("name").contains("Link")){
                				element.click();
                			}
                		}
                	}catch(Exception e){
                		continue;
                	}
            	//判断是否是同一个窗口
            	while(!searchWinID(thisWindowID, existWin)){
        			existWin.add(thisWindowID);
        			// 在任务栈中搜索当前窗口,如果存在,则获取该窗口下所有任务节点
        			existsTaskStack = searchByWindowID(thisWindowID, taskStack);
//        			System.out.println(existsTaskStack);
        			// 如果当前窗口已存在任务栈中
        			if (null != existsTaskStack) {
        				System.out.println(thisNode.getWindowID() + " >> " + thisWindowID + ", 窗口迁移至老窗口,获取到窗口任务列表 -> " + existsTaskStack.size());
        				resetTaskStack(taskStack, existsTaskStack);
        				System.out.println("任务栈已更新,现在还有" + taskStack.size() + "个任务待运行......");
        			} else {
        				System.out.println(thisNode.getWindowID() + " >> " + thisWindowID + ", 窗口迁移至新窗口......");
						thisDepth = thisNode.getDepth();

//                         遍历深度控制,0表示未限制
                        if (depth == 0 || thisDepth < depth) {
                            thisPageSource = driver.getPageSource();
                            thisWindowID = getCurrentWindowID(thisPageSource);
//                            while(!searchWinID(thisWindow, existWin)){
                            	existWin.add(thisWindowID);
                            	children = getTaskChildStack(thisPageSource);
                            	System.out.println("stack size "+children.size());

                            	// 是否获取到新窗口节点任务
                            	newTaskCount = null != children ? children.size() : 0;

                            	System.out.println(newTaskCount + "个新任务准备入栈......");
                            	children = removeNodes(blackList, children);
                            	children = filterNodes(taskStack, children);
                            	children = updateTaskStack(children, thisNode);

                            	// 如果有新的节点任务生成,把当前节点任务先压栈,新生成的节点任务出栈
                            	if (null != children && children.size() > 0) {
                            		System.out.println(children.size() + "个新任务允许入栈......");
                            		taskStack.push(thisNode);
                            		taskStack.addAll(children);
                            		System.out.println("任务栈已更新, " + children.size() + "个新任务允许入栈, 现在还有" + taskStack.size() + "个任务待运行......");

                            }
                            if (newTaskCount == 0 || children.size() == 0 && needBack(thisWindowID, taskStack)) {
                                System.out.println(thisNode.getWindowID() + " >> " + thisWindowID + ", 窗口虽然发生迁移,但没有新任务加入, 并且本窗口节点任务已遍历完毕,点击返回......");

                            }
                            else {
                            	System.out.println("[" + thisNode.getInfo() + "], " + thisNode.getWindowID() + " >> " + thisWindowID + ", 窗口虽然发生迁移,但已达到最大遍历深度 -> " + thisDepth + ", 点击返回......");
//                            	doBack();
                        
                        }
                            } 
                            }
                           }
            	}
//                // 如果同窗口的任务栈已处理完毕,并且还停留在该窗口,返回至上一个窗口
//                if (thisNode.getWindowID().equals(thisWindowID) && needBack(thisNode.getWindowID(), taskStack)) {
//                    System.out.println(thisNode.getWindowID() + " == " + thisWindowID + ", 窗口未发生迁移,并且本窗口节点任务已遍历完毕,点击返回......");
//                    // 获取返回后的窗口内容和窗口标识
//                    String doBackWin = doBack();
//                    thisPageSource = null == doBackWin ? thisPageSource : doBackWin;
//                    thisWindowID = getCurrentWindowID(thisPageSource);
//                }

//            	
            	
            } catch (NoSuchElementException e) {
            	System.out.println("节点任务 -> [info = " + thisNode + "], NoSuchElementException, 弹出下一个节点任务, ");
                continue;
            } catch (org.openqa.selenium.ElementNotVisibleException e) {
            	System.out.println("节点任务 -> [info = " + thisNode + "], ElementNotVisibleException, 弹出下一个节点任务, " );
                continue;
            } catch (org.openqa.selenium.NoSuchSessionException e) {
            	System.out.println("会话丢失,退出 >> 节点任务 -> [info = " + thisNode + "], NoSuchSessionException, 弹出下一个节点任务, " );
                break;
            } catch (org.openqa.selenium.SessionNotCreatedException e) {
            	System.out.println("会话未创建,退出 >> 节点任务 -> [info = " + thisNode + "], SessionNotCreatedException, 弹出下一个节点任务, " );
                break;
            } catch (org.openqa.selenium.NotFoundException e) {
            	System.out.println("节点任务 -> [info = " + thisNode + "], NotFoundException, 弹出下一个节点任务, " );
                continue;
            } catch (Exception e) {
            	System.out.println("节点任务 -> [info = " + thisNode + "], 发生未知异常, 弹出下一个节点任务, " );
            	System.out.println(e.fillInStackTrace());
                continue;
            }

        }
            
        driver.navigate().back();
	}
    /**
     * 返回
     *
     * @throws Exception
     */
    @SuppressWarnings("rawtypes")
	protected String doBack() throws Exception {
    	((AndroidDriver) driver).pressKeyCode(AndroidKeyCode.BACK);
    	return driver.getPageSource();
    }
    /**
     * 更新左节点
     *
     * @param taskStack
     * @param leftNode
     * @return
     */
    protected Stack<UiNode> updateTaskStack(Stack<UiNode> taskStack, UiNode leftNode) {
        UiNode uiNode;
        for (int i = 0; i < taskStack.size(); i++) {
            uiNode = taskStack.get(i);
            uiNode.setLeftNode(leftNode);
        }
        return taskStack;
    }
	
    /**
     * 根据窗口ID在任务栈中搜索节点,并返回结果
     *
     * @param windowID
     * @param nodeStack
     * @return
     */
    protected Stack<UiNode> searchByWindowID(String windowID, Stack<UiNode> nodeStack) {
        Stack<UiNode> searchStack = new Stack<>();
        for (int i = 0; i < nodeStack.size(); i++) {
            if (nodeStack.get(i).getWindowID().equals(windowID)) {
                searchStack.push(nodeStack.get(i));
            }
        }
        searchStack = searchStack.size() > 0 ? searchStack : null;
        return searchStack;
    }
    /*
     * 搜索当前窗口是否存在，并返回结果
     */
    protected boolean searchWinID(String thisWindow,List<String> existWin) {
    	for(int i=0;i<existWin.size();i++){
    		if(thisWindow.equals(existWin.get(i))){
    			return true;
    		}
    	}
    	return false;
	}
    

    /**
     * 判断是否存在同窗口的节点
     *
     * @param windowID
     * @param nodeStack
     * @return
     */
    protected boolean needBack(String windowID, Stack<UiNode> nodeStack) {
        for (int i = 0; i < nodeStack.size(); i++) {
            if (windowID.equals(nodeStack.get(i).getWindowID())) {
                return false;
            }
        }
        return true;
    }
	/*
	 * 获取当前窗口的唯一标识
	 */
	public String getWindowId(String pageSource, int elements) throws Exception{
        String formatPageSource = "";
        Document doc;
        DocumentBuilder dBuilder;
        DocumentBuilderFactory dbFactory;
        
        InputSource is = new InputSource(new StringReader(pageSource));
        System.out.println("is "+is);  
        try {
            dbFactory = DocumentBuilderFactory.newInstance();
            dBuilder = dbFactory.newDocumentBuilder();
            doc = dBuilder.parse(is);
            System.out.println("doc "+doc);
            if (doc.hasChildNodes()) {
            	NodeList nodeList = doc.getElementsByTagName("android.view.View");
            	for(int i=0;i<=elements;i++){
                    if(nodeList.item(i).getNodeType()==Node.ELEMENT_NODE)
                    {
                    	
                        System.out.print(nodeList.item(i).getAttributes());
                        String[] string = nodeList.item(i).getAttributes().toString().split("com.sun.org.apache.xerces.internal.dom.AttributeMap");
                        formatPageSource = formatPageSource + string[1];
                    }
                    else 
                    {
                        System.out.println(" : "+((Node)nodeList.item(i)).getNodeValue().trim());
                    }
            	}
            	System.out.println(formatPageSource);	
            	}
            return formatPageSource;
//            return formatPageSource;
           
        } catch (ParserConfigurationException e) {
            e.fillInStackTrace();
        return null;
        }
	}
	private List<String> getidentifySpecialList() {
		return getidentifySpecialList;
	}
	
	  /**
     * 任务栈中删除黑名单
     *
     * @param blackList
     * @param taskStack
     * @return
     */
    protected Stack<UiNode> removeNodes(List<UiNode> blackList, Stack<UiNode> taskStack) {
        if (null != taskStack) {
            List<UiNode> removeList = new ArrayList<>();
            Stack<UiNode> blackStack = new Stack<>();
            blackStack.addAll(blackList);

            for (int i = 0; i < taskStack.size(); i++) {
                if (exist(taskStack.get(i), blackStack)) {
                    removeList.add(taskStack.get(i));
                }
            }

            taskStack.removeAll(removeList);
        }
        return taskStack;
    }

    /**
     * 按过滤级别过滤新任务栈,返回过滤后的任务栈
     *
     * @param taskStack
     * @param childrenStack
     * @return
     */
    protected Stack<UiNode> filterNodes(Stack<UiNode> taskStack, Stack<UiNode> childrenStack) {
        List<UiNode> needList = new ArrayList<>();
        if (childrenStack != null && !childrenStack.isEmpty()) {
            for (UiNode child : childrenStack) {
                if (!exist(child, taskStack))
                    needList.add(child);
            }
            if (needList.size() > 0) {
                childrenStack.clear();
                childrenStack.addAll(needList);
            }
        }
        return childrenStack;
    }
    /**
     * 按过滤级别判断元素是否已存在
     *
     * @param child
     * @param taskStack
     * @return
     */
    protected boolean exist(UiNode child, Stack<UiNode> taskStack) {
        String mark;
        String childMark;
        //>
       // <!--过滤级别 1:clazz+text+content_desc+resourceId 2:winID+clazz+text+content_desc+resourceId 3:taskID-->
        int filter = 1;

        if (filter == 1) {
            for (int i = 0; i < taskStack.size(); i++) {
                if (taskStack.get(i).getInfo().equals(child.getInfo()))
                    return true;
            }
            return false;
        } else if (filter == 2) {
            childMark = child.getWindowID() + child.getInfo();
            for (int i = 0; i < taskStack.size(); i++) {
                mark = taskStack.get(i).getWindowID() + taskStack.get(i).getInfo();
                if (mark.equals(childMark))
                    return true;
            }
            return false;
        } else {
            for (int i = 0; i < taskStack.size(); i++) {
                if (taskStack.get(i).getId().equals(child.getId()))
                    return true;
            }
            return false;
        }
    }
	
    /**
     * 获取当前窗口的唯一标识符
     *
     * @param pageSource
     * @return
     */
    public String getCurrentWindowID(String pageSource) {
        String[] keys;
        int elements;
        int element = 8;
        List<String> identifySpecialList = getidentifySpecialList();
        if (null == identifySpecialList) {
            return getWindowIdentify(pageSource,element);
        } else {
            for (String identifySpecial : identifySpecialList) {
                keys = identifySpecial.split(">>")[0].split(",");
//                System.out.println(keys);
                for (int i = 0; i < keys.length; i++) {
//                	System.out.println(keys[i]);
                    if (!pageSource.contains(keys[i])) {
           
                        break;
                    }
                    if (i == keys.length - 1) {
                        elements = Integer.parseInt(identifySpecial.split(">>")[1]);
//                        System.out.println(elements);
//                        System.out.println(getWindowIdentify(pageSource,elements));
                        return getWindowIdentify(pageSource,elements);
                    }
                }
            }
//            System.out.println(getWindowIdentify(pageSource));
            return getWindowIdentify(pageSource,element);
        }
    }
	
	
    /**
     * 获取窗口的唯一标识符,自定义元素节点的采样个数
     *
     * @param pageSource
     * @param elements
     * @return
     */
    public String getWindowIdentify(String pageSource, int elements) {
        String formatPageSource = "";
        Document doc;
        DocumentBuilder dBuilder;
        DocumentBuilderFactory dbFactory;
        List<String> stringList = new ArrayList<>();
        InputSource is = new InputSource(new StringReader(pageSource));
        try {
            dbFactory = DocumentBuilderFactory.newInstance();
            dBuilder = dbFactory.newDocumentBuilder();
            doc = dBuilder.parse(is);
            if (doc.hasChildNodes()) {
                format(doc.getChildNodes(), stringList);     
            }
            for (int i = 0; i < elements; i++)
                if (i == stringList.size()) {
                    break;
                } else {
                    formatPageSource = formatPageSource + stringList.get(i) + ";";
//                    System.out.println(formatPageSource);
                }
            System.out.println(new ConfigProvider().getMD5ByString(formatPageSource));
            return new ConfigProvider().getMD5ByString(formatPageSource);
        } catch (ParserConfigurationException e) {
            e.fillInStackTrace();
        } catch (SAXException e) {
            e.fillInStackTrace();
        } catch (IOException e) {
            e.fillInStackTrace();
        } catch (Exception e) {
            e.fillInStackTrace();
        }
        return null;
    }
    
  
    @SuppressLint("NewApi")
	protected void format(NodeList nodeList, List<String> stringList) {
        String text;
        String attributeInfo;
        for (int i = 0; i < nodeList.getLength(); i++) {
            Node node = nodeList.item(i);
//            System.out.println(node);
            if (node.getNodeType() == Node.ELEMENT_NODE) {
                NamedNodeMap nodeMap = node.getAttributes();
                text = node.getTextContent().trim();
//                System.out.println(text);
                attributeInfo = getAttributeInfo(nodeMap, Attribute.BOUNDS);
//                System.out.println(attributeInfo);
//                System.out.println(text + attributeInfo);
                stringList.add(text + attributeInfo);
                if (node.hasChildNodes()) {
//                    format(node.getChildNodes(), stringList);
                }
            }
        }
    }
    /**
     * 获取节点属性值信息
     *
     * @param nodeMap
     * @param except
     * @return
     */
    protected String getAttributeInfo(NamedNodeMap nodeMap, String... except) {
        StringWriter sw;
        PrintWriter pw;
        sw = new StringWriter();
        pw = new PrintWriter(sw);
        for (int j = 0; j < nodeMap.getLength(); j++) {
            if (!Arrays.asList(except).contains(nodeMap.item(j).getNodeName()))
                pw.print(nodeMap.item(j).getNodeValue().trim());
        }
        return sw.toString();
    }
    
	/*
	 * 获取任务栈
	 */
	public Stack<UiNode> getTaskStack(String windowID){
		UiNode node;
		Stack<UiNode> taskStack = new Stack<>();
		List<String> blackList, inputList, clickList;
		String className;
		List<WebElement> elementList = null;
		//		elementList = driver.findElements(By.xpath("//*[@clickable='true' and @enabled='true']"));// and @content-desc !=''
//		elementList = driver.findElements(By.xpath("//*[@class='android.view.View' or @class='android.widget.Button']"));
		elementList = driver.findElements(By.xpath("//*[@class='android.view.View' or @class='android.widget.Button' or @clickable='true' or @enabled='true']"));
		for(WebElement element : elementList){
			try{
				className = element.getTagName();
				System.out.println(className);
				if(null != className){
//					if (null == blackList || notInBlackList(element, blackList)) {
                    node = new UiNode();
                    node.setId(windowID + "-" + element.getLocation().toString() + "-" + element.getSize().toString());
                    node.setWindowID(windowID);
                    node.setElement(element);
//                    node.setDepth(depth);
////                        node.setAction(clickList.contains(className));
                    taskStack.push(node);
				}
				
		}catch(NoSuchElementException e){
			continue;}
		}
		return taskStack;
	}
		
    protected boolean notInBlackList(WebElement element, List<String> blackList) {
        String text = getAttribute(element, Attribute.TEXT);
        String content_desc = getAttribute(element, Attribute.CONTENT_DESC);
        String resourceId = getAttribute(element, Attribute.RESOURCE_ID);

        for (int i = 0; i < blackList.size(); i++) {
            if (!text.isEmpty() && text.contains(blackList.get(i))) {
                return false;
            } else if (!content_desc.isEmpty() && content_desc.contains(blackList.get(i))) {
                return false;
            } else if (!resourceId.isEmpty() && blackList.get(i).equals(resourceId)) {
                return false;
            }
        }
        return true;
    }	

    /**
     * 根据属性名获取属性值
     *
     * @param nodeMap
     * @param attributeName
     * @return the value of attribute
     */
    protected String getAttribute(WebElement nodeMap, String attributeName) {
        Node attrNode;
        attrNode = ((NamedNodeMap) nodeMap).getNamedItem(attributeName);
        if (null == attrNode)
            return null;
        return attrNode.getNodeValue();
    }
	/*
	 * 获取子页面任务栈
	 */
	public Stack<UiNode> getTaskChildStack (String windowID){
		UiNode node;
		Stack<UiNode> taskStack = new Stack<>();
		String className;
		List<WebElement> elementList = null;
//		List<String> blackList;
//		elementList = driver.findElements(By.xpath("//*[@clickable='true' and @enabled='true']"));// and @content-desc !=''
//		elementList = driver.findElements(By.xpath("//*[@class='android.view.View' or @class='android.widget.Button']"));//(By.xpath("//*[@class='android.view.View' or @class='android.widget.Button']"));
		elementList = driver.findElements(By.xpath("//*[@class='android.view.View' or @class='android.widget.Button']"));
		for(WebElement element : elementList){
			try{
				className = element.getTagName();
//				System.out.println(className);
				if(null != className){
//					if (null == blackList || notInBlackList(element, blackList)) {
                    node = new UiNode();
                    node.setId(windowID + "-" + element.getLocation().toString() + "-" + element.getSize().toString());
                    node.setWindowID(windowID);
                    node.setElement(element);
//                    node.setDepth(depth);
////                        node.setAction(clickList.contains(className));
                    taskStack.push(node);
				}		
//				}
		}catch(NoSuchElementException e){
			continue;}
		}
		return taskStack;
	}
	
	
    /**
     * 重置任务栈
     *
     * @param taskStack
     * @param existsTaskStack
     */
    protected void resetTaskStack(Stack<UiNode> taskStack, Stack<UiNode> existsTaskStack) {
        taskStack.removeAll(existsTaskStack);
        taskStack.addAll(existsTaskStack);
    }

    /*
     * 判断文件夹是否存在，不存在则创建
     * 
     */
    public void ExistFile(String path){
    	File file = new File(path);
		if(!file.exists()){
			System.out.println("不存在文件夹");
			file.mkdirs();
		}
		
    }    
}
