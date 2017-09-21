#-*-coding=utf8-*-
import platform

#全局目录相关，包含打包脚本所有需要的数据
#TOOL_DIR为打包工具存放目录，WORK_DIR为打包工作目录
#JAVA_DIR为定制java运行时，如果没有配置则使用系统的
# if platform.system() == 'Windows':
#     GOD_TOOL_DIR 			= r'D:\RainbowCenter\com\boyaa\RainbowRepacker\tool'
#     GOD_WORK_DIR 			= r'D:\RainbowCenter\com\boyaa\RainbowRepacker\workspace'
# elif platform.system() == 'Linux':
#     GOD_TOOL_DIR             = '/home/junmeng/GodSDKLinuxTools'
#     GOD_WORK_DIR             = '/home/junmeng/GodSDKWorkSpace'
import os
dirName = os.path.dirname(os.path.realpath(__file__))
GOD_TOOL_DIR = os.path.abspath(os.path.join(dirName, os.path.pardir, 'tool'))
GOD_WORK_DIR = os.path.abspath(os.path.join(dirName, os.path.pardir, 'workspace'))
SUPPORT_DIR = os.path.abspath(os.path.join(dirName, os.path.pardir, 'automation_support_files'))

GOD_JAVA_DIR 			= GOD_TOOL_DIR + '/jre'
#工具相关子常量
TOOL_DEF_BAKSMALI_JARFILE 	= 'baksmali-2.0.jar'
TOOL_DEF_SMALI_JARFILE 	  	= 'smali-2.0.jar'
TOOL_DEF_APKTOOL_JARFILE  	= 'apktool_2.0.2.jar'
#java相关子常量
JAVAC_COMPILE_VERSION           = '1.6'

SDK_PLUGIN_PLATTERN_FILENAME = 'plugin.xml'