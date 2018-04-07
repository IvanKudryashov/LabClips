(deftemplate Saleflat
    (slot typeHouse (type SYMBOL))
	(slot size (type NUMBER))
	(slot floor (type NUMBER))
	(slot numberOfFloors (type NUMBER))
	(slot remont (type SYMBOL))
	(slot location (type SYMBOL))
	(slot infrastructure (type SYMBOL))
)	

(deffacts Saleflatfacts
    (Saleflat (typeHouse panel)
	(size 55)
	(floor 5)
	(numberOfFloors 6)
	(remont yes)
	(location centre)
	(infrastructure yes))
)	

(defrule floorNeed
	(Saleflat (floor ?Floor)(numberOfFloors ?numberoffloors))
	    (test(> ?numberoffloors 5))
    =>
    (assert (floorNeed))
)
(defrule floorNoNeed
	(Saleflat (numberOfFloors ?numberoffloors))
	(or 
	    (test(<= ?numberoffloors 5))
		(Saleflat (floor 1))
	)
    =>
    (assert (floorNoNeed))
)
(defrule rentGood
    (Saleflat (size ?size))
	(and 
	    (test (< ?size 45))
		(Saleflat (remont yes))
	)	
	 =>
    (assert (rentGood))
)
(defrule saleGood
    (Saleflat (size ?size))
	(and 
	    (test (> ?size 45))
		(Saleflat (remont yes))
	)	
	 =>
    (assert (saleGood))
)
(defrule buyAflat
    (floorNeed)
	(saleGood)
	=>
	(printout t "buy a flat!" crlf)
)	
(defrule doNotbuyAflat
    (floorNoNeed)
	=>
	(printout t "do not buy a flat!" crlf)
)	
(defrule rentAflat
    (rentGood)
	=>
	(printout t "rent a flat!" crlf)
)

	
	
	