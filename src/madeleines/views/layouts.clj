(ns madeleines.views.layouts
  (:use [hiccup core page element form])
  (:use madeleines.views.partials))

(defn layout [root-class & content]
  (html5
    (head-tag)
    [:body {:class root-class}
      [:div {:class "container"}
        (header)
        content
        (footer)]]))