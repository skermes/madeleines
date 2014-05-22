(ns madeleines.handler
  (:use compojure.core)
  (:use madeleines.views)
  (:use madeleines.data)
  (:require [clojure.data.json :as json])
  (:require [compojure.handler :as handler]
            [compojure.route :as route])
  (:require [ring.adapter.jetty :as jetty]))

(defroutes app-routes
  (context "/api/v1" []
    (GET "/bite" [] (json/write-str (bite)))
    (POST "/drop" [] (json/write-str (drop-bite)))
    (POST "/bake" [url] (json/write-str {:status (bake url)})))

  ;; route/resources seems to be taking control of GET / in production.  As far
  ;; as I can see, there's not file that should be triggering it, and it doesn't
  ;; happen in development, so I'm not sure whats up.  Google has nothing.
  (GET "/" [] (js-client-page))
  (route/resources "/")
  (route/not-found (js-client-page)))

(def app
  (handler/site app-routes))

(defn -main [port]
  (jetty/run-jetty app {:port (Integer. port) :join? false}))
