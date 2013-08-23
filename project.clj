(defproject madeleines "0.1.0"
  :description "A very simple anti-bookmarking service."
  :url "http://madeleines.herokuapp.com"
  :dependencies [[org.clojure/clojure "1.5.1"]
                 [compojure "1.1.5"]
                 [hiccup "1.0.0"]
                 [org.clojure/java.jdbc "0.3.0-alpha4"]
                 [postgresql "9.1-901.jdbc4"]
                 [clj-time "0.5.1"]
                 [com.gravity/goose "2.1.22"]]
  :min-lein-version "2.2.0"
  :plugins [[lein-ring "0.8.5"]]
  :ring {:handler madeleines.handler/app}
  :profiles
  {:dev {:dependencies [[ring-mock "0.1.5"]]}})
