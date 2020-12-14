import xlrd
import xlwt
from xlutils.copy import copy
# 打开想要更改的excel文件
old_excel = xlrd.open_workbook('douban.xls', formatting_info=True)
# 将操作文件对象拷贝，变成可写的workbook对象
old_excel = copy(old_excel)
# 获得第一个sheet的对象
worksheet = old_excel.get_sheet(0)
# 写入数据
col = ('rank', 'name', 'picturelink', 'country', ' year', 'type', 'director',
       'role', 'average_star', 'comment_num', 'content_tag')
for i in range(0, 11):
    worksheet.write(0, i, col[i])

# 另存为excel文件，并将文件命名
old_excel.save('douban.xls')