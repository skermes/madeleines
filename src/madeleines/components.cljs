(ns madeleines.components
  (:require [madeleines.app-state :as app-state]
            [madeleines.events :refer [prevent-and]]
            [madeleines.router :as router]
            [madeleines.api :as api]
            [reagent.core :refer [atom]]))

(defn link [path text]
  [:a {:href path
       :on-click (prevent-and #(router/change-path! path))}
    text])

(defn header []
  [:h1
    [link router/root-path "Madeleines"]])

(defn footer []
  [:div {:class "footer"}
    [link router/bake-path "bake"]])

(defn remembrance-title [title url]
  [:h2
    [:a {:href url} (if (empty? title) url title)]])

(defn remembrance-preview [preview]
  [:div {:class "preview"} preview])

(defn remembrance-actions [dropped-on ]
    [:div {:class "actions"}
      (if (nil? dropped-on)
          [:form {:class "action-drop" :method "delete"
                  :action router/root-path
                  :on-submit (prevent-and api/drop-todays-remembrance!)}
            [:input {:type "submit" :value "drop"}]]
          [:div {:class "dropped-notice"}
            "No good, huh?  This won't show up after today."])])

(defn signature [name]
  [:div {:class "signature"} name])

(defn waiting-message []
  [:div {:class "waiting"}
    [:div "You are encouraged to take this delay in loading your data as an
           opportunity to sit and contemplate existence."]
    [:div "Should the delay (or existence) persist longer than expected,
           take two aspirin and refresh the page."]
    [signature "The Mgt."]])

(defn todays-remembrance []
  (if (nil? @app-state/remembrance)
      [waiting-message]
      (let [{:keys [title url preview dropped-on]} @app-state/remembrance]
        [:div
          [remembrance-title title url]
          [remembrance-preview preview]
          [remembrance-actions dropped-on]])))

(defn toast [class-name text]
  [:div {:class (str "toast toast-" class-name)} text])

(defn success-toast []
  [toast "success" "Nice.  We've got it tucked away on the shelf for a rainy Sunday morning."])

(defn error-toast []
  [toast "error" "Looks like our oven ate that one.  Try again?"])

(defn baking-status-toast []
  (let [status (@app-state/baking-status :status)]
    (condp = status
      "success" [success-toast]
      "error" [error-toast]
      [:div])))

(defn new-remembrance-input [url-to-bake]
  [:input {:type "text" :name "url" :value @url-to-bake
           :on-change #(reset! url-to-bake (-> % .-target .-value))}])

(defn new-remembrance-submit []
  [:input {:type "submit" :value "bake"}])

(defn bake-url-and-clear-input! [url]
  (api/bake-remembrance! @url)
  (reset! url ""))

(defn new-remembrance-form [url-to-bake]
  [:form {:method "post" :action router/bake-path
          :on-submit (prevent-and #(bake-url-and-clear-input! url-to-bake))}
    [new-remembrance-input url-to-bake]
    [new-remembrance-submit]])

(defn bake-new-remembrance []
  (let [url-to-bake (atom "")]
    [:div
      [baking-status-toast]
      [new-remembrance-form url-to-bake]]))

(defn poem [& lines]
  [:div {:class "poem"}
    (map #(vector :div {:class "line"} %1) lines)])

(defn four-oh-four []
  [:div
    [poem "Yesterday upon the stair"
          "I saw a man who wasn't there"
          "He wasn't there again today"
          "I wish that man would go away"]
    [signature "Hughes Means"]])

(defn layout [content]
  [:div {:class "container"}
    [header]
    content
    [footer]])
