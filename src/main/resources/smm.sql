
CREATE TABLE user (
                      id INT AUTO_INCREMENT PRIMARY KEY,
                      name VARCHAR(50) NOT NULL,
                      age INT,
                      sex VARCHAR(10)
);
INSERT INTO user (id, name, age, sex) VALUES
                                          (1, 'John', 25, '男'),
                                          (2, 'Alice', 30, '女'),
                                          (3, 'Bob', 22, '男'),
                                          (4, 'Emily', 28, '女'),
                                          (5, 'Michael', 35, '男'),
                                          (6, 'Samantha', 29, '男'),
                                          (7, 'David', 40, '男'),
                                          (8, 'Emma', 27, '女'),
                                          (9, 'William', 32, '男'),
                                          (10, 'Olivia', 26, '女');