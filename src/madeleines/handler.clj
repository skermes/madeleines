(ns madeleines.handler
  (:use compojure.core)
  (:use madeleines.views)
  (:use madeleines.data)
  (:require [compojure.handler :as handler]
            [compojure.route :as route]))

(defroutes app-routes
  (GET "/" [] (index-page (bite)))
  (DELETE "/" [] (index-page (drop-bite)))
  (GET "/bake" [] (bake-page))
  (POST "/bake" [url] (bake-page (bake url)))
  (route/resources "/")
  (route/not-found (four-oh-four-page)))

(def app
  (handler/site app-routes))
