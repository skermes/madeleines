(ns madeleines.events)

(defn prevent-and [func]
  (fn [event]
    (.preventDefault event)
    (func)))
