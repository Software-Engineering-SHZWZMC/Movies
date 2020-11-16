import pymysql
import csv
import codecs


def get_conn():
    conn = pymysql.connect(host='localhost',
                           port=3306,
                           user='root',
                           passwd='sxy000217',
                           db='douban',
                           charset='utf8')
    return conn


def insert(cur, sql, args):
    cur.execute(sql, args)


def read_csv_to_mysql(filename):
    with codecs.open(filename=filename, mode='r', encoding='utf-8') as f:
        reader = csv.reader(f)
        head = next(reader)
        conn = get_conn()
        cur = conn.cursor()
        sql = 'Create table movie250 (rank, name, picturelink, director, role, year,country, movietype, average_star, comment_num, content_tag) values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s),
               '

        for item in reader:
            if item[1] is None or item[1] == '':  # item[1]作为唯一键，不能为null
                continue
            args = tuple(item)
            print(args)
            insert(cur, sql=sql, args=args)
        conn.commit()
        cur.close()
        conn.close()


if __name__ == '__main__':
    read_csv_to_mysql('douban.csv')
