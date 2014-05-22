(ns madeleines.router
  (:require [madeleines.app-state :as app-state]))

(defn current-path []
  (.-pathname js/location))

(defn api-path [path]
  (str "/api/vi"))

(def root-path "/")
(def bake-path "/bake")
(def api-bite-path (api-path "/bite"))
(def api-bake-path (api-path "/bake"))
(def api-drop-path (api-path "/drop"))

(defn change-path! [path]
  (.pushState js/history nil nil path)
  (app-state/new-path! path))
