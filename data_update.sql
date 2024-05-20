-- 更新 categories 表结构
ALTER TABLE categories
ADD COLUMN description TEXT AFTER name,
ADD COLUMN image VARCHAR(255) AFTER description;

-- 更新 products 表结构
ALTER TABLE products
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP AFTER image,
ADD COLUMN updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER created_at,
MODIFY COLUMN is_out_of_stock BOOLEAN AS (stock_quantity = 0) STORED;


DELETE FROM `cromwell_garden_centre`.`categories` WHERE (`category_id` = '5');
UPDATE `cromwell_garden_centre`.`categories` SET `category_id` = '5' WHERE (`category_id` = '6');
UPDATE `cromwell_garden_centre`.`categories` SET `category_id` = '6' WHERE (`category_id` = '7');
UPDATE `cromwell_garden_centre`.`categories` SET `category_id` = '7' WHERE (`category_id` = '8');
UPDATE `cromwell_garden_centre`.`categories` SET `category_id` = '8' WHERE (`category_id` = '9');
UPDATE `cromwell_garden_centre`.`categories` SET `category_id` = '9' WHERE (`category_id` = '10');
UPDATE `cromwell_garden_centre`.`categories` SET `category_id` = '10' WHERE (`category_id` = '11');
UPDATE `cromwell_garden_centre`.`categories` SET `category_id` = '11' WHERE (`category_id` = '12');
UPDATE `cromwell_garden_centre`.`categories` SET `category_id` = '12' WHERE (`category_id` = '13');
UPDATE `cromwell_garden_centre`.`categories` SET `category_id` = '13' WHERE (`category_id` = '14');


INSERT INTO categories (name, description, image, path) VALUES
('Outdoor Plants', 'A variety of plants suitable for outdoor environments', 'c (1).jpg', '001'),
('Trees', 'Different types of trees for your garden', 'c (2).jpg', '001/004'),

('10cm Pots', '10cm pots for planting', 'c (3).jpg', '001/004/006'),
('30cm Pots', '30cm pots for planting', 'c (4).jpg', '001/004/007'),

('Indoor Plants', 'A variety of plants suitable for indoor environments', 'c (6).jpg', '002'),
('Seeds & Bulbs', 'Various seeds and bulbs for planting', 'c (7).jpg', '003'),
('Fertilizers and Sprays', 'Fertilizers and sprays for plant care', 'c (8).jpg', '004'),
('Pots & Planters', 'Different sizes of pots and planters', 'c (9).jpg', '005'),
('Tools & Gloves', 'Garden tools and gloves', 'c (10).jpg', '006'),
('Garden Decorations', 'Decorations to enhance your garden', 'c (11).jpg', '007'),
('Irrigation', 'Irrigation systems for your garden', 'c (12).jpg', '008'),
('NZ Natives', 'A variety of native plants of New Zealand', 'c (13).jpg', '009'),
('Clearance Items', 'Discounted items on clearance', 'c (14).jpg', '010');

-- 插入产品数据

-- Outdoor Plants
INSERT INTO products (name, description, category_id, price, stock_quantity, discount, image) VALUES
('Rose Bush', 'A beautiful rose bush for your garden', 1, 15.99, 25, 0, 'p-1.jpg'),
('Lavender', 'Fragrant lavender plant', 1, 12.99, 30, 0, 'p-2.jpg'),
('Hibiscus', 'Vibrant hibiscus plant', 1, 18.99, 20, 0, 'p-3.jpg'),
('Tulip Bulbs', 'Pack of colorful tulip bulbs', 1, 9.99, 50, 0, 'p-4.jpg'),
('Daisy', 'Charming daisy flowers', 1, 5.99, 40, 0, 'p-5.jpg'),
('Marigold', 'Bright marigold flowers', 2, 6.99, 35, 0, 'p-6.jpg'),
('Sunflower', 'Tall and sunny sunflower', 2, 8.99, 25, 0, 'p-7.jpg'),
('Gardenia', 'Elegant gardenia plant', 3, 14.99, 20, 0, 'p-8.jpg'),
('Hydrangea', 'Colorful hydrangea bush', 3, 19.99, 15, 0, 'p-9.jpg'),
('Petunia', 'Lovely petunia flowers', 4, 7.99, 45, 0, 'p-10.jpg'),
('Begonia', 'Beautiful begonia plant', 4, 11.99, 25, 0, 'p-11.jpg'),
('Geranium', 'Bright geranium flowers', 2, 10.99, 35, 0, 'p-12.jpg'),
('Orchid', 'Exotic orchid plant', 3, 25.99, 10, 0, 'p-13.jpg'),
('Peony', 'Luxurious peony plant', 4, 20.99, 20, 0, 'p-14.jpg'),
('Fuchsia', 'Colorful fuchsia flowers', 1, 13.99, 30, 0, 'p-15.jpg');

