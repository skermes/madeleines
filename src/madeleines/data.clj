(ns madeleines.data)
; TODO: Depend on Korma

; TODO: Make this pull from a database
;       It should pull one row out and format it like this map.  Which row to
;       pull should be determined by the current day.  Bonus points if the
;       method of selecting which row doesn't depend on how many rows there are
;       (i.e., we can replay history even after adding more data).
(defn bite []
  {:title "obfuscurity. - Are We Ready to Kill Thresholds?"
   :url "http://obfuscurity.com/2013/06/Are-We-Ready-to-Kill-Thresholds"
   :preview "I've been hearing a lot of chatter from various sources that adaptive fault detection is going to be The New Shit ™ and that static thresholds are virtually useless because they lack context. While I agree that some of the more advanced techniques sound amazing (and make no mistake, I'm really excited about the possibilities here), it's foolish to think that thresholds as a measure of fault conditions are useless."})
