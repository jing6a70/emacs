;; -*- no-byte-compile: t; lexical-binding: nil -*-
(define-package "magit" "20260103.1925"
  "A Git porcelain inside Emacs."
  '((emacs         "28.1")
    (compat        "30.1")
    (cond-let      "0.2")
    (llama         "1.0")
    (magit-section "4.5")
    (seq           "2.24")
    (transient     "0.12")
    (with-editor   "3.4"))
  :url "https://github.com/magit/magit"
  :commit "9cbdaf5ddfe825c04ffa306dde6bdfea9ab6dff3"
  :revdesc "9cbdaf5ddfe8"
  :keywords '("git" "tools" "vc")
  :authors '(("Marius Vollmer" . "marius.vollmer@gmail.com")
             ("Jonas Bernoulli" . "emacs.magit@jonas.bernoulli.dev"))
  :maintainers '(("Jonas Bernoulli" . "emacs.magit@jonas.bernoulli.dev")
                 ("Kyle Meyer" . "kyle@kyleam.com")))