-- Indoor Plants
INSERT INTO products (name, description, category_id, price, stock_quantity, discount, image) VALUES
('Snake Plant', 'Hardy indoor snake plant', 5, 19.99, 20, 0, 'p-16.jpg'),
('Aloe Vera', 'Healing aloe vera plant', 5, 14.99, 30, 0, 'p-17.jpg'),
('Peace Lily', 'Elegant peace lily plant', 5, 12.99, 25, 0, 'p-18.jpg'),
('Spider Plant', 'Easy-care spider plant', 5, 9.99, 40, 0, 'p-19.jpg'),
('Fiddle Leaf Fig', 'Trendy fiddle leaf fig', 5, 39.99, 10, 0, 'p-20.jpg'),
('ZZ Plant', 'Low-maintenance ZZ plant', 5, 22.99, 15, 0, 'p-21.jpg'),
('Pothos', 'Versatile pothos plant', 5, 15.99, 25, 0, 'p-22.jpg'),
('Monstera', 'Large monstera plant', 5, 35.99, 10, 0, 'p-23.jpg'),
('Dracaena', 'Graceful dracaena plant', 5, 18.99, 20, 0, 'p-24.jpg'),
('Boston Fern', 'Lush Boston fern', 5, 11.99, 30, 0, 'p-25.jpg'),
('Jade Plant', 'Succulent jade plant', 5, 13.99, 25, 0, 'p-26.jpg'),
('Rubber Plant', 'Striking rubber plant', 5, 28.99, 15, 0, 'p-27.jpg'),
('Calathea', 'Colorful calathea plant', 5, 21.99, 20, 0, 'p-28.jpg'),
('Philodendron', 'Classic philodendron plant', 5, 17.99, 25, 0, 'p-29.jpg'),
('Bamboo Palm', 'Air-purifying bamboo palm', 5, 16.99, 30, 0, 'p-30.jpg');

-- Seeds & Bulbs
INSERT INTO products (name, description, category_id, price, stock_quantity, discount, image) VALUES
('Carrot Seeds', 'High-quality carrot seeds', 6, 2.99, 100, 0, 'p-31.jpg'),
('Tomato Seeds', 'Organic tomato seeds', 6, 3.99, 100, 0, 'p-32.jpg'),
('Lettuce Seeds', 'Fresh lettuce seeds', 6, 1.99, 100, 0, 'p-33.jpg'),
('Spinach Seeds', 'Nutritious spinach seeds', 6, 2.99, 100, 0, 'p-34.jpg'),
('Radish Seeds', 'Crisp radish seeds', 6, 2.49, 100, 0, 'p-35.jpg'),
('Cucumber Seeds', 'Cool cucumber seeds', 6, 3.49, 100, 0, 'p-36.jpg'),
('Pepper Seeds', 'Spicy pepper seeds', 6, 3.99, 100, 0, 'p-37.jpg'),
('Zucchini Seeds', 'Prolific zucchini seeds', 6, 3.49, 100, 0, 'p-38.jpg'),
('Pumpkin Seeds', 'Hearty pumpkin seeds', 6, 4.99, 100, 0, 'p-39.jpg'),
('Onion Seeds', 'Flavorful onion seeds', 6, 2.99, 100, 0, 'p-40.jpg'),
('Corn Seeds', 'Sweet corn seeds', 6, 3.99, 100, 0, 'p-41.jpg'),
('Bean Seeds', 'Robust bean seeds', 6, 2.99, 100, 0, 'p-42.jpg'),
('Pea Seeds', 'Tender pea seeds', 6, 3.49, 100, 0, 'p-43.jpg'),
('Sunflower Seeds', 'Bright sunflower seeds', 6, 1.99, 100, 0, 'p-44.jpg'),
('Marigold Seeds', 'Vibrant marigold seeds', 6, 2.99, 100, 0, 'p-45.jpg');

