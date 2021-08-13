(module magic.plugin.colorizer)

(let [colorizer (require :colorizer)]
  (when colorizer
    (colorizer.setup)))
