(ns madeleines.components
  (:require [madeleines.app-state :as app-state]))

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

(defn waiting-message []
  [:div {:class "waiting"}
    [:div "You are encouraged to take this delay in loading your data as an
           opportunity to sit and contemplate existence."]
    [:div "Should the delay (or existence) persist longer than expected,
           take two aspirin and refresh the page."]
    [:div {:class "signature"} "The Mgt."]])

(defn todays-remembrance []
  (if (nil? @app-state/remembrance)
      [waiting-message]
      (let [{:keys [title url preview dropped-on]} @app-state/remembrance]
        [:div
          [remembrance-title title url]
          [remembrance-preview preview]
          [remembrance-actions dropped-on]])))

(defn layout [content]
  [:div {:class "container"}
    [header]
    content
    [footer]])
