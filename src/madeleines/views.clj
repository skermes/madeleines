(ns madeleines.views
  (:use madeleines.data)
  (:use [hiccup core page element]))

(defn- footer [] [:div {:class "footer"}])

(defn- header [] [:h1 "Madeleines"])

(defn- head-tag []
  [:head
    [:title "Madeleines"]
    (include-css "/css/madeleines.css")])

(defn- layout [& content]
  (html5
    (head-tag)
    [:body
      [:div {:class "container"}
        (header)
        content
        (footer)]]))

(defn index-page []
  (let [{title :title url :url preview :preview} (bite)]
    (layout
      (link-to url [:h2 title])
      [:div {:class "preview"}
        preview])))








