# encoding=utf-8

import requests
from bs4 import BeautifulSoup
import pandas as pd
import time
import re
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
    rank = 0
    for page in range(0, 250, 25):
        url = base + "?start=" + str(page)
        html = get_html_text(url)
        get_page_info(html, info)
    data = pd.DataFrame(info)

    data.to_excel('movies.xlsx', encoding="utf_8_sig")


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
    moviename = soup.find('span', property="v:itemreviewed").text.split(' ')
    details['排名'] = rank
    details['电影名字'] = moviename[0]
    picturelink = soup.find('img')
    picturelink = picturelink.get('src')
    details['图片链接'] = picturelink
    attrs = soup.find_all('span', attrs={'class': 'pl'})
    for attr in attrs:
        if attr.string == '导演':
            director = attr.next_sibling.next_sibling.text.split('/')
            details['主导演'] = director[0]
            if len(director) >= 2:
                details['副导演'] = director[1]
        if attr.string == '主演':
            cast = attr.next_sibling.next_sibling.text.split('/')
            i = 0
            for cast1 in cast:
                if (i >= 4):
                    break
                details['主演' + str(i + 1) + '号'] = cast1
                i = i + 1
        if attr.string == '类型:':
            i = 1
            genres = soup.find_all('span', attrs={'property': 'v:genre'})
            for genre in genres:
                details[('类型' + str(i))] = genre.string
                i = i + 1
        if attr.string == '制片国家/地区:':
            details['国家/地区'] = attr.next_sibling
        if attr.string == '上映日期:':
            dates = soup.find_all('span',
                                  attrs={'property': 'v:initialReleaseDate'})
            date = ' / '.join([item.string for item in dates])
            details['上映年份'] = date[0:4]
        if attr.string == '片长:':
            details['片长'] = attr.next_sibling.next_sibling.string
    tags = soup.find('div', class_='tags-body').find_all(
        'a', class_="")  #先找到tags-body的标签，然后找到a的子标签。
    i = 1
    for tag in tags:
        details[('标签' + str(i))] = tag.text
        i = i + 1
    details['评价人数'] = 0
    details['平均星数'] = 0
    print(details)
    print("已爬取完第" + str(rank) + "部")
    time.sleep(1)


main()