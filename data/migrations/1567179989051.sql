
/*creates a table called bookshelves  and sets id as the primary key and also a name */
CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));

/*inserts name into table and removes duplicates*/
INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;

/*adds new column into table books called bookshelf_id which is a number*/
ALTER TABLE books ADD COLUMN bookshelf_id INT;

/*select all from bookshelves, */
UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;

/* deletes column bookshelf from books table */
ALTER TABLE books DROP COLUMN bookshelf;

/* 
ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);