(ns madeleines.app-state
  (:require [reagent.core :refer [atom]]))

(def remembrance (atom nil))
(def path (atom nil))

(defn new-remembrance! [remem]
  (reset! remembrance remem))

(defn new-path! [p]
  (reset! path p))
