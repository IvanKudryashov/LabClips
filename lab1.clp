(deftemplate Weather
   (slot sky))
(deffacts Weatherfacts
   ( Weather(sky cloudy))
   (tucha yes)
   (no our side))
(defrule No_rain
   (or
    ( Weather(sky clear))
    (tucha no)
    (no our side)
)
=> (printout t "No rain" crlf))
(defrule rain_yes
   ( Weather(sky cloudy))
   (tucha yes)
   (our side)
=> (printout t "rain yes" crlf))


