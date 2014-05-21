(ns madeleines.client
  (:require [reagent.core :as reagent :refer [atom]]
            [clojure.string :refer [replace]]))

(def remembrance (atom nil))

(defn header []
  [:h1
    [:a {:href "/"} "Madeleines"]])

(defn footer []
  [:div {:class "footer"}
    [:a {:href "/bake"} "bake"]])

(defn app []
  [:div {:class "container"}
    [header]
    [footer]])

(defn ^:export run []
  (reagent/render-component [app] (.-body js/document)))

(defn keywordify [s]
  (-> s
      (replace "_" "-")
      keyword))

(defn keywordify-keys [m]
  (let [ks (keys m)
        vs (vals m)]
    (zipmap (map keywordify ks) vs)))

;; TODO: Replace with network code
(->> "{\"dropped_on\": 1400558400000,
       \"remembered_on\": 1377057600000,
       \"preview\": \"A woman is abducted and hypnotized with material harvested from a flower. When she falls for a man, the two realize they have been subjected to the same process. Together, they search for safety as they struggle to reassemble their wrecked lives.\",
       \"title\": \"Watch Upstream Color Online\",
       \"url\": \"http://movies.netflix.com/WiMovie/Upstream_Color/70265224?trkid=13462069\",
       \"id\": 4}"
     (.parse js/JSON)
     js->clj
     keywordify-keys
     (reset! remembrance))
