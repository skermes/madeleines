(ns madeleines.client
  (:require [madeleines.components :as components]
            [madeleines.api :as api]
            [madeleines.router :as router]
            [madeleines.app-state :as app-state]
            [reagent.core :as reagent]))

(defn component-for-path [path]
  (condp = path
         router/root-path components/todays-remembrance
         router/bake-path components/bake-new-remembrance
         components/four-oh-four))

(defn app []
  (let [main-component (component-for-path @app-state/path)]
    [components/layout [main-component]]))

(defn ^:export run []
  (do
    (app-state/new-path! (router/current-path))
    (reagent/render-component [app] (.-body js/document))
    (api/fetch-todays-remembrance!)))
