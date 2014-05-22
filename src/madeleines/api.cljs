(ns madeleines.api
  (:require [madeleines.app-state :as app-state]
            [clojure.string :refer [replace]]
            [goog.net.XhrIo]))

(defn keywordify [s]
  (-> s
      (replace "_" "-")
      keyword))

(defn keywordify-keys [m]
  (let [ks (keys m)
        vs (vals m)]
    (zipmap (map keywordify ks) vs)))

(defn ajax->clj [response]
  (->> response
       (.-target)
       (.getResponseJson)
       js->clj
       keywordify-keys))

(defn fetch-todays-remembrance! []
  (.send goog.net.XhrIo "/api/v1/bite"
                         #(app-state/new-remembrance! (ajax->clj %))))

(defn drop-todays-remembrance! []
  (.send goog.net.XhrIo "/api/v1/drop"
                        #(app-state/new-remembrance! (ajax->clj %))
                        "POST"))
