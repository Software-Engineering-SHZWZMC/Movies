from bs4 import BeautifulSoup  # 网页解析，获取数据
import re  # 正则表达式，文字匹配
import urllib.request  # 制定URL,获取网页数据
import urllib.error
import xlwt  # excel
import pymysql  # mysql


def main():
    baseurl = "https://movie.douban.com/top250?start="
    # 1.爬取网页
    datalist = getData(baseurl)
    savepath = ".\\DoubanTop250.xls"
    # 3.保存数据
    saveData(savepath)


def getData(baseurl):
    '''爬取网页'''
    datalist = []
    # 2.逐一解析数据
    return datalist


def saveData(savepath):
    pass


if __name__ == "__main__":  # 执行当前程序
    main()
