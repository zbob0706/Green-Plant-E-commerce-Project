DROP DATABASE IF EXISTS cromwell_garden_centre;
CREATE DATABASE cromwell_garden_centre;
USE Cromwell_Garden_Centre;

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    path VARCHAR(512) NOT NULL
);


CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255),
    password_hashed VARCHAR(255),  
    role ENUM('Customer', 'Staff', 'Manager', 'Admin')
);


CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNIQUE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    points_balance INT DEFAULT 0, -- 用来跟踪客户的积分余额
    is_trade_account BOOLEAN DEFAULT FALSE,
    credit_limit DECIMAL(10, 2),
    remaining_credit_limit DECIMAL(10, 2),-- 为贸易账户持有者管理其信用余额
    FOREIGN KEY (user_id) REFERENCES users(user_id) 
);


CREATE TABLE staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNIQUE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    role ENUM('Manager', 'Admin', 'Staff') NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) 
);





/*清仓区（Clearance Section），为了简化，可以创建一个名为“清仓商品”的顶级类别，利用搜索功能找产品。所以一共9个顶级CATEGORY*/

/*插入示例：
INSERT INTO Categories (Name, Path) VALUES
('室外植物', '001'),
('室内植物', '002'),
('肥料与喷雾', '003');

INSERT INTO Categories (Name, Path) VALUES
('树木', '001/004'),
('灌木', '001/005');

INSERT INTO Categories (Name, Path) VALUES
('10cm盆栽', '001/004/006'),
('30cm盆栽', '001/004/007');

示例 SQL 查询
查询子类别：获取 “Trees” 下所有直接子类别（即一级子类别）。
SELECT * FROM Categories WHERE Path LIKE '001/002/%' AND Path NOT LIKE '001/002/%/%';
查询所有下级类别：获取 “Trees” 下所有层级的子类别。
SELECT * FROM Categories WHERE Path LIKE '001/002/%';
*/



/* -- 假设经理决定设置或更新客户的信用额度
UPDATE Customers
SET CreditLimit = new_credit_limit,  -- 新的信用额度值
    RemainingCreditLimit = new_credit_limit  -- 重置剩余信用额度为全额
WHERE CustomerID = customer_id;  -- 客户ID

-- 当贸易账户客户下订单时，减少其剩余信用额度
UPDATE Customers
SET RemainingCreditLimit = RemainingCreditLimit - TotalAmount
WHERE CustomerID = customer_id AND IsTradeAccount = TRUE;

-- 当客户付款时，更新其剩余信用额度
UPDATE Customers
SET RemainingCreditLimit = RemainingCreditLimit + payment_amount
WHERE CustomerID = customer_id AND IsTradeAccount = TRUE;
*/

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    category_id INT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    is_out_of_stock BOOLEAN DEFAULT FALSE,
    discount DECIMAL(10, 2) DEFAULT 0,
    image VARCHAR(255),
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE SET NULL ON UPDATE CASCADE
);


/* 当前订单（Current Orders）: 包括状态为 'Prepared' 和 'Ready for Delivery' 的订单。这些状态表示订单正在处理中或准备发货，还未完成交易的步骤。
过去订单（Past Orders）: 包括状态为 'Delivered' 和 'Cancelled' 的订单。这些状态表示订单已经完成或被取消，不再活跃。*/
/* Contact information and FAQ 通过静态页面实现 */


CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10, 2) NOT NULL, /*通常包括产品的价格和相关的运费，等于invoices表格的TotalAmount和Payments表格记录的付款数额*/
    date DATE NOT NULL,
    status ENUM('Prepared', 'Ready for Pick Up', 'Ready for Delivery','Delivered', 'Cancelled') DEFAULT 'Prepared',
    shipping_method ENUM('Standard', 'Oversized', 'Large Items Pickup', 'Large Items Freight by Customer', 'Outer Islands By Quote', 'Outer Islands Pickup') NOT NULL,
    shipping_cost DECIMAL(10, 2),
	is_trade_account_order BOOLEAN DEFAULT FALSE, /*允许月底总结发票和后付款，而普通订单通常要求立即付款*/
	is_invoiced BOOLEAN DEFAULT FALSE, /*如果对trade account用户月底统一出发票，可能需要这列，OPTIONAL */
    is_paid BOOLEAN DEFAULT FALSE,
    payment_method VARCHAR(255),  -- 添加以处理各种支付方式
    payment_date DATE,  -- 支付处理日期
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE SET NULL ON UPDATE CASCADE
);


