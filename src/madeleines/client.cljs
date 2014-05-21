(ns madeleines.client
  (:require [reagent.core :as reagent :refer [atom]]
            [clojure.string :refer [replace]]
            [goog.net.XhrIo]))

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

(defn load-ajax-json [response]
  (->> response
       (.-target)
       (.getResponseJson)
       js->clj
       keywordify-keys))

(.send goog.net.XhrIo "/api/v1/bite" #(reset! remembrance (load-ajax-json %)))
