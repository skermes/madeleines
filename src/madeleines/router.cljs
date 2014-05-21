(ns madeleines.router
  (:require [madeleines.app-state :as app-state]))

(defn current-path []
  (.-pathname js/location))

(def root-path "/")
(def bake-path "/bake")

(defn change-path! [path]
  (.pushState js/history nil nil path)
  (app-state/new-path! path))