-- Fertilizers and Sprays
INSERT INTO products (name, description, category_id, price, stock_quantity, discount, image) VALUES
('All-Purpose Fertilizer', 'Balanced fertilizer for all plants', 7, 10.99, 50, 0, 'p-46.jpg'),
('Rose Fertilizer', 'Specially formulated for roses', 7, 12.99, 40, 0, 'p-47.jpg'),
('Tomato Fertilizer', 'Boosts tomato growth', 7, 11.99, 45, 0, 'p-48.jpg'),
('Vegetable Fertilizer', 'Nutrient-rich for vegetables', 7, 9.99, 60, 0, 'p-49.jpg'),
('Flower Fertilizer', 'Promotes flowering', 7, 13.99, 35, 0, 'p-50.jpg'),
('Lawn Fertilizer', 'Thickens lawn grass', 7, 14.99, 30, 0, 'p-51.jpg'),
('Herb Fertilizer', 'Ideal for herb gardens', 7, 8.99, 55, 0, 'p-52.jpg'),
('Orchid Fertilizer', 'Enhances orchid blooms', 7, 15.99, 25, 0, 'p-53.jpg'),
('Tree Fertilizer', 'Strengthens tree growth', 7, 16.99, 20, 0, 'p-54.jpg'),
('Shrub Fertilizer', 'Supports shrub development', 7, 10.49, 40, 0, 'p-55.jpg'),
('Indoor Plant Fertilizer', 'Nourishes indoor plants', 7, 12.49, 35, 0, 'p-56.jpg'),
('Cactus Fertilizer', 'For healthy cacti and succulents', 7, 9.49, 50, 0, 'p-57.jpg'),
('Hanging Basket Fertilizer', 'Feeds hanging baskets', 7, 13.49, 30, 0, 'p-58.jpg'),
('Fruit Tree Fertilizer', 'Promotes fruit production', 7, 17.99, 20, 0, 'p-59.jpg'),
('Palm Tree Fertilizer', 'Strengthens palm trees', 7, 18.99, 15, 0, 'p-60.jpg');

-- Pots & Planters
INSERT INTO products (name, description, category_id, price, stock_quantity, discount, image) VALUES
('Terracotta Pot', 'Classic terracotta pot', 8, 7.99, 40, 0, 'p-61.jpg'),
('Ceramic Planter', 'Elegant ceramic planter', 8, 12.99, 30, 0, 'p-62.jpg'),
('Hanging Basket', 'Decorative hanging basket', 8, 9.99, 28, 0, 'p-63.jpg'),
('Plastic Pot', 'Durable plastic pot', 8, 5.99, 50, 0, 'p-64.jpg'),
('Metal Planter', 'Stylish metal planter', 8, 14.99, 20, 0, 'p-65.jpg'),
('Wooden Planter', 'Rustic wooden planter', 8, 16.99, 15, 0, 'p-66.jpg'),
('Self-Watering Pot', 'Convenient self-watering pot', 8, 11.99, 30, 0, 'p-67.jpg'),
('Window Box', 'Charming window box', 8, 10.99, 25, 0, 'p-68.jpg'),
('Bamboo Planter', 'Eco-friendly bamboo planter', 8, 13.99, 20, 0, 'p-69.jpg'),
('Decorative Pot', 'Ornate decorative pot', 8, 8.99, 35, 0, 'p-70.jpg'),
('Large Planter', 'Spacious large planter', 8, 19.99, 10, 0, 'p-71.jpg'),
('Medium Planter', 'Versatile medium planter', 8, 14.49, 20, 0, 'p-72.jpg'),
('Small Pot', 'Compact small pot', 8, 5.49, 40, 0, 'p-73.jpg'),
('Garden Urn', 'Elegant garden urn', 8, 22.99, 10, 0, 'p-74.jpg'),
('Square Planter', 'Modern square planter', 8, 15.99, 15, 0, 'p-75.jpg');

