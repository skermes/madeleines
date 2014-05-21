(ns madeleines.router
  (:require [madeleines.components :as components]
            [madeleines.app-state :as app-state]))

(defn current-path []
  (.-pathname js/location))

(defn component-for-path [path]
  (condp = path
         "/" components/todays-remembrance))
