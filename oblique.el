;;; oblique.el --- Provide an oblique strategy

;; Copyright FoAM 2011
;;
;; Author: nik gaffney <nik@fo.am>
;; Created: 2011-11-11
;; Version: 0.1
;; Keywords: strategy, tactics, creativity
;; URL: https://github.com/zzkt/oblique-strategies

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.


;;; Commentary:

;; "Oblique Strategies (subtitled over one hundred worthwhile dilemmas)
;; is a set of published cards created by Brian Eno and Peter Schmidt
;; first published in 1975, and is now in its fifth, open ended, edition.
;; Each card contains a phrase or cryptic remark which can be used to break
;; a deadlock or dilemma situation.  Some are specific to music composition;
;; others are more general."
;;         http://en.wikipedia.org/wiki/Oblique_Strategies
;;
;; "I do this with hesitation.  The following list is unarguably copyrighted
;; by Brian Eno himself, and will no doubt be removed from this guide entry
;; by some uninspired lawyer.  The intent of this document is not to gain
;; financially at the expense of anyone, but to spread the knowledge of this
;; little known but really keen neato cool idea."
;;        https://h2g2.com/entry/A635528
;;
;; "The purpose of this document is to provide a listing of the complete
;; contents of all three versions of the Oblique Strategies.  While my
;; interest in doing so is scholarly, readers may be interested in
;; constructing their own "meta-set" of all three editions of the decks,
;; or in looking at what is added or deleted."
;;                http://music.hyperreal.org/artists/brian_eno/osfaq2.html
;;
;; Oblique Strategies © 1975, 1978, 1979, and 2002 Brian Eno and Peter Schmidt

;;; Revision history:
;;
;;  - 2011-11-11 - protoversion, collection, collation
;;  - 2019-12-12 - melpa emersion, stochastism


;;; Code:

(defgroup oblique-strategies nil
  "Once the search has begun, something will be found"
  :group 'stochastism)

(defcustom oblique-edition "strategies/oblique-strategies-condensed.txt"
  "Which edition of the Oblique Strategies to draw from?"
  :group 'oblique-strategies
  :type  '(choice
	   (const :tag "Condensed Edition (2001)" :value "strategies/oblique-strategies-condensed.txt")
	   (const :tag "Edition 4 (1996)" :value "strategies/oblique-strategies-edition-4.txt")
	   (const :tag "Edition 3 (1979)" :value "strategies/oblique-strategies-edition-3.txt")
	   (const :tag "Edition 2 (1978)" :value "strategies/oblique-strategies-edition-2.txt")
	   (const :tag "Edition 1 (1975)" :value "strategies/oblique-strategies-edition-1.txt")))

(defun read-lines (file)
  "Read a file into a list of lines."
  (with-temp-buffer
    (insert-file-contents (expand-file-name
			   file (file-name-directory load-file-name)))
    (split-string (buffer-string) "\n" t)))

(defvar oblique-strategy-strategies (read-lines oblique-edition))

(defun random-elt (list)
  (nth (random (length list)) list))

;;;###autoload
(defun oblique-strategy ()
  "An oblique strategy."
  (interactive)
  (random-elt oblique-strategy-strategies))

;;;###autoload
(defun insert-oblique-strategy ()
  "Insert an oblique strategy at point."
  (interactive)
  (insert (oblique-strategy)))

(provide 'oblique)

;;; oblique.el ends here
