import requests
from bs4 import BeautifulSoup
import xlwt
import time


class Douban:
    def __init__(self):
        self.URL = 'https://movie.douban.com/top250'
        self.startnum = []
        for start_num in range(0, 251, 25):
            self.startnum.append(start_num)
        self.header = {
            'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36 Edg/86.0.622.69'
        }

    def get_top250(self):
        datalist = []
        for start in self.startnum:
            start = str(start)
            html = requests.get(self.URL,
                                params={'start': start},
                                headers=self.header)
            soup = BeautifulSoup(html.text, 'html.parser')
            # 1.所有电影信息存储在ol标签
            Obj = soup.find('div', class_='article')

            if Obj != None:
                details = Obj.find_all('li')
                for detail in details:
                    data = []
                    #排名
                    data.append(detail.find('em').get_text())
                    # 电影名称
                    data.append(detail.find('span', class_='title').get_text())
                    #图片链接
                    picture = detail.find('img')
                    data.append(picture.get('src'))
                    # 电影年份
                    #抓取年份、国家
                    actor_infos = detail.find('p').get_text().strip().split(
                        '\n')
                    actor_infos1 = actor_infos[0].split('\xa0\xa0\xa0')
                    director = actor_infos1[0]
                    data.append(director)
                    if len(actor_infos1) >= 2:
                        role = actor_infos1[1]
                    else:
                        role = ''
                    data.append(role)
                    year_area = actor_infos[1].lstrip().split('\xa0/\xa0')
                    data.append(year_area[0])
                    data.append(year_area[1])
                    data.append(year_area[2])

                    data.append(0)
                    data.append(0)
                    data.append('')
                    datalist.append(data)
                    print("爬取完", data[0])
                time.sleep(1)

        self.saveData(datalist)

    def saveData(self, datalist):
        workbook = xlwt.Workbook(encoding='utf-8')
        worksheet = workbook.add_sheet('Doubantop250', cell_overwrite_ok=True)
        col = ('rank', 'name', 'picturelink', 'director', 'role', ' year',
               'country', 'movietype', 'average_star', 'comment_num',
               'content_tag')
        for i in range(0, 11):
            worksheet.write(0, i, col[i])
        for i in range(250):
            data = datalist[i]
            for j in range(0, 11):
                worksheet.write(i + 1, j, data[j])
                print("写入", i + 1, "条")
        workbook.save('douban.xls')


if __name__ == "__main__":
    cls = Douban()
    cls.get_top250()
