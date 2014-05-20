(defproject madeleines "0.1.0"
  :description "A very simple anti-bookmarking service."
  :url "http://madeleines.herokuapp.com"
  :dependencies [[org.clojure/clojure "1.5.1"]
                 [compojure "1.1.5"]
                 [hiccup "1.0.0"]
                 [org.clojure/java.jdbc "0.3.0-alpha4"]
                 [postgresql "9.1-901.jdbc4"]
                 [clj-time "0.5.1"]
                 [com.gravity/goose "2.1.22"]
                 [ring/ring-jetty-adapter "1.2.0"]
                 [org.clojure/data.json "0.2.4"]
                 [org.clojure/clojurescript "0.0-2173"]
                 [reagent "0.4.2"]]
  :min-lein-version "2.2.0"
  :uberjar-name "madeleines-standalone.jar"
  :plugins [[lein-ring "0.8.5"]
            [lein-cljsbuild "1.0.2"]]
  :hooks [leiningen.cljsbuild]
  :ring {:handler madeleines.handler/app}
  :profiles {:dev {:dependencies [[ring-mock "0.1.5"]]}
             :prod {:cljsbuild
                    {:builds
                      {:client
                        {:compiler
                          {:optimizations :advanced
                           :preamble ^:replace ["reagent/react.min.js"]
                           :pretty-print false}}}}}}
  :cljsbuild {:builds
              {:client {:source-paths ["src"]
                        :compiler
                          {:preamble ["reagent/react.js"]
                           :output-dir "resources/public/js"
                           :output-to "resources/public/js/madeleines.js"
                           :pretty-print true}}}})
