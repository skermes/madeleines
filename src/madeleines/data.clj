(ns madeleines.data
  (:use [korma core db])
  (:use [clj-time.core :only [date-time year month day now]])
  (:use clj-time.coerce)
  (:use [clojure.string :only [split trim]])
  (:import com.gravity.goose.Goose)
  (:import com.gravity.goose.Configuration))

(defdb madeleines (System/getenv "DATABASE_URL"))

(defentity remembrances
  (pk :id)
  (table :remembrances)
  (database madeleines))

(defn today-long []
  (let [n (now)]
    (to-long (date-time (year n) (month n) (day n)))))

(defn today []
  (java.sql.Date. (today-long)))

; Comparing dates in Korma is a ridiculous, inexcusable shitshow.  The object
; that comes back from postgresql date column is java.sql.Date, which can't be
; compared with regular operators, so I've been unable to get Korma to generate
; a useful query for it.  This is completely absurd, since everything I want to
; do is completely trivial in SQL, so fuck it.
(defn- earlier-remembrances []
  (exec-raw
    ["select * from remembrances where remembered_on < current_date and (dropped_on is null or dropped_on >= current_date) order by id" ]
    :results))

(defn today-random [n]
  (.nextInt (java.util.Random. (today-long)) n))

(defn bite []
  (let [result-set (earlier-remembrances)]
    (result-set (today-random (count result-set)))))

(defn- extract-content [url]
  (.extractContent (Goose. (Configuration.)) url))

(defn- first-non-empty [ss]
  (first (take-while #(> (count (trim %)) 0) ss)))

(defn- preview-text [full-text]
  (let [first-graf (first-non-empty (split full-text #"\n"))]
    (subs first-graf 0 (min 450 (count first-graf)))))

(defn bake [url]
  (let [article (extract-content url)]
    (try
      (do
        (exec-raw
          ["insert into remembrances (url, title, preview, remembered_on) values (?, ?, ?, current_date);"
           [url (.title article) (preview-text (.cleanedArticleText article))]])
        :success)
      (catch Exception e
        (do
          (println (.getMessage e))
          :error)))))

; Hah!  Hah!  Dates!  Fuck everything!
(defn drop-bite []
  (let [todays-bite (bite)]
    (exec-raw
      ["update remembrances set dropped_on = current_date where id = ?" [(todays-bite :id)]])
    (bite)))
