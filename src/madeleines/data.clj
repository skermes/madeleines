(ns madeleines.data
  (:use [korma core db]))

(defdb madeleines (System/getenv "DATABASE_URL"))

(defentity remembrances
  (pk :id)
  (table :remembrances)
  (database madeleines))

(defn- today []
  (java.sql.Date. (.getTime (java.util.Date.))))

(defn- earlier-remembrances []
  (select remembrances
    (fields :url :title :preview)
    (where {:remembered_on [< (today)]})))

; TODO: Make this return an arbitrary (but identical for the entire day)
; result
(defn bite []
  (let [result-set (earlier-remembrances)]
    (first result-set)))
