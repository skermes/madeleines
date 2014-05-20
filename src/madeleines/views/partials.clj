(ns madeleines.views.partials
  (:use [hiccup core page element form]))

(defn footer []
  [:div {:class "footer"}
    (link-to "/bake" "bake")])

(defn header []
  [:h1 (link-to "/" "Madeleines")])

(defn head-tag []
  [:head
    [:title "Madeleines"]
    (include-css "/css/madeleines.css")])

(defn drop-button-or-notice [dropped-on]
  (cond
    (nil? dropped-on) (form-to {:class "action-drop"} [:delete "/"]
                        (submit-button "drop"))
    :else [:div {:class "dropped-notice"} "No good, huh?  This won't show up after today."]))

(defn toast [klass text]
  [:div {:class (str "toast toast-" klass)} text])

(defn submission-state-toast [state]
  (cond
    (= :success state) (toast "success" "Nice.  We've got it tucked away on the shelf for a rainy Sunday morning.")
    (= :error state) (toast "error" "Looks like our oven ate that one.  Try again?")
    :else nil))

(defn poem [& lines]
  [:div {:class "poem"}
    (map #(vector :div {:class "line"} %1) lines)])
