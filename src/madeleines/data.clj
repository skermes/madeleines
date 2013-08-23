(ns madeleines.data
  (:use madeleines.data.time)
  (:use madeleines.data.text)
  (:require [clojure.java.jdbc :as sql]))

(def madeleines-db (System/getenv "DATABASE_URL"))

(defn earlier-remembrances []
  (sql/query madeleines-db
    ["select * from remembrances where remembered_on < current_date and (dropped_on is null or dropped_on >= current_date) order by id" ]))

(defn bite []
  (let [result-set (vec (earlier-remembrances))]
    (result-set (today-random (count result-set)))))

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

(defn drop-bite []
  (let [todays-bite (bite)]
    (sql/execute! madeleines-db
      ["update remembrances set dropped_on = current_date where id = ?" (todays-bite :id)])
    (bite)))
