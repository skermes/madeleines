(ns madeleines.data.text
  (:use [clojure.string :only [split trim]])
  (import com.gravity.goose.Goose)
  (import com.gravity.goose.Configuration))

(defn extract-content [url]
  (.extractContent (Goose. (Configuration.)) url))

(defn first-non-empty [strings]
  (first (take-while #(not (empty? (trim %))) strings)))

(defn preview-text [full-text]
  (let [first-graf (first-non-empty (split full-text #"\n"))]
    (if (nil? first-graf)
        ""
        (subs first-graf 0 (min 450 (count first-graf))))))