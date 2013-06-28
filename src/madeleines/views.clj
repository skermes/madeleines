(ns madeleines.views
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

(defn- drop-button-or-notice [dropped-on]
  (cond
    (nil? dropped-on) (form-to {:class "action-drop"} [:delete "/"]
                        (submit-button "drop"))
    :else [:div {:class "dropped-notice"} "No good, huh?  This won't show up after today."]))

(defn index-page [bite]
  (let [{title :title url :url preview :preview dropped-on :dropped_on} bite]
    (layout "index"
      [:h2 (link-to url title)]
      [:div {:class "preview"} preview]
      [:div {:class "actions"} (drop-button-or-notice dropped-on)])))

(defn- toast [klass text]
  [:div {:class (str "toast toast-" klass)} text])

(defn- submission-state-toast [state]
  (cond
    (nil? state) nil
    (= :success state) (toast "success" "Nice.  We've got it tucked away on the shelf for a rainy Sunday morning.")
    (= :error state) (toast "error" "Looks like our oven ate that one. Try again?")
    :else nil))

(defn bake-page
  ([] (bake-page nil))
  ([state]
    (layout "bake"
      (submission-state-toast state)
      (form-to [:post "/bake"]
        (text-field "url")
        (submit-button "bake")))))

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
