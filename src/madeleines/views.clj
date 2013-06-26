(ns madeleines.views
  (:use madeleines.data)
  (:use [hiccup core page element form]))

(defn- footer []
  [:div {:class "footer"}
    (link-to "/bake" "bake")])

(defn- header []
  [:h1 (link-to "/" "Madeleines")])

(defn- head-tag []
  [:head
    [:title "Madeleines"]
    (include-css "/css/madeleines.css")
    (include-js "http://code.jquery.com/jquery-1.10.1.min.js"
                "/js/madeleines.js")])

(defn- layout [root-class & content]
  (html5
    (head-tag)
    [:body {:class root-class}
      [:div {:class "container"}
        (header)
        content
        (footer)]]))

(defn index-page []
  (let [{title :title url :url preview :preview} (bite)]
    (layout "index"
      [:h2 (link-to url title)]
      [:div {:class "preview"}
        preview])))

(defn bake-page []
  (layout "bake"
    (form-to [:post "/bake"]
      (text-field "url")
      (submit-button "bake"))))

(defn- poem [& lines]
  [:div {:class "poem"}
    (map #(vector :div {:class "line"} %1) lines)])

(defn four-oh-four-page []
  (layout "404"
    (poem "Yesterday upon the stair"
          "I saw a man who wasn't there"
          "He wasn't there again today"
          "I wish that man would go away")
    [:div {:class "poet"} "Hughes Means"]))
