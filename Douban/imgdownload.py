# encoding=utf-8

import requests
from bs4 import BeautifulSoup
import pandas as pd
import time
import urllib.request
#设置请求头
headers = {
    'User-Agent':
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36 Edg/86.0.622.69622.69'
}


#主函数入口
def main():
    base = "https://movie.douban.com/top250"
    info = []
    global rank
    rank = 186
    for page in range(186, 250, 25):
        url = base + "?start=" + str(page)
        html = get_html_text(url)
        get_page_info(html, info)


#提交请求，获取页面
def get_html_text(url):
    try:
        r = requests.get(url, headers=headers)
        r.raise_for_status()
        return r.text
    except requests.HTTPError:
        return '爬取失败'


#每一页
def get_page_info(html, info):
    soup = BeautifulSoup(html, 'html.parser')
    movies = soup.find_all('div', attrs={'class':
                                         'hd'})  #查找页面上所有div标签中，class=hd的tag对象。
    for movie in movies:
        get_movie_info(movie, info)


#每一部电影
def get_movie_info(movie, info):
    a = movie.a
    href = a.get('href')
    details = {}
    get_movie_details(href, details)
    info.append(details)
    time.sleep(1)


#每一部电影的详细信息
def get_movie_details(href, details):
    global rank
    rank = rank + 1

    html = get_html_text(href)
    soup = BeautifulSoup(html, 'html.parser')

    picturelink = soup.find('img')
    dizhi = picturelink.get('src')
    bc = 'image/' + str(rank) + ".jpg"
    # 保存的名字
    urllib.request.urlretrieve(dizhi, bc)
    print("已爬取完第" + str(rank) + "部")
    time.sleep(5)


main()