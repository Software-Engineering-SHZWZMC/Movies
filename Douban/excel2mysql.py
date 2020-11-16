import xlrd
import pymysql
# Open the workbook and define the worksheet
book = xlrd.open_workbook("douban.xlsx")
sheet = book.sheet_by_name("douban")

#建立一个MySQL连接
database = pymysql.connect(host="localhost",
                           user="root",
                           passwd="sxy000217",
                           db="douban")

# 获得游标对象, 用于逐行遍历数据库数据
cursor = database.cursor()

# 创建插入SQL语句
query = """INSERT INTO introduction(rank, moviename, picturelink, director, movierole, movieyear,country, movietype, average_star, comment_num, content_tag) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"""

# 创建一个for循环迭代读取xls文件每行数据的, 从第二行开始是要跳过标题
for r in range(1, sheet.nrows):
    rank = sheet.cell(r, 0).value
    moviename = sheet.cell(r, 1).value
    picturelink = sheet.cell(r, 2).value
    director = sheet.cell(r, 3).value
    movierole = sheet.cell(r, 4).value
    movieyear = sheet.cell(r, 5).value
    country = sheet.cell(r, 6).value
    movietype = sheet.cell(r, 7).value
    average_star = sheet.cell(r, 8).value
    comment_num = sheet.cell(r, 9).value
    content_tag = sheet.cell(r, 10).value

    values = (rank, moviename, picturelink, director, movierole, movieyear,
              country, movietype, average_star, comment_num, content_tag)

    # 执行sql语句
    cursor.execute(query, values)

# 关闭游标
cursor.close()

# 提交
database.commit()

# 关闭数据库连接
database.close()
