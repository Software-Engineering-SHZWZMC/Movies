import xlrd
import pymysql
# Open the workbook and define the worksheet
book = xlrd.open_workbook("movies.xlsx")
sheet = book.sheet_by_name("movies")

#建立一个MySQL连接
database = pymysql.connect(host="localhost",
                           user="root",
                           passwd="sxy000217",
                           db="douban")

# 获得游标对象, 用于逐行遍历数据库数据
cursor = database.cursor()

# 创建插入SQL语句
query = """Insert into movies(rank, moviename, picturelink,countryordistrict,movieyear,movietime,movietype1,movietype2,movietype3,movietype4,movietype5,director1,director2, movierole1, movierole2,movierole3,movierole4,
average_star, comment_num, content_tag1,content_tag2,content_tag3,content_tag4,content_tag5,
content_tag6,content_tag7,content_tag8) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s,%s, %s, %s, %s, %s, %s, %s, %s, %s, %s,%s, %s, %s, %s, %s, %s, %s)"""
#列名中不能带有/
# 创建一个for循环迭代读取xls文件每行数据的, 从第二行开始是要跳过标题
for r in range(1, sheet.nrows):

    rank = sheet.cell(r, 0).value
    moviename = sheet.cell(r, 1).value
    picturelink = sheet.cell(r, 2).value
    country = sheet.cell(r, 3).value
    movieyear = sheet.cell(r, 4).value

    movietime = sheet.cell(r, 5).value
    movietype1 = sheet.cell(r, 6).value
    movietype2 = sheet.cell(r, 7).value
    movietype3 = sheet.cell(r, 8).value
    movietype4 = sheet.cell(r, 9).value
    movietype5 = sheet.cell(r, 10).value
    director1 = sheet.cell(r, 11).value
    director2 = sheet.cell(r, 12).value
    movierole1 = sheet.cell(r, 13).value
    movierole2 = sheet.cell(r, 14).value
    movierole3 = sheet.cell(r, 15).value
    movierole4 = sheet.cell(r, 16).value
    average_star = sheet.cell(r, 17).value
    comment_num = sheet.cell(r, 18).value
    content_tag1 = sheet.cell(r, 19).value
    content_tag2 = sheet.cell(r, 20).value
    content_tag3 = sheet.cell(r, 21).value
    content_tag4 = sheet.cell(r, 22).value
    content_tag5 = sheet.cell(r, 23).value
    content_tag6 = sheet.cell(r, 24).value
    content_tag7 = sheet.cell(r, 25).value
    content_tag8 = sheet.cell(r, 26).value
    values = (rank, moviename, picturelink, country, movieyear, movietime,
              movietype1, movietype2, movietype3, movietype4, movietype5,
              director1, director2, movierole1, movierole2, movierole3,
              movierole4, average_star, comment_num, content_tag1,
              content_tag2, content_tag3, content_tag4, content_tag5,
              content_tag6, content_tag7, content_tag8)
    # 执行sql语句
    cursor.execute(query, values)

# 关闭游标
cursor.close()

# 提交
database.commit()

# 关闭数据库连接
database.close()