-- Tools & Gloves
INSERT INTO products (name, description, category_id, price, stock_quantity, discount, image) VALUES
('Pruning Shears', 'High-quality pruning shears', 9, 14.99, 20, 0, 'p-76.jpg'),
('Garden Gloves', 'Durable garden gloves', 9, 8.99, 30, 0, 'p-77.jpg'),
('Hand Trowel', 'Essential hand trowel', 9, 7.99, 25, 0, 'p-78.jpg'),
('Garden Fork', 'Sturdy garden fork', 9, 12.99, 20, 0, 'p-79.jpg'),
('Hoe', 'Reliable garden hoe', 9, 10.99, 15, 0, 'p-80.jpg'),
('Spade', 'Heavy-duty spade', 9, 18.99, 10, 0, 'p-81.jpg'),
('Rake', 'Lightweight garden rake', 9, 11.99, 20, 0, 'p-82.jpg'),
('Loppers', 'Sharp garden loppers', 9, 17.99, 15, 0, 'p-83.jpg'),
('Wheelbarrow', 'Sturdy wheelbarrow', 9, 49.99, 5, 0, 'p-84.jpg'),
('Garden Kneeler', 'Comfortable garden kneeler', 9, 16.99, 10, 0, 'p-85.jpg'),
('Hand Weeder', 'Efficient hand weeder', 9, 6.99, 25, 0, 'p-86.jpg'),
('Garden Scissors', 'Precision garden scissors', 9, 9.99, 20, 0, 'p-87.jpg'),
('Plant Markers', 'Handy plant markers', 9, 4.99, 30, 0, 'p-88.jpg'),
('Spray Bottle', 'Multipurpose spray bottle', 9, 5.99, 25, 0, 'p-89.jpg'),
('Compost Bin', 'Eco-friendly compost bin', 9, 34.99, 5, 0, 'p-90.jpg');

-- Garden Decorations
INSERT INTO products (name, description, category_id, price, stock_quantity, discount, image) VALUES
('Garden Gnome', 'Whimsical garden gnome', 10, 14.99, 15, 0, 'p-91.jpg'),
('Bird Bath', 'Elegant bird bath', 10, 39.99, 10, 0, 'p-92.jpg'),
('Wind Chime', 'Soothing wind chime', 10, 12.99, 20, 0, 'p-93.jpg'),
('Garden Lantern', 'Charming garden lantern', 10, 19.99, 15, 0, 'p-94.jpg'),
('Statue', 'Graceful garden statue', 10, 29.99, 10, 0, 'p-95.jpg'),
('Garden Bench', 'Comfortable garden bench', 10, 99.99, 5, 0, 'p-96.jpg'),
('Planter Stand', 'Decorative planter stand', 10, 24.99, 10, 0, 'p-97.jpg'),
('Stepping Stones', 'Decorative stepping stones', 10, 6.99, 30, 0, 'p-98.jpg'),
('Fountain', 'Relaxing garden fountain', 10, 89.99, 5, 0, 'p-99.jpg'),
('Garden Trellis', 'Functional garden trellis', 10, 18.99, 15, 0, 'p-100.jpg'),
('Outdoor Clock', 'Stylish outdoor clock', 10, 22.99, 10, 0, 'p-101.jpg'),
('Fire Pit', 'Warm fire pit', 10, 149.99, 3, 0, 'p-102.jpg'),
('Garden Sign', 'Charming garden sign', 10, 9.99, 25, 0, 'p-103.jpg'),
('Path Lights', 'Solar-powered path lights', 10, 34.99, 20, 0, 'p-104.jpg'),
('Bird Feeder', 'Attractive bird feeder', 10, 15.99, 20, 0, 'p-105.jpg');

-- Irrigation
INSERT INTO products (name, description, category_id, price, stock_quantity, discount, image) VALUES
('Garden Hose', 'Durable garden hose', 11, 19.99, 30, 0, 'p-106.jpg'),
('Sprinkler', 'Adjustable garden sprinkler', 11, 14.99, 25, 0, 'p-107.jpg'),
('Soaker Hose', 'Efficient soaker hose', 11, 24.99, 20, 0, 'p-108.jpg'),
('Drip Irrigation Kit', 'Complete drip irrigation kit', 11, 39.99, 15, 0, 'p-109.jpg'),
('Irrigation Timer', 'Automatic irrigation timer', 11, 29.99, 10, 0, 'p-110.jpg'),
('Watering Can', 'Stylish watering can', 11, 12.99, 25, 0, 'p-111.jpg'),
('Rain Barrel', 'Eco-friendly rain barrel', 11, 59.99, 5, 0, 'p-112.jpg'),
('Hose Reel', 'Convenient hose reel', 11, 34.99, 10, 0, 'p-113.jpg'),
('Spray Nozzle', 'Adjustable spray nozzle', 11, 9.99, 30, 0, 'p-114.jpg'),
('Hose Connector', 'Versatile hose connector', 11, 6.99, 40, 0, 'p-115.jpg'),
('Irrigation Tubing', 'Flexible irrigation tubing', 11, 19.99, 25, 0, 'p-116.jpg'),
('Garden Sprayer', 'Multipurpose garden sprayer', 11, 24.99, 20, 0, 'p-117.jpg'),
('Hose Splitter', 'Durable hose splitter', 11, 8.99, 35, 0, 'p-118.jpg'),
('Watering Spike', 'Efficient watering spike', 11, 3.99, 50, 0, 'p-119.jpg'),
('Irrigation Filter', 'Effective irrigation filter', 11, 12.99, 25, 0, 'p-120.jpg');

