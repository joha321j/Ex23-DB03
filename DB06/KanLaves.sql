USE B_DB14_2018
GO

IF OBJECT_ID('ExerciseGetOrder', 'P') IS NOT NULL
    DROP PROC ExerciseGetOrder
GO

CREATE PROC ExerciseGetOrder
(
    @OrderID int = NULL
)
AS
    SELECT exercise_order.orderid, exercise_customer.[name], quantity, exercise_product.[name] AS pname, price
    FROM  exercise_customer
          LEFT JOIN  exercise_order
          ON exercise_customer.customerid = exercise_order.customerid

          LEFT JOIN exercise_orderline
          ON exercise_order.orderid = exercise_orderline.orderid

          LEFT JOIN exercise_product
          ON exercise_orderline.productid = exercise_product.productid
    WHERE exercise_order.orderid = ISNULL(@OrderID, exercise_order.orderid);