(ns madeleines.views
  (:use [hiccup core page element form]))

(defn js-client-page []
  (html5
    [:head
      [:title "Madeleines"]
      (include-css "/css/madeleines.css")]
    [:body
      (include-js "/js/madeleines.js")
      [:script {:type "text/javascript"}
        "madeleines.client.run()"]]))
