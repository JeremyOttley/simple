{:user {:dependencies [[org.clojure/tools.namespace "0.2.3"]]
        :injections [(require '(clojure.tools.namespace repl find))]
        :plugins [[lein-pprint "1.1.1"]
                  [lein-clojars "0.9.1"]
                  [lein-exec "0.3.1"]
                  [cider/cider-nrepl "0.24.0"]
                  [lein-ancient "0.6.15"]
                  [lein-try "0.4.3"]
                  [lein-asciidoctor "0.1.12"]
                  [lein-kibit "0.1.8"]
                  [venantius/ultra "0.6.0"]]
        :asciidoctor {:sources "doc/*.ascii"
              :format :html5
              :to-dir "out/"
              :header false
              :toc :left
              :toc-title "Contents"
              :doctype :article
              :source-highlight true}
        :middleware [cider-nrepl.plugin/middleware]
        :repl-options {:prompt (fn [ns] (format "%s(%s) => " ns (System/getenv "HOME")))}}}
