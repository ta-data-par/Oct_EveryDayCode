# some rows were duplicated by accident (because code was run too many times)
# deleting the rows :

DELETE FROM cars
WHERE id2 >= 7;

#deleting the row for id=4 :

DELETE FROM cars
WHERE id2 =4;