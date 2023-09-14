CREATE database stock_portfolio; 
USE stock_portfolio;
CREATE TABLE current_portfolio (
    stock_ticker VARCHAR(10) PRIMARY KEY,
    number_of_shares INT,
    date_purchased DATE,
    price_purchased DECIMAL(10 , 2 ),
    current_price DECIMAL(10 , 2 )
);
CREATE TABLE company_table (
    stock_ticker VARCHAR(10) PRIMARY KEY,
    name_of_company VARCHAR(100),    
    industry VARCHAR(100)
);
INSERT INTO current_portfolio (stock_ticker, number_of_shares, date_purchased, price_purchased, current_price)
VALUES
    ('AAL', 100, '2023-02-14', 16.67, 14.00),
    ('BAC', 200, '2010-06-01', 29.75, 28),
    ('WBD', 150, '2023-06-01', 11.30, 11.32),
    ('T', 75, '2023-08-05', 14.81, 14.61),
    ('INTC', 75, '2022-10-10', 25.94, 38.18);

INSERT INTO company_table (name_of_company, stock_ticker,industry)
VALUES
    ('American Airlines Group Inc.', 'AAL', 'Airlines'),
    ('Bank of America Corporation', 'BAC', 'Bank-Diversified'),
    ('Warner Bros Discover, Inc.', 'WBD', 'Entertainment'),
    ('AT&T Inc.', 'T', 'Communication Services'),
    ('Intel Corporation', 'INTC', 'Technology');

SELECT
    company_table.name_of_company AS "Company Name",
    current_portfolio.stock_ticker AS "Ticker",
    current_portfolio.number_of_shares AS "# Shares",
    CONCAT(current_portfolio.number_of_shares * current_portfolio.current_price) AS "Value"
FROM
    current_portfolio
INNER JOIN
    company_table
ON
    company_table.stock_ticker = current_portfolio.stock_ticker;

