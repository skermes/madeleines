(ns madeleines.views
  (:use [hiccup core page element form])
  (:use madeleines.views.partials)
  (:use madeleines.views.layouts))

(defn js-client-page []
  (html5
    [:head
      [:title "Madeleines"]
      (include-css "/css/madeleines.css")]
    [:body
      (include-js "/js/madeleines.js")
      [:script {:type "text/javascript"}
        "madeleines.client.run()"]]))

(defn index-page [bite]
  (let [{title :title url :url preview :preview dropped-on :dropped_on} bite]
    (layout "index"
      [:h2 (link-to url title)]
      [:div {:class "preview"} preview]
      [:div {:class "actions"} (drop-button-or-notice dropped-on)])))

(defn bake-page
  ([] (bake-page nil))
  ([state]
    (layout "bake"
      (submission-state-toast state)
      (form-to [:post "/bake"]
        (text-field "url")
        (submit-button "bake")))))

(defn four-oh-four-page []
  (layout "404"
    (poem "Yesterday upon the stair"
          "I saw a man who wasn't there"
          "He wasn't there again today"
          "I wish that man would go away")
    [:div {:class "poet"} "Hughes Means"]))
