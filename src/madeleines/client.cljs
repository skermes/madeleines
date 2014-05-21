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

(defn remembrance-title [title url]
  [:h2
    [:a {:href url} title]])

(defn remembrance-preview [preview]
  [:div {:class "preview"} preview])

(defn remembrance-actions [dropped-on ]
    [:div {:class "actions"}
      (if (nil? dropped-on)
          [:form {:class "action-drop" :method "delete" :action "/"}
            [:input {:type "submit" :value "drop"}]]
          [:div {:class "dropped-notice"}
            "No good, huh?  This won't show up after today."])])

(defn todays-remembrance []
  (if (nil? @remembrance)
      [:div {:class "waiting"}
        [:div "You are encouraged to take this delay in loading your data as an
               opportunity to sit and contemplate existence."]
        [:div "Should the delay (or existence) persist longer than expected,
               take two aspirin and refresh the page."]
        [:div {:class "signature"} "The Mgt."]]
      (let [{:keys [title url preview dropped-on]} @remembrance]
        [:div
          [remembrance-title title url]
          [remembrance-preview preview]
          [remembrance-actions dropped-on]])))

(defn app []
  [:div {:class "container"}
    [header]
    [todays-remembrance]
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
     keywordify-keys)
     ; (reset! remembrance)))
