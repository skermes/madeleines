(ns madeleines.handler
  (:use compojure.core)
  (:use madeleines.views)
  (:use madeleines.data)
  (:require [clojure.data.json :as json])
  (:require [compojure.handler :as handler]
            [compojure.route :as route])
  (:require [ring.adapter.jetty :as jetty]))

(defroutes app-routes
  (GET "/" [] (js-client-page))
  (DELETE "/" [] (index-page (drop-bite)))
  (GET "/bake" [] (bake-page))
  (POST "/bake" [url] (bake-page (bake url)))

  (context "/api/v1" []
    (GET "/bite" [] (json/write-str (bite)))
    (POST "/drop" [] (json/write-str (drop-bite)))
    (POST "/bake" [url] (json/write-str {:status (bake url)})))

  (route/resources "/")
  (route/not-found (four-oh-four-page)))

(def app
  (handler/site app-routes))

(defn -main [port]
  (jetty/run-jetty app {:port (Integer. port) :join? false}))
