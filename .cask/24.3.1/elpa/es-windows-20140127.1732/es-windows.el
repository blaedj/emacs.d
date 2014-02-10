;;; es-windows.el --- Window-management utilities -*- lexical-binding: t -*-

;; Version: 20140127.1732
;;; X-Original-Version: 0.2
;;; Author: sabof
;;; URL: https://github.com/sabof/es-windows
;;; Package-Requires: ((cl-lib "0.3") (emacs "24"))

;;; Commentary:

;; The project is hosted at https://github.com/sabof/es-windows
;; The latest version, and all the relevant information can be found there.

;;; License:

;; This file is NOT part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program ; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Code:

(require 'quail)
(require 'cl-lib)
(require 'face-remap)

(defface esw/label-face
    `((t (:inherit font-lock-function-name-face
                   :height ,(* 2 (face-attribute 'default :height)))))
  "Face used for regular files in project-explorer sidebar."
  :group 'es-windows)

(defface esw/selection-face
    `((t (:inherit region)))
  "Face used for regular files in project-explorer sidebar."
  :group 'es-windows)

(defcustom esw/be-helpful t
  "Whether to show help messages."
  :group 'es-windows
  :type 'boolean)

(defcustom esw/colorize-selection t
  "Whether to dynamically colorize the selected window."
  :group 'es-windows
  :type 'boolean)

(defvar esw/user-input-regex
  "^ *\\([^Vv<>^]+\\)?\\([Vv<>^]\\)? *$")

(defvar esw/window-id-mappings nil)

(defun esw/window-children (window)
  (let* (( first-child (or (window-left-child window)
                           (window-top-child window)))
         ( children (list first-child)))
    (when first-child
      (while (window-next-sibling (car children))
        (push (window-next-sibling (car children))
              children))
      (nreverse children))))

(cl-defun esw/window-lineage (&optional (window (selected-window)))
  "Result includes WINDOW"
  (nreverse
   (cl-loop for the-window = window then (window-parent the-window)
            while the-window
            when (esw/window-splittable-p the-window)
            collect the-window)))

(defun esw/shortcuts ()
  (cl-remove-if (lambda (it) (member it '("V" "v")))
                (cl-loop with layout = (split-string quail-keyboard-layout "")
                         for row from 1 to 4
                         nconc (cl-loop for col from 1 to 10
                                        collect (nth (+ 1 (* 2 col) (* 30 row)) layout)))))

(cl-defun esw/internal-window-list (&optional (window (frame-root-window)))
  (let (( result (list window))
        ( fringe (list window))
        new-fringe)
    (while fringe
      (cl-dolist (window fringe)
        (let ((children (esw/window-children window)))
          (when children
            (cl-callf append result children)
            (cl-callf append new-fringe children))))
      (setq fringe new-fringe
            new-fringe nil))
    (cl-remove-if-not 'esw/window-splittable-p
                      result)
    ))

(defun esw/cover-window (window label)
  (let (( buffer (generate-new-buffer
                  (buffer-name
                   (window-buffer window)))))
    (with-current-buffer buffer
      (setq major-mode 'esw/cover-mode)
      (insert label)
      (goto-char (point-min))
      (setq cursor-type nil)
      (setq buffer-read-only t)
      (when (window-dedicated-p window)
        (set-window-dedicated-p window nil))
      (set-window-buffer window buffer)
      buffer)))

(defun esw/window-type (window)
  (cond ( (window-left-child window)
          "H")
        ( (window-top-child window)
          "V")))

(defun esw/window-list ()
  (cl-remove-if-not 'esw/window-splittable-p
                    (window-list nil nil (frame-first-window))))

(defun esw/save-windows ()
  (let ((windows (esw/window-list)))
    (list (current-window-configuration)
          (cl-remove-if-not 'window-dedicated-p windows)
          (mapcar (lambda (window) (cons window (window-point window)))
                  windows)
          (cl-remove-if-not (lambda (window)
                              (with-selected-window window
                                (with-current-buffer (window-buffer window)
                                  (eobp))))
                            windows)
          )))

(defun esw/window-splittable-p (window)
  (cond ( (window-parameter window 'window-side)
          nil)
        ( (cl-some (lambda (window)
                     (window-parameter window 'window-side))
                   (esw/window-children window))
          nil)
        ( t)))

(cl-defun esw/mark-windows ()
  (let* (( string
           (save-excursion
             ;; (setq tmp (buffer-string))
             (goto-char (length (minibuffer-prompt)))
             ;; (search-forward ": " )
             (buffer-substring (point) (point-max))))
         ( buffer-id (progn (string-match esw/user-input-regex string)
                            (match-string 1 string)))
         ( selected-window
           (car (rassoc buffer-id esw/window-id-mappings)))
         ( windows-to-mark
           (when selected-window
             (cl-remove-if 'esw/window-children
                           (esw/internal-window-list
                            selected-window)))))
    (cl-loop for window being the windows
             do (with-selected-window window
                  (with-current-buffer (window-buffer window)
                    (when (and esw/colorize-selection
                               ;; Should always be t
                               (eq major-mode 'esw/cover-mode))
                      (if (memq window windows-to-mark)
                          (face-remap-add-relative
                           'default 'esw/selection-face)
                        (face-remap-remove-relative
                         '(default . esw/selection-face))
                        )))))
    ))

(define-minor-mode esw/minibuffer-mode
    "Custom esw keybindings for the minibuffer."
  nil nil
  (let ((map (make-sparse-keymap)))
    (cl-dolist (key '("v" "V" "<" ">" "^"))
      (define-key map key 'self-insert-and-exit))
    map)
  (progn
    (add-hook 'post-command-hook 'esw/mark-windows nil t)))

(defun esw/restore-windows (spec)
  (cl-destructuring-bind
      (config dedicated-windows window-points eobp-window-list)
      spec
    (set-window-configuration config)
    (cl-dolist (w window-points)
      (set-window-point (car w) (cdr w)))
    (cl-dolist (w dedicated-windows)
      (set-window-dedicated-p w t))
    (cl-dolist (win eobp-window-list)
      (with-selected-window win
        (with-current-buffer (window-buffer win)
          (goto-char (point-max)))))))

(cl-defun esw/select-window (&optional prompt no-splits)
  (interactive)
  (setq no-splits nil) ; Not implemented
  (setq prompt
        (or prompt
            (if (and (not no-splits) esw/be-helpful)
                "Select a window (type a large number followed by ^, >, v, < or RET): "
              "Select window: ")))
  (let* (( help-message "
Each number represents an emacs window. Windows followed by H or V, are
internal Horizontal or Vertical splitters. The last window is an external
window, showing this buffer.

Type the number of the window you want, followed by RET, and that window will be
used. You can also type ^, >, v, or < instead of RET, in which case the window
will be split in that direction.

If no window is provided, use the closest to root window that can be split.

To prevent this message from showing, set `esw/be-helpful' to `nil'")
         ( spec (esw/save-windows))
         ( windows (esw/window-list))
         ( internal-windows
           (esw/internal-window-list))
         ( esw/window-id-mappings
           (cl-mapcar (lambda (window id)
                        (cons window id))
                      internal-windows
                      (esw/shortcuts)))
         ( cover-window
           (lambda (window)
             (esw/cover-window
              window
              (if no-splits
                  (assoc window window-id-map)
                (concat (mapconcat (lambda (window)
                                     (concat
                                      (propertize (cdr (assoc window
                                                              esw/window-id-mappings))
                                                  'face 'esw/label-face)
                                      (esw/window-type window)))
                                   (esw/window-lineage window)
                                   " ")
                        (when esw/be-helpful help-message))))))
         buffers
         user-input-action
         selected-window)

    (unwind-protect
         (let (( minibuffer-setup-hook
                 (cons 'esw/minibuffer-mode
                       minibuffer-setup-hook))
               user-input)
           (setq buffers (mapcar cover-window windows))
           (if no-splits
               (progn)
             (setq user-input (read-string prompt))
             (string-match esw/user-input-regex user-input))
           (setq selected-window (if (match-string 1 user-input)
                                     (or (car (rassoc (match-string 1 user-input)
                                                      esw/window-id-mappings))
                                         (user-error "Not a valid window"))
                                   (cl-find-if 'esw/window-splittable-p
                                               internal-windows)))
           (unless selected-window
             (user-error "No window selected"))
           (setq user-input-action (match-string 2 user-input)))
      (mapc 'kill-buffer buffers)
      (esw/restore-windows spec))

    (if user-input-action
        (progn (cl-callf downcase user-input-action)
               (setq selected-window
                     (split-window
                      selected-window
                      nil (cdr (assoc user-input-action
                                      '((">" . right)
                                        ("<" . left)
                                        ("^" . above)
                                        ("v" . below)
                                        ))))))
      (while (not (window-live-p selected-window))
        (unless selected-window
          (error "Not a window"))
        (let ((children (esw/window-children selected-window)))
          (mapc 'delete-window (cl-rest children))
          (setq selected-window (car children)))
        (set-window-dedicated-p selected-window nil)))
    (select-window selected-window)
    (cl-dolist (win (nth 3 spec))
      (when (window-live-p win)
        (with-selected-window win
          (with-current-buffer (window-buffer win)
            (goto-char (point-max))))))
    selected-window))

(defun esw/show-buffer (buffer)
  (interactive (list (get-buffer-create (read-buffer "Choose buffer: "))))
  (set-window-buffer (esw/select-window) buffer))

(defun esw/move-window (window)
  "Show current buffer in a different window, and delete the old window."
  (interactive (list (selected-window)))
  (unless (eq t (window-deletable-p window))
    (user-error "Can't delete window"))
  (let* (( ori-window window)
         ( buffer (window-buffer ori-window))
         ( new-window (esw/select-window)))
    (unless (eq new-window ori-window)
      (set-window-buffer new-window buffer)
      (delete-window ori-window))))

(provide 'es-windows)
;;; es-windows.el ends here
