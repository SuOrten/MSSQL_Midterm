-- Yavaþ çalýþabilecek örnek sorgu
SET STATISTICS TIME ON;
SELECT 
    poh.PurchaseOrderID,
    poh.OrderDate,
    pod.ProductID,
    pod.UnitPrice,
    pod.OrderQty
FROM Purchasing.PurchaseOrderHeader poh
JOIN Purchasing.PurchaseOrderDetail pod
    ON poh.PurchaseOrderID = pod.PurchaseOrderID
WHERE poh.OrderDate BETWEEN '2001-01-01' AND '2013-12-31';

SET STATISTICS TIME OFF;
------------------****************** Daha Verimli Sorgu

SET STATISTICS TIME ON;

SELECT 
    poh.PurchaseOrderID,
    poh.OrderDate,
    pod.ProductID,
    pod.UnitPrice,
    pod.OrderQty
FROM Purchasing.PurchaseOrderHeader poh
JOIN Purchasing.PurchaseOrderDetail pod
    ON poh.PurchaseOrderID = pod.PurchaseOrderID
WHERE poh.OrderDate BETWEEN '2012-01-01' AND '2013-01-31';

SET STATISTICS TIME OFF;

---*******************************
CREATE NONCLUSTERED INDEX IX_PurchaseOrderHeader_OrderDate ON Purchasing.PurchaseOrderHeader(OrderDate);
