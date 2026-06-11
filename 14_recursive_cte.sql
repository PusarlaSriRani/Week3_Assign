-- 86. Display category hierarchy

WITH RECURSIVE category_tree AS (
    SELECT category_id,
           category_name,
           parent_category_id,
           1 AS level
    FROM categories
    WHERE parent_category_id IS NULL

    UNION ALL

    SELECT c.category_id,
           c.category_name,
           c.parent_category_id,
           ct.level + 1
    FROM categories c
    JOIN category_tree ct
    ON c.parent_category_id = ct.category_id
)
SELECT * FROM category_tree;


-- 87. Display sub-category tree

WITH RECURSIVE sub_category AS (
    SELECT category_id,
           category_name,
           parent_category_id
    FROM categories
    WHERE parent_category_id IS NULL

    UNION ALL

    SELECT c.category_id,
           c.category_name,
           c.parent_category_id
    FROM categories c
    JOIN sub_category s
    ON c.parent_category_id = s.category_id
)
SELECT * FROM sub_category;


-- 88. Employee reporting hierarchy

WITH RECURSIVE employee_tree AS (
    SELECT employee_id,
           employee_name,
           manager_id,
           1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.employee_id,
           e.employee_name,
           e.manager_id,
           et.level + 1
    FROM employees e
    JOIN employee_tree et
    ON e.manager_id = et.employee_id
)
SELECT * FROM employee_tree;


-- 89. Managers and employees under them

WITH RECURSIVE manager_tree AS (
    SELECT employee_id,
           employee_name,
           manager_id
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.employee_id,
           e.employee_name,
           e.manager_id
    FROM employees e
    JOIN manager_tree m
    ON e.manager_id = m.employee_id
)
SELECT * FROM manager_tree;


-- 90. Generate category depth levels

WITH RECURSIVE category_depth AS (
    SELECT category_id,
           category_name,
           parent_category_id,
           1 depth
    FROM categories
    WHERE parent_category_id IS NULL

    UNION ALL

    SELECT c.category_id,
           c.category_name,
           c.parent_category_id,
           cd.depth + 1
    FROM categories c
    JOIN category_depth cd
    ON c.parent_category_id = cd.category_id
)
SELECT * FROM category_depth;
