package com.boyaa.checkjar.test;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by quqing on 16/5/5.
 */
public class ConfigProvider {

    public String getMD5ByString(String string) throws Exception {
        return MD5Generator.getMD5ByString(string);
    }
//
//    public List<String> getModule(String fileName) {
//        Node node;
//        List<String> moduleFlow;
//        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
//        try {
//            DocumentBuilder db = dbf.newDocumentBuilder();
//            Document document = db.parse(fileName);
//
//            node = document.getElementsByTagName("module").item(0);
//            moduleFlow = getList(node);
//
//            return moduleFlow;
//
//        } catch (ParserConfigurationException e) {
//             e.fillInStackTrace();
//        } catch (SAXException e) {
//             e.fillInStackTrace();
//        } catch (IOException e) {
//             e.fillInStackTrace();
//        }
//        return null;
//    }
//
//
//    private List<String> getList(Node node) {
//        List<String> list = null;
//        if (null != node && !node.getTextContent().isEmpty()) {
//            list = new ArrayList<>();
//            NodeList nodeList = node.getChildNodes();
//            for (int i = 0; i < nodeList.getLength(); i++) {
//                if (nodeList.item(i).getNodeType() == Node.ELEMENT_NODE)
//                    list.add(nodeList.item(i).getTextContent().trim());
//            }
//        }
//        return list;
//    }
}