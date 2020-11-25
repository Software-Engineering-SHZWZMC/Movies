import xlrd
import pymysql
# Open the workbook and define the worksheet
book = xlrd.open_workbook("moviessummary.xlsx")
sheet = book.sheet_by_name("Sheet1")

#建立一个MySQL连接
database = pymysql.connect(host="localhost",
                           user="root",
                           passwd="sxy000217",
                           db="douban")

# 获得游标对象, 用于逐行遍历数据库数据
cursor = database.cursor()

# 创建插入SQL语句
query = """update movies set moviesummary=%s where rank =%s"""
#列名中不能带有/
# 创建一个for循环迭代读取xls文件每行数据的, 从第二行开始是要跳过标题
for r in range(1, sheet.nrows):

    moviesummary = sheet.cell(r, 1).value
    # 执行sql语句
    values = (moviesummary, r)
    cursor.execute(query, values)

# 关闭游标
cursor.close()

# 提交
database.commit()

# 关闭数据库连接
database.close()
