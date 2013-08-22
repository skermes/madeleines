(defproject madeleines "0.1.0"
  :description "FIXME: write description"
  :url "http://madeleines.herokuapp.com"
  :dependencies [[org.clojure/clojure "1.5.1"]
                 [compojure "1.1.5"]
                 [hiccup "1.0.0"]
                 [korma "0.3.0-RC5"]
                 [postgresql "9.1-901.jdbc4"]
                 [clj-time "0.5.1"]
                 [com.gravity/goose "2.1.22"]]
  :plugins [[lein-ring "0.8.5"]]
  :ring {:handler madeleines.handler/app}
  :profiles
  {:dev {:dependencies [[ring-mock "0.1.5"]]}})
