(ns madeleines.data.time
  (:use [clj-time.core :only [date-time year month day now]])
  (:use clj-time.coerce))

(defn today-long []
  (let [n (now)]
    (to-long (date-time (year n) (month n) (day n)))))

(defn today-random [n]
  (.nextInt (java.util.Random. (today-long)) n))
