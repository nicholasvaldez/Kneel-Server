CREATE TABLE `Metals`
(
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `metal` NVARCHAR(160) NOT NULL,
    `price` NUMERIC(5,2) NOT NULL
);

CREATE TABLE `Sizes`
(
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `carets` NUMERIC(5,2) NOT NULL,
    `price` NUMERIC(5,2) NOT NULL
);

CREATE TABLE `Styles`
(
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `style` NVARCHAR(160) NOT NULL,
    `price` NUMERIC(5,2) NOT NULL
);

CREATE TABLE `Orders`
(
    `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    `metal_id` NUMERIC(5,2) NOT NULL,
    `size_id` NUMERIC(5,2) NOT NULL,
    `style_id` NUMERIC(5,2) NOT NULL,
    `timestamp` CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY(`metal_id`) REFERENCES `Metals`(`id`)
    FOREIGN KEY(`size_id`) REFERENCES `Sizes`(`id`)
    FOREIGN KEY(`style_id`) REFERENCES `Styles`(`id`)
);

INSERT INTO `Metals` VALUES (null, "Bronze", 100);
INSERT INTO `Metals` VALUES (null, "Silver", 150);
INSERT INTO `Metals` VALUES (null, "Gold", 200);
INSERT INTO `Metals` VALUES (null, "Aluminum", 50);
INSERT INTO `Metals` VALUES (null, "Copper", 240);
INSERT INTO `Metals` VALUES (null, "Titanium", 2000);
INSERT INTO `Metals` VALUES (null, "Stainless Steel", 170);
INSERT INTO `Metals` VALUES (null, "Zinc", 1000);
INSERT INTO `Metals` VALUES (null, "NIckel", 1200);
INSERT INTO `Metals` VALUES (null, "Tungsten", 2010);


INSERT INTO `Sizes` VALUES (null, 1.00, 100);
INSERT INTO `Sizes` VALUES (null, 1.50, 150);
INSERT INTO `Sizes` VALUES (null, 1.75, 175);
INSERT INTO `Sizes` VALUES (null, 2.00, 250);
INSERT INTO `Sizes` VALUES (null, 2.25, 275);
INSERT INTO `Sizes` VALUES (null, 2.50, 300);
INSERT INTO `Sizes` VALUES (null, 2.75, 350);
INSERT INTO `Sizes` VALUES (null, 3.00, 400);
INSERT INTO `Sizes` VALUES (null, 3.50, 500);
INSERT INTO `Sizes` VALUES (null, 4.00, 600);


INSERT INTO `Styles` VALUES (null, "Solitaire", 351);
INSERT INTO `Styles` VALUES (null, "Halo", 450);
INSERT INTO `Styles` VALUES (null, "Double Halo", 900);
INSERT INTO `Styles` VALUES (null, "Three Stone", 8760);
INSERT INTO `Styles` VALUES (null, "Vintage", 1200);
INSERT INTO `Styles` VALUES (null, "Side Stone", 546);
INSERT INTO `Styles` VALUES (null, "Diamond Cluster", 788);
INSERT INTO `Styles` VALUES (null, "Cathedral", 1599);
INSERT INTO `Styles` VALUES (null, "Channel", 230);

INSERT INTO `Orders` VALUES (null, 1, 4, 6, CURRENT_TIMESTAMP);
INSERT INTO `Orders` VALUES (null, 1, 3, 3, CURRENT_TIMESTAMP);
INSERT INTO `Orders` VALUES (null, 2, 4, 6, CURRENT_TIMESTAMP);
INSERT INTO `Orders` VALUES (null, 2, 8, 2, CURRENT_TIMESTAMP);
INSERT INTO `Orders` VALUES (null, 6, 6, 3, CURRENT_TIMESTAMP);
INSERT INTO `Orders` VALUES (null, 3, 10, 9, CURRENT_TIMESTAMP);
INSERT INTO `Orders` VALUES (null, 4, 5, 9, CURRENT_TIMESTAMP);
INSERT INTO `Orders` VALUES (null, 5, 10, 8, CURRENT_TIMESTAMP);
INSERT INTO `Orders` VALUES (null, 5, 10, 7, CURRENT_TIMESTAMP);
INSERT INTO `Orders` VALUES (null, 6, 2, 6, CURRENT_TIMESTAMP);
INSERT INTO `Orders` VALUES (null, 7, 5, 6, CURRENT_TIMESTAMP);
INSERT INTO `Orders` VALUES (null, 8, 6, 5, CURRENT_TIMESTAMP);
INSERT INTO `Orders` VALUES (null, 8, 7, 5, CURRENT_TIMESTAMP);
INSERT INTO `Orders` VALUES (null, 8, 7, 4, CURRENT_TIMESTAMP);
INSERT INTO `Orders` VALUES (null, 7, 7, 4, CURRENT_TIMESTAMP);
INSERT INTO `Orders` VALUES (null, 9, 7, 3, CURRENT_TIMESTAMP);
INSERT INTO `Orders` VALUES (null, 9, 8, 5, CURRENT_TIMESTAMP);
INSERT INTO `Orders` VALUES (null, 3, 9, 3, CURRENT_TIMESTAMP);
INSERT INTO `Orders` VALUES (null, 2, 10, 2, CURRENT_TIMESTAMP);
INSERT INTO `Orders` VALUES (null, 2, 2, 8, CURRENT_TIMESTAMP);
INSERT INTO `Orders` VALUES (null, 1, 1, 1, CURRENT_TIMESTAMP);


   SELECT
            o.id,
            o.metal_id,
            o.size_id,
            o.style_id,
            o.timestamp
        FROM orders o
        WHERE o.id = 22