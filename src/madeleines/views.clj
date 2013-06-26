(ns madeleines.views
  (:use [hiccup core page]))

(defn index-page []
  (html5
    [:head
      [:title "Madeleines"]
      (include-css "/css/madeleines.css")]
    [:body
      [:div {:class "container"}
        [:h1 "Madeleines"]]]))
