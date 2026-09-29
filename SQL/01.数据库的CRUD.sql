-- =============================================================================
-- 说明: DATABASE 级别的增删改查
-- 日期: 2026-09-16
-- 切换行注释 --       Cmd + /
-- 切换块注释 \/* *\/  Shift + Option + A
-- =============================================================================

-- ========== 新建数据库 ==========
CREATE DATABASE IF NOT EXISTS booker_data_service DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_0900_ai_ci;

-- ========== 查看当前连接的所有数据库 ==========
SHOW DATABASES;

-- ========== 查看创建数据库的SQL语句 ==========
SHOW CREATE DATABASE booker_data_service;

-- ========== 查看数据库的字符集 ==========
SELECT
    SCHEMA_NAME,
    DEFAULT_CHARACTER_SET_NAME,
    DEFAULT_COLLATION_NAME
FROM information_schema.SCHEMATA
WHERE
    SCHEMA_NAME = "booker_data_service";

-- ========== 删除数据库 ==========
DROP DATABASE IF EXISTS booker_data_service;

SHOW VARIABLES like "character_%";

SHOW DATABASES;