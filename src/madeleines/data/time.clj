(ns madeleines.data.time
  (:use [clj-time.core :only [date-time year month day now]])
  (:use clj-time.coerce)
  (:import java.sql.Date)
  (:require [clojure.data.json :refer [JSONWriter -write]]))

(defn today-long []
  (let [n (now)]
    (to-long (date-time (year n) (month n) (day n)))))

(defn today-random [n]
  (.nextInt (java.util.Random. (today-long)) n))

(extend-protocol JSONWriter
  java.sql.Date
  (-write [object out]
    (-write (.getTime object) out)))