-- NZ Natives
INSERT INTO products (name, description, category_id, price, stock_quantity, discount, image) VALUES
('Kowhai', 'Native New Zealand Kowhai tree', 12, 19.99, 15, 0, 'p-121.jpg'),
('Pohutukawa', 'Native New Zealand Pohutukawa tree', 12, 24.99, 10, 0, 'p-122.jpg'),
('Manuka', 'Native New Zealand Manuka tree', 12, 14.99, 20, 0, 'p-123.jpg'),
('Kauri', 'Native New Zealand Kauri tree', 12, 29.99, 5, 0, 'p-124.jpg'),
('Totara', 'Native New Zealand Totara tree', 12, 21.99, 8, 0, 'p-125.jpg'),
('Harakeke', 'Native New Zealand flax plant', 12, 9.99, 25, 0, 'p-126.jpg'),
('Rimu', 'Native New Zealand Rimu tree', 12, 27.99, 6, 0, 'p-127.jpg'),
('Kahikatea', 'Native New Zealand Kahikatea tree', 12, 19.99, 10, 0, 'p-128.jpg'),
('Tawhai', 'Native New Zealand Beech tree', 12, 23.99, 7, 0, 'p-129.jpg'),
('Miro', 'Native New Zealand Miro tree', 12, 25.99, 6, 0, 'p-130.jpg'),
('Puriri', 'Native New Zealand Puriri tree', 12, 22.99, 8, 0, 'p-131.jpg'),
('Kawakawa', 'Native New Zealand Kawakawa plant', 12, 15.99, 20, 0, 'p-132.jpg'),
('Karaka', 'Native New Zealand Karaka tree', 12, 18.99, 10, 0, 'p-133.jpg'),
('Akeake', 'Native New Zealand Akeake tree', 12, 17.99, 15, 0, 'p-134.jpg'),
('Koromiko', 'Native New Zealand Koromiko plant', 12, 13.99, 18, 0, 'p-135.jpg');

-- Clearance Items
INSERT INTO products (name, description, category_id, price, stock_quantity, discount, image) VALUES
('Clearance Rose Bush', 'Rose bush on clearance sale', 13, 10.99, 5, 20, 'p-136.jpg'),
('Clearance Lavender', 'Lavender plant on clearance sale', 13, 8.99, 8, 20, 'p-137.jpg'),
('Clearance Hibiscus', 'Hibiscus plant on clearance sale', 13, 12.99, 6, 20, 'p-138.jpg'),
('Clearance Tulip Bulbs', 'Tulip bulbs on clearance sale', 13, 5.99, 13, 20, 'p-139.jpg'),
('Clearance Daisy', 'Daisy flowers on clearance sale', 13, 3.99, 15, 20, 'p-140.jpg'),
('Clearance Marigold', 'Marigold flowers on clearance sale', 13, 4.99, 10, 20, 'p-141.jpg'),
('Clearance Sunflower', 'Sunflower on clearance sale', 13, 6.99, 7, 20, 'p-142.jpg'),
('Clearance Gardenia', 'Gardenia plant on clearance sale', 13, 9.99, 5, 20, 'p-143.jpg'),
('Clearance Hydrangea', 'Hydrangea bush on clearance sale', 13, 13.99, 6, 20, 'p-144.jpg'),
('Clearance Petunia', 'Petunia flowers on clearance sale', 13, 4.99, 9, 20, 'p-145.jpg'),
('Clearance Begonia', 'Begonia plant on clearance sale', 13, 7.99, 8, 20, 'p-146.jpg'),
('Clearance Geranium', 'Geranium flowers on clearance sale', 13, 6.99, 13, 20, 'p-147.jpg'),
('Clearance Orchid', 'Orchid plant on clearance sale', 13, 15.99, 4, 20, 'p-148.jpg'),
('Clearance Peony', 'Peony plant on clearance sale', 13, 13.99, 6, 20, 'p-149.jpg'),
('Clearance Fuchsia', 'Fuchsia flowers on clearance sale', 13, 8.99, 7, 20, 'p-150.jpg');
