(ns madeleines.app-state
  (:require [reagent.core :refer [atom]]))

(def remembrance (atom nil))

(defn new-remembrance! [remem]
  (reset! remembrance remem))