CREATE TABLE order_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price_at_time_of_order DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE invoices (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    invoice_date DATE,
    total_amount DECIMAL(10, 2),
    is_paid BOOLEAN DEFAULT FALSE,
    payment_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE ON UPDATE CASCADE
);

/* 假设积分门槛固定 */
/* 积分到礼品卡的转换逻辑在应用程序中实现，当客户的积分余额达到预定的门槛时，应用程序将自动为客户生成一张礼品卡。这个逻辑在积分更新函数中实现*/
CREATE TABLE gift_cards (
    gift_card_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    balance DECIMAL(10, 2) NOT NULL,
    expiry_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE promotions (
    promotion_id INT AUTO_INCREMENT PRIMARY KEY,
    description TEXT,
    start_date DATE,
    end_date DATE,
    discount_percentage DECIMAL(5, 2),
    is_active BOOLEAN DEFAULT TRUE  -- 快速启用或禁用促销
);


CREATE TABLE product_promotions (
    product_id INT,
    promotion_id INT,
    promotion_detail TEXT, -- 如 "买10送2"
    PRIMARY KEY (product_id, promotion_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (promotion_id) REFERENCES promotions(promotion_id) ON DELETE CASCADE ON UPDATE CASCADE
);




CREATE TABLE shipping (
    shipping_id INT AUTO_INCREMENT PRIMARY KEY,
    type ENUM('Standard', 'Oversized', 'Large Items Pickup', 'Large Items Freight by Customer', 'Outer Islands By Quote', 'Outer Islands Pickup') NOT NULL,
    shipping_cost DECIMAL(10, 2),
    description VARCHAR(255) DEFAULT NULL  /* 配送类型的额外信息或说明 */
);


CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    customer_id INT,
    payment_amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE SET NULL ON UPDATE CASCADE
);

/* -- 订单创建时减少剩余信用额度
UPDATE Customers
SET RemainingCreditLimit = RemainingCreditLimit - (SELECT TotalAmount FROM Orders WHERE OrderID = new_order_id)
WHERE CustomerID = customer_id AND IsTradeAccount = TRUE;

-- 客户支付时增加剩余信用额度
UPDATE Customers
SET RemainingCreditLimit = RemainingCreditLimit + payment_amount
WHERE CustomerID = customer_id AND IsTradeAccount = TRUE;
*/

CREATE TABLE trade_account_applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    applied_date DATE,
    status ENUM('Pending', 'Approved', 'Denied') DEFAULT 'Pending',
    approved_credit_limit DECIMAL(10, 2),  -- 经理批准的信用额度
    approved_by INT, -- 经理的员工ID
    approval_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (approved_by) REFERENCES staff(staff_id) ON DELETE SET NULL ON UPDATE CASCADE
);

/*示例 SQL 操作
当经理批准申请时，可以执行如下 SQL 操作来更新申请状态和设置信用额度：
UPDATE TradeAccountApplications
SET
    Status = 'Approved',
    ApprovedCreditLimit = new_credit_limit,  -- 经理设定的新信用额度
    ApprovedBy = Manager_id,  -- 执行批准操作的经理员工ID
    ApprovalDate = CURDATE()  -- 当前日期作为批准日期
WHERE ApplicationID = application_id;

之后，将批准的信用额度更新到 Customers 表中：
UPDATE Customers
SET
    CreditLimit = (SELECT ApprovedCreditLimit FROM TradeAccountApplications WHERE ApplicationID = application_id),
    RemainingCreditLimit = (SELECT ApprovedCreditLimit FROM TradeAccountApplications WHERE ApplicationID = application_id)
WHERE CustomerID = (SELECT CustomerID FROM TradeAccountApplications WHERE ApplicationID = application_id);*/

/*这张表用于跟踪信用额度变更请求，包括申请的新额度、申请状态、处理人员等信息。*/

CREATE TABLE credit_limit_changes (
    change_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    requested_limit DECIMAL(10, 2),
    status ENUM('Requested', 'Approved', 'Denied') DEFAULT 'Requested',
    processed_by INT,  -- 经理或授权人员的员工ID
    request_date DATE,
    processed_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (processed_by) REFERENCES staff(staff_id) ON DELETE SET NULL ON UPDATE CASCADE
);
