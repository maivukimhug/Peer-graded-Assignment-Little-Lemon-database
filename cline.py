#!/usr/bin/python
import mysql.connector


def executeCursor(string): 
    
    db = mysql.connector.connect(host="localhost",    # your host, usually localhost
                     user="root",         # your username
                     passwd="Joshua_78",  # your password
                     db="mydb")        # name of the data base

# you must create a Cursor object. It will let
#  you execute all the queries you need
    cur = db.cursor()

# Use all the SQL you like
    cur.execute(string)

# Close connection
    db.close()

#Create GetMaxQuantity()
sqlquery = """
DROP PROCEDURE IF EXISTS usp_myprocedure;
CREATE PROCEDURE GetMaxQuantity()
BEGIN
    select max(Quantity) from deliveries
END
"""
executeCursor(sqlquery)


#Create  ManageBooking()
sqlquery = """
DROP PROCEDURE IF EXISTS usp_myprocedure;
CREATE PROCEDURE  ManageBooking('CustomerID_IN' INT) 
BEGIN

    select A.*, B.*, C.* from orders as A JOIN Deliveries as B on A.OrderID=B.OrderID join DeliberiesCountent as C on B.DeliberyID = C.DeliberyID where A.CustomerID = CustomerID_IN
END
"""
executeCursor(sqlquery)


#Create   UpdateBooking(
sqlquery = """
DROP PROCEDURE IF EXISTS usp_myprocedure;
CREATE PROCEDURE   UpdateBooking(OrderID_IN INT, DeliveryDate_IN DATE)
BEGIN
    Update from Order set DeliveryDate = DeliveryDate_IN where OrderID = OrderID_IN
END
"""
executeCursor(sqlquery)


#Create   AddBooking()
sqlquery = """
DROP PROCEDURE IF EXISTS usp_myprocedure;
CREATE PROCEDURE   AddBooking(deliveryDate_IN DATE, CustomerID_IN INT)
BEGIN
    insert into Orders values(now(), deliveryDate_IN, CustomerID_IN)
    insert into Deliveries values()
    insert into Deliveries content()
END
"""
executeCursor(sqlquery)


#Create   CancelBooking()
sqlquery = """
DROP PROCEDURE IF EXISTS usp_myprocedure;
CREATE PROCEDURE   CancelBooking(OrdeID_IN INT)
BEGIN
    delete from Orders where OrderID = OrderID_IN
END
"""
executeCursor(sqlquery)
