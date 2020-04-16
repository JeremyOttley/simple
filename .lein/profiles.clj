{:user {:dependencies [[org.clojure/tools.namespace "0.2.3"]
                       [clj-http "3.10.0"]
                       [cheshire "5.10.0"]]
        :injections [(require '[clojure.tools.namespace.repl :refer [refresh]]
                              '[clj-http.client :as http]
                              '[cheshire.core :refer :all]
                              '[clojure.edn :as edn])]
        :plugins [[lein-try "0.4.3"]
                  [jonase/eastwood "0.3.10"]
                  [lein-kibit "0.1.8"]
                  [cider/cider-nrepl "0.24.0"]
                  [lein-ancient "0.6.15"]
                  [venantius/ultra "0.6.0"]]}
 :repl {:plugins [[cider/cider-nrepl "0.24.0"]]
        :dependencies [[nrepl "0.4.5"]]
        :repl-options {:timeout 150000
                       :prompt (fn [ns] (format "%s(%s) => " ns (System/getenv "HOME")))}}}

