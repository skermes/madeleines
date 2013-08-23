(ns madeleines.data
  (:use [clj-time.core :only [date-time year month day now]])
  (:use clj-time.coerce)
  (:use [clojure.string :only [split trim]])
  (:require [clojure.java.jdbc :as sql])
  (:import com.gravity.goose.Goose)
  (:import com.gravity.goose.Configuration))

(def madeleines-db (System/getenv "DATABASE_URL"))

(defn today-long []
  (let [n (now)]
    (to-long (date-time (year n) (month n) (day n)))))

(defn today []
  (java.sql.Date. (today-long)))

(defn- earlier-remembrances []
  (sql/query madeleines-db
    ["select * from remembrances where remembered_on < current_date and (dropped_on is null or dropped_on >= current_date) order by id" ]))

(defn today-random [n]
  (.nextInt (java.util.Random. (today-long)) n))

(defn bite []
  (let [result-set (vec (earlier-remembrances))]
    (result-set (today-random (count result-set)))))

(defn- extract-content [url]
  (.extractContent (Goose. (Configuration.)) url))

(defn- first-non-empty [ss]
  (first (take-while #(> (count (trim %)) 0) ss)))

(defn- preview-text [full-text]
  (let [first-graf (first-non-empty (split full-text #"\n"))]
    (if (nil? first-graf)
        ""
        (subs first-graf 0 (min 450 (count first-graf))))))

(defn bake [url]
  (let [article (extract-content url)]
    (try
      (do
        (sql/execute! madeleines-db
          ["insert into remembrances (id, url, title, preview, remembered_on) values (default, ?, ?, ?, current_date);"
           url (.title article) (preview-text (.cleanedArticleText article))])
        :success)
      (catch Exception e
        (do
          (println (.getMessage e))
          (.printStackTrace e)
          :error)))))

; Hah!  Hah!  Dates!  Fuck everything!
(defn drop-bite []
  (let [todays-bite (bite)]
    (sql/execute! madeleines-db
      ["update remembrances set dropped_on = current_date where id = ?" (todays-bite :id)])
    (bite)))
