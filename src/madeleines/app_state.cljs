(ns madeleines.app-state
  (:require [reagent.core :refer [atom]]))

(def remembrance (atom nil))
(def path (atom nil))
(def baking-status (atom {:status nil}))

(defn new-remembrance! [remem]
  (reset! remembrance remem))

(defn new-path! [p]
  (reset! path p))

(defn new-baking-status! [status]
  (reset! baking-status status))
