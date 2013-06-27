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

(defn- extract-content [url]
  (.extractContent (Goose. (Configuration.)) url))

(defn- first-non-empty [ss]
  (first (take-while #(> (count (trim %)) 0) ss)))

(defn- preview-text [full-text]
  (let [first-graf (first-non-empty (split full-text #"\n"))]
    (subs first-graf 0 (min 450 (count first-graf)))))

(defn bake [url]
  (let [article (extract-content url)]
    (insert remembrances
      (values {:url url
               :title (.title article)
               :preview (preview-text (.cleanedArticleText article))
               :remembered_on (today)}))))
