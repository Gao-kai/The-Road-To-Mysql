// 模拟INNER JOIN 必须完全匹配
// 如果员工表中depid某个为null，那么结果数组中一行都不出来
// 怎么解决？
// 连接条件加一个emp.depid === dep.id || emp.depid === null 哪怕员工表中depid为空 也把员工信息带上结果数组
const emps = []
const deps = []
const locs = []
const res = [];
for (const emp of emps) {
  for (const dep of deps) {
    if (emp.depid === dep.id || emp.depid === null) {
      for (const loc of locs) {
        if (dep.locId === loc.id) {
          res.push({ emp_name: emp.name, dep_name: dep.name, loc_name: loc.name });
        }
      }
    }
  }
}

    

    
