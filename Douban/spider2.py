import requests
from bs4 import BeautifulSoup


class Douban:
    def __init__(self):
        self.URL = 'https://movie.douban.com/top250'
        self.startnum = []
        for start_num in range(0, 251, 25):
            self.startnum.append(start_num)
        self.header = {
            'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36 Edg/86.0.622.68'
        }

    def get_top250(self):
        for start in self.startnum:
            start = str(start)
            html = requests.get(self.URL, params={'start': start})
            soup = BeautifulSoup(html.text, 'html.parser')


if __name__ == "__main__":
    cls = Douban()
    cls.get_top250()
