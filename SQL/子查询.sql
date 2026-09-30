show databases;

use atguigudb;

/*
 * 01:开篇题目：谁的工资比Abel高？
 */

# 方法1:两步查询不推荐
select e.salary from employees e where e.last_name = "Abel";

select * from employees e where e.salary > 11000.00;

# 方法2:自连接查询（推荐）注意常量的比较放在where中 on中放的一定是两个表的连接条件
# 列名用双引号 因为会在默认sql mode下面会认为是一个字符串子面量，查询语句中函数中用单引号
select *
from employees e1
    join employees e2 on e1.salary > e2.salary
where
    e2.last_name = "Abel";

# 方法3:子查询
select *
from employees e1
where
    e1.salary > (
        select MAX(e2.salary)
        from employees e2
        where
            e2.last_name = 'Abel'
    );

/*
 * 02:子查询的分类
 * 按照子查询返回的数据条数，分为单行子查询和多行子查询
 * 按照子查询是否被执行多次，分为不相关子查询和相关子查询
 * 不相关子查询：子查询的执行结果和主查询提供的行数据无关，比如子查询查的是公司最高工资，这是一个常量
 * 相关子查询：子查询的执行结果和主查询提供的行数据相关，比如子查询的是员工所在部门的最高工资，这个值随着员工不同而不同
 */

# 查询工资大于该员工所在部门平均工资的员工信息（相关子查询）

select * from employees e
join departments d
on e.department_id = d.department_id;

select * from employees;