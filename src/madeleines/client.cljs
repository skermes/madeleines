(ns madeleines.client
  (:require [madeleines.components :as components]
            [madeleines.api :as api]
            [reagent.core :as reagent]))

(defn ^:export run []
  (do
    (reagent/render-component [components/app] (.-body js/document))
    (api/fetch-todays-remembrance!)))
