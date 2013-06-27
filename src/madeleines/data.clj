(ns madeleines.data
  (:use [korma core db])
  (:use [clj-time.core :only [date-time year month day now]])
  (:use clj-time.coerce))

(defdb madeleines (System/getenv "DATABASE_URL"))

(defentity remembrances
  (pk :id)
  (table :remembrances)
  (database madeleines))

(defn- today []
  (let [n (now)]
    (java.sql.Date. (to-long (date-time (year n) (month n) (day n))))))

(defn- earlier-remembrances []
  (select remembrances
    (fields :url :title :preview)
    (where {:remembered_on [< (today)]})))

; TODO: Make this return an arbitrary (but identical for the entire day)
; result
(defn bite []
  (let [result-set (earlier-remembrances)]
    (first result-set)))
