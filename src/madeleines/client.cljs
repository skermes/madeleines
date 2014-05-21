(ns madeleines.client
  (:require [madeleines.app-state :as app-state]
            [madeleines.components :as components]
            [reagent.core :as reagent]
            [clojure.string :refer [replace]]
            [goog.net.XhrIo]))

(defn ^:export run []
  (reagent/render-component [components/app] (.-body js/document)))

(defn keywordify [s]
  (-> s
      (replace "_" "-")
      keyword))

(defn keywordify-keys [m]
  (let [ks (keys m)
        vs (vals m)]
    (zipmap (map keywordify ks) vs)))

(defn load-ajax-json [response]
  (->> response
       (.-target)
       (.getResponseJson)
       js->clj
       keywordify-keys))

(.send goog.net.XhrIo "/api/v1/bite"
                      #(app-state/new-remembrance! (load-ajax-json %)))
