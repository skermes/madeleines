(ns madeleines.handler
  (:use compojure.core)
  (:use madeleines.views)
  (:require [compojure.handler :as handler]
            [compojure.route :as route]))

(defroutes app-routes
  (GET "/" [] (index-page))
  (GET "/bake" [] (bake-page))
  (route/resources "/")
  (route/not-found (four-oh-four-page)))

(def app
  (handler/site app-routes))
