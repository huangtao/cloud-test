package com.boyaa.checkjar.test;

import java.io.File;
import java.io.FileInputStream;
import java.math.BigInteger;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.security.MessageDigest;

/**
 * Created by quqing on 16/5/4.
 */
public class MD5Generator {
    /**
     * 计算指定文件的MD5签名
     *
     * @param fileName
     * @return MD5
     */
    public static String getMD5ByFile(String fileName) throws Exception {
        String value = null;
        File file = new File(fileName);
        FileInputStream in = null;
        try {
            in = new FileInputStream(file);
            MappedByteBuffer byteBuffer = in.getChannel().map(FileChannel.MapMode.READ_ONLY, 0, file.length());
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(byteBuffer);
            BigInteger bi = new BigInteger(1, md5.digest());
            value = bi.toString(16);
        } finally {
            if (in != null) {
                in.close();
            }
        }
        return value;
    }

    /**
     * 计算指定字符串的MD5签名
     *
     * @param content
     * @return MD5
     * @throws Exception
     */
    public static String getMD5ByString(String content) throws Exception {
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(content.getBytes());
            BigInteger bi = new BigInteger(1, md5.digest());
            return bi.toString(16);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
