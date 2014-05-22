(ns madeleines.api
  (:require [madeleines.app-state :as app-state]
            [madeleines.router :refer
              [api-bite-path api-bake-path api-drop-path]]
            [clojure.string :refer [replace]]
            [goog.net.XhrIo]))

(defn keywordify [s]
  (-> s
      (replace "_" "-")
      keyword))

(defn keywordify-keys [m]
  (let [ks (keys m)
        vs (vals m)]
    (zipmap (map keywordify ks) vs)))

(defn ajax->clj [response]
  (->> response
       (.-target)
       (.getResponseJson)
       js->clj
       keywordify-keys))

;; Stolen from cemerick.url.  I tried including the library, but it caused my
;; cljsbuild to hang.
(defn url-encode [string]
  (-> string (js/encodeURIComponent) (replace "+" "%20")))

(defn fetch-todays-remembrance! []
  (.send goog.net.XhrIo api-bite-path
                         #(app-state/new-remembrance! (ajax->clj %))))

(defn drop-todays-remembrance! []
  (.send goog.net.XhrIo api-drop-path
                        #(app-state/new-remembrance! (ajax->clj %))
                        "POST"))

(defn bake-remembrance! [url]
  (.send goog.net.XhrIo api-bake-path
                        #(app-state/new-baking-status! (ajax->clj %))
                        "POST"
                        (str "url=" (url-encode url))))
