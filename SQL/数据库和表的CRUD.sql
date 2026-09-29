SHOW DATABASES;

USE atguigudb;

SHOW TABLES;

/*
# 1、创建数据库test01_library
# 2、创建表 books，表结构如下：
字段名 字段说明 数据类型
id 书编号 INT
name 书名 VARCHAR(50)
authors 作者 VARCHAR(100)
price 价格 FLOAT
pubdate 出版日期 YEAR
note 说明 VARCHAR(100)
num 库存 INT
# 3、向books表中插入记录
# 1）不指定字段名称，插入第一条记录
# 2）指定所有字段名称，插入第二记录
# 3）同时插入多条记录（剩下的所有记录）
id name authors price pubdate note num
1 Tal of AAA Dickes 23 1995 novel 11
2 EmmaT Jane lura 35 1993 joke 22
3 Story of Jane Jane Tim 40 2001 novel 0
4 Lovey Day George Byron 20 2005 novel 30
5 Old land Honore Blade 30 2010 law 0
6 The Battle Upton Sara 30 1999 medicine 40
7 Rose Hood Richard haggard 28 2008 cartoon 28
# 4、将小说类型(novel)的书的价格都增加5。
# 5、将名称为EmmaT的书的价格改为40，并将说明改为drama。
# 6、删除库存为0的记录。
# 7、统计书名中包含a字母的书
# 8、统计书名中包含a字母的书的数量和库存总量
# 9、找出“novel”类型的书，按照价格降序排列
# 10、查询图书信息，按照库存量降序排列，如果库存量相同的按照note升序排列
# 11、按照note分类统计书的数量
# 12、按照note分类统计书的库存量，显示库存量超过30本的
# 13、查询所有图书，每页显示5本，显示第二页
# 14、按照note分类统计书的库存量，显示库存量最多的
# 15、查询书名达到10个字符的书，不包括里面的空格
# 16、查询书名和类型，其中note值为novel显示小说，law显示法律，medicine显示医药，cartoon显示卡通，
joke显示笑话
# 17、查询书名、库存，其中num值超过30本的，显示滞销，大于0并低于10的，显示畅销，为0的显示需要无货
# 18、统计每一种note的库存量，并合计总量
# 19、统计每一种note的数量，并合计总量
# 20、统计库存量前三名的图书
# 21、找出最早出版的一本书
# 22、找出novel中价格最高的一本书
# 23、找出书名中字数最多的一本书，不含空格
*/

SHOW DATABASES;

CREATE DATABASE IF NOT EXISTS test01_library CHARACTER SET utf8mb4;

USE test01_library;

CREATE TABLE IF NOT EXISTS books (
    id INT,
    `name` VARCHAR(50),
    authors VARCHAR(100),
    price FLOAT,
    pubdate YEAR,
    note VARCHAR(100),
    num INT
);

SHOW TABLES;

DESC books;

INSERT INTO
    books
VALUES (
        1,
        "Tal of AAA",
        "Dickes",
        23,
        '1995',
        'novel',
        11
    );

INSERT INTO
    books (
        id,
        name,
        authors,
        price,
        pubdate,
        note,
        num
    )
VALUES (
        2,
        "EmmaT",
        "Jane lura",
        35,
        '1993',
        'joke',
        22
    );

INSERT INTO
    books (
        id,
        name,
        authors,
        price,
        pubdate,
        note,
        num
    )
VALUES (
        3,
        "Story of Jane",
        "Jane Tim ",
        40,
        '2001',
        'novel',
        0
    ),
    (
        4,
        "Lovey Day",
        "George Byron",
        20,
        '2005',
        'novel',
        30
    ),
    (
        5,
        "Old land",
        "Honore Blade",
        30,
        '2010',
        'law',
        0
    ),
    (
        6,
        "The Battle",
        "Upton Sara",
        30,
        '1999',
        'medicine',
        40
    ),
    (
        7,
        "Rose Hood",
        "Richard haggard",
        28,
        '2008',
        'cartoon',
        28
    );

SELECT * FROM books;

UPDATE books SET price = price + 5 WHERE note = "novel";

UPDATE books SET price = 40, note = 'drama' WHERE name = 'EmmaT';

DELETE FROM books WHERE num = 0;

SELECT * FROM books WHERE name LIKE "%a%";

SELECT COUNT(1), SUM(num) FROM books WHERE name LIKE "%a%";

SELECT * FROM books WHERE note = 'novel' ORDER BY price DESC;

SELECT * FROM books ORDER BY num DESC, note ASC;

SELECT note, COUNT(1) FROM books GROUP BY note;

SELECT note, SUM(num) FROM books GROUP BY note HAVING SUM(num) >= 30;

SELECT * FROM books LIMIT 5 OFFSET 5;

-- 🚩
SELECT note, SUM(num)
FROM books
GROUP BY
    note
ORDER BY SUM(num) DESC
LIMIT 1
OFFSET
    0;

SELECT name, CHAR_LENGTH(name),
REPLACE (name, ' ', '')
FROM books
WHERE
    CHAR_LENGTH(
        REPLACE (name, ' ', '')
    ) >= 10;

SELECT
    *,
    name,
    CASE note
        WHEN 'novel' THEN '小说'
        WHEN 'law' THEN '法律'
        WHEN 'medicine' THEN '医药'
        WHEN 'cartoon' THEN '卡通'
        WHEN 'joke' THEN '笑话'
        ELSE ""
    END AS "图书类型"
FROM books;

SELECT
    *,
    name,
    CASE
        WHEN num >= 30 THEN '滞销'
        WHEN num >= 0
        AND num <= 10 THEN '畅销'
        WHEN num = 0 THEN '无货'
    END AS "销售情况"
FROM books;

SELECT IFNULL(note, "合集库存总量"), SUM(num)
FROM books
GROUP BY
    note
WITH
    ROLLUP;

SELECT IFNULL(note, "合集总数"), COUNT(num)
FROM books
GROUP BY
    note
WITH
    ROLLUP;

SELECT * FROM books ORDER BY num DESC LIMIT 3 OFFSET 0;

SELECT * FROM books ORDER BY pubdate ASC LIMIT 1;

SELECT * FROM books ORDER BY price DESC LIMIT 1;

SELECT *
FROM books
ORDER BY CHAR_LENGTH(
        REPLACE (name, " ", "")
    ) DESC
LIMIT 1;

SELECT NOW(), CURRENT_TIMESTAMP(), CURDATE(), CURRENT_DATE()
FROM DUAL;

SELECT *
FROM information_schema.table_constraints
WHERE
    table_name = "employees";

USE atguigudb;

SHOW INDEX FROM employees;

ALTER TABLE employees DROP INDEX emp_email_uk;

# 要添加列级约束 注意不能自定义约束名称
ALTER TABLE employees ADD UNIQUE (name,id);

# 要添加表级别玉树 可以自定义约束名称
ALTER TABLE CONSTRAINT name_id_uk UNIQUE(name,id);