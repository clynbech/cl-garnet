;;; -*- Mode: LISP; Syntax: Common-Lisp; Package: COMMON-LISP-USER  -*-

(in-package :COMMON-LISP-USER)

;; Not likely to be anywhere in the world where this would be useful.
(defparameter garnet-version-number "3.3.post")
(pushnew :garnet *features*)
(pushnew :garnet-v3 *features*)
(pushnew :garnet-v3.3.post *features*)

;; The :garnet-debug feature allows many different kinds of run-time
;; checking, and also loads some extra test code. After you have
;; debugged your code and want it to run faster, remove :GARNET-DEBUG
;; from the *features* list and RECOMPILE all of Garnet and your code.
;; The result will be smaller and somewhat faster.
;;
;; To remove :garnet-debug from the *features* list, either defvar
;; Garnet-Garnet-Debug to NIL before you load the garnet-loader, or
;; simply edit the following defvar to set Garnet-Garnet-Debug to nil.
;;
;; TODO (ed): I have a pathological hatred of using *features*.  I find it makes
;; for hideously ugly code.  So, at some point this should be changed
;; to a runtime special variable that dynamically controls this.  That
;; will forfit code size, but will still allow for optimizing
;; production code.
(defvar garnet-garnet-debug t)
(if garnet-garnet-debug
    (pushnew :garnet-debug *features*)
    (setf *features* (delete :garnet-debug *features*)))

;; The following variable affects compiler policy. Setting it to T
;; uses the settings in *garnet-compile-debug-settings*. Setting it to
;; NIL uses the ones in *garnet-compile-production-settings*. By
;; default we simply mirror Garnet-Garnet-Debug.
(defvar garnet-compile-debug-mode garnet-garnet-debug
  "Setting this variable to T sets the policy for the entire system
to make it more debuggable.")

(defvar garnet-compile-debug-settings
  '(optimize (speed 2)
    (safety 3)
    (debug 3)
    (space 2))
  "Use these settings for globally debugging the system or for debugging
a specific module. They emphasize debuggability at the cost of some speed.

With SBCL:

- These settings are type-safe.

- They prevent functions declared inline from being expanded inline.
  Note that as part of this version I have tried to make most
  non-syntactic macros into inline functions.

- They allow all possible debugging features.")

(defvar garnet-compile-production-settings
  '(optimize (speed 3)
    (safety 0)
    (space 1)
     (debug 1)
    (compilation-speed 0))
  "production compiler policy settings. emphasize speed, de-emphasize debugging.")

(defvar default-garnet-proclaim
  (if garnet-compile-debug-mode
      garnet-compile-debug-settings
      garnet-compile-production-settings)
  "Set compiler optimization settings.

1. If you want everything debugged, set Garnet-Compile-Debug-Mode to t.

2. If you want to debug specific modules, set Garnet-Compile-Debug-Mode
   to nil. Then set the variable in the modules you want debugged to enable
   debugging that module.

3. Otherwise (for 'production' builds) just set Garnet-Compile-Debug-Mode
   to nil and leave everything else alone.")


(when default-garnet-proclaim
  (proclaim default-garnet-proclaim))

(progn
   (defpackage :AGATE (:use :COMMON-LISP :KR))
   (defpackage :DEMO-3D (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
   (defpackage :DEMO-MULTIWIN (:use :KR :COMMON-LISP) (:export DO-GO DO-STOP))
   (defpackage :DEMO-MULTIFONT (:use :COMMON-LISP KR) (:export DO-GO DO-STOP))
   (defpackage :DEMO-ANIMATOR (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
   (defpackage :DEMO-ANGLE (:use :KR :COMMON-LISP) (:export DO-GO DO-STOP))
   (defpackage :DEMO-OTHELLO (:use :KR :COMMON-LISP) (:nicknames :DOTH)
     (:export DO-GO DO-STOP START-GAME STOP-GAME SET-SCORE))
   (defpackage :DEMO-PIXMAP (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
   (defpackage :DEMO-ARITH (:use :KR :COMMON-LISP) (:export DO-GO DO-STOP))
   (defpackage :DEMO-SCHEMA-BROWSER (:use :COMMON-LISP :KR)
     (:export DO-GO DO-STOP SCHEMA-BROWSER SCHEMA-BROWSER-WIN
              SCHEMA-BROWSER-TOP-AGG))
   (defpackage :DEMO-ARRAY (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
   (defpackage :DEMO-SCROLLBAR (:use :COMMON-LISP :KR)
     (:export DO-GO DO-STOP
              MAC-obj MAC-Go MAC-Stop
              Open-obj Open-Go Open-Stop
              NEXT-obj NEXT-Go NEXT-Stop
              Motif-obj Motif-Go Motif-Stop))
   (defpackage :DEMO-CLOCK (:use :KR :COMMON-LISP) (:export DO-GO DO-STOP))
   (defpackage :DEMO-SEQUENCE (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
   (defpackage :DEMO-EDITOR (:use :KR :COMMON-LISP) (:export DO-GO DO-STOP))
   (defpackage :DEMO-TEXT (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
   (defpackage :DEMO-FILE-BROWSER (:use :COMMON-LISP :KR)
     (:export DO-GO DO-STOP FILE-BROWSER FILE-BROWSER-WIN
              FILE-BROWSER-TOP-AGG))
   (defpackage :DEMO-TRUCK (:use :KR :COMMON-LISP) (:export DO-GO DO-STOP))
   (defpackage :DEMO-GADGETS (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
   (defpackage :DEMO-TWOP (:use :KR :COMMON-LISP) (:export DO-GO DO-STOP))
   (defpackage :DEMO-GESTURE (:use :KR :COMMON-LISP) (:export DO-GO DO-STOP))
   (defpackage :DEMO-UNISTROKES (:use :COMMON-LISP :KR :INTER) (:export DO-GO DO-STOP))
   (defpackage :DEMO-GRAPH (:use :COMMON-LISP :KR)
     (:export DO-GO DO-STOP SCHEMA-GRAPH DEMO-GRAPH-ERROR-GADGET ROOT-BOX
              RELAYOUT DEMO-GRAPH-WIN))
   (defpackage :DEMO-VIRTUAL-AGG (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
   (defpackage :DEMO-GROW (:use :KR :COMMON-LISP) (:export DO-GO DO-STOP))
   (defpackage :DEMO-XASPERATE (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
   (defpackage :DEMO-LOGO (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP RE-ANIMATE))
   (defpackage :DEMOS-CONTROLLER (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP MESSAGE))
   (defpackage :DEMO-MANYOBJS (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP MOVE))
   (defpackage :DEMO-MENU (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
   (defpackage :GARNET-CALCULATOR (:use :COMMON-LISP :KR)
     (:export START-CALC STOP-CALC DO-GO DO-STOP))
   (defpackage :DEMO-MODE (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
   (defpackage :GARNETDRAW (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
   (defpackage :DEMO-MOTIF (:use :COMMON-LISP :KR) (:export DO-GO DO-STOP))
   (defpackage :MGE (:use :COMMON-LISP :KR)
     (:export DO-GO DO-STOP
              CREATE-PIECE DESTROY-PIECE DESTROY-ALL-PIECES
              GO-INITIALIZE EDITOR-SHOW-WINDOW))
   (defpackage :DEMO-MOVELINE (:use :KR :COMMON-LISP) (:export DO-GO DO-STOP))
   )


;; load-XX-p control whether the various parts are loaded or not
;; Because these use defvar, if they are set before this file is
;; loaded, their original value will be used.
(unless (boundp '*Garnet-Going-To-Compile*)
  (defvar load-utils-p T)
  (defvar load-kr-p T)
  (defvar load-kr-doc-p T)
  (defvar load-gworld-p t)
  (defvar load-gem-p T)
  (defvar load-opal-p T)
  (defvar load-inter-p T)
  #-(and)
  (defvar load-truetype-p nil)
  #-(and)
  (defvar load-truetype-p T)
  (defvar load-multifont-p NIL)
  (defvar load-gesture-p NIL)
  (defvar load-ps-p T)
  (defvar load-aggregadgets-p T)
  (defvar load-aggregraphs-p NIL)
  (defvar load-debug-p #+garnet-debug T #-garnet-debug NIL)
  (defvar load-gadgets-p NIL)
  (defvar load-demos-p NIL)
  (defvar load-protected-eval-p T)
  (defvar load-lapidary-p t)
  (defvar load-gilt-p NIL)
  (defvar load-c32-p NIL))


 
;; launch-process-p controls whether Garnet will launch
;; a separate process to detect keyboard and mouse events.
(defvar launch-process-p T)

;; update-locking-p controls whether process locks will be activated
;; around the update method (this keeps two processes from calling update
;; at the same time).
(defvar update-locking-p T
  "If T, uses process locks to keep Update in a process from interrupting
   itself in a different process.")

(defvar Multiple-Garnet-Binary-Directories T
  "T if you want the name of the binary directory to vary with the
   version of garnet, handy if you are debugging with multiple Lisp
   versions. NIL means store binaries under the \"bin\" directory.")

(format T "~&** Loading Garnet Version ~a~%" Garnet-Version-Number)

;; The following sets the pathname of the garnet directory. All the
;; rest of the pathnames will depend on this pathname.
;;

;;; CLX
;; Don't configure CLX any more. It should be made available through
;; other means, such as quicklisp. Instead, we (require :clx).
;;
;; Now do this in build script. I.e. could also use quicklisp if
;; desired. If not using the build script, you must put something here
;; that loads CLX.
(require :clx)
#+sbcl
(require :sb-posix)                     ;might be done by CLX, but if so
                                        ;the REQUIRE will just be a NO-OP

;;;(defvar *garnet-source-directory* (asdf:system-source-directory :xoanon.gui.garnet))
;; (defvar Your-Garnet-Pathname *garnet-source-directory*)
;;;(break)
;;; Garnet Root pathname
;;


(defvar Your-Garnet-Pathname
  ;; Ansi compliant way to find the build directory.
  ;; If this doesn't work for some reason, just hard-code the pathname
  ;; here.
  (namestring
   (make-pathname
    :directory
    ;; Hard coded directory path example.
    ;; '(:ABSOLUTE "usr" "local" "lib" "lisp" "garnet")
    ;; Let system determine directory path.
    (pathname-directory *garnet-load-truename*)))
  "Root of the Garnet directory tree.")

(defvar Your-Garnet-Pathname-old
  ;; Ansi compliant way to find the build directory.
  ;; If this doesn't work for some reason, just hard-code the pathname
  ;; here.
  (namestring
   (make-pathname
    :directory
    ;; Hard coded directory path example.
    ;; '(:ABSOLUTE "usr" "local" "lib" "lisp" "garnet")
    ;; Let system determine directory path.
    (pathname-directory *load-truename*)))
  "Root of the Garnet directory tree.")




(format t "*garnet-load-truename*: ~s~%"  *garnet-load-truename*)
(format t "*load-truename*: ~s~%"  *load-truename*)




;; ripped from the bowels of asdf-install... [2006/01/05:rpg]
(defun directorify (name)
  ;; input name may or may not have a training #\/, but we know we
  ;; want a directory
  (let ((path (pathname name)))
    (if (pathname-name path)
        ;; The pathname lacks a trailing slash.
        (merge-pathnames
         (make-pathname :directory `(:relative ,(pathname-name path)))
         (make-pathname :directory (pathname-directory path)
                        :host (pathname-host path)))
        ;; The pathname is OK as it stands.
        path)))


(defun append-directory (directory sub-directory)
  "This is a little utility for accessing the subdirectory of a
directory. It assumes that 'sub-directory' is directly under
'directory'."
  (let ((dir (pathname-directory directory))
        (subdir (if (listp sub-directory)
                    sub-directory
                    (list sub-directory))))
    (make-pathname :directory (append dir subdir))))


(defun Get-Garnet-Binary-Pathname ()
  (let ((directory-name "src"))
    (append-directory Your-Garnet-Pathname directory-name)))


(defvar Garnet-Src-Pathname (append-directory  Your-Garnet-Pathname "src"))
(defvar Garnet-Lib-Pathname (append-directory Your-Garnet-Pathname "lib"))
(defvar Garnet-Binary-Pathname (Get-Garnet-Binary-Pathname))


;;; Pathnames.
(defvar Garnet-Utils-Src
  (append-directory Garnet-Src-Pathname "utils"))
(defvar Garnet-Utils-Pathname
  (append-directory Garnet-Binary-Pathname "utils"))
(defvar Garnet-KR-Src
  (append-directory Garnet-Src-Pathname "kr"))
(defvar Garnet-KR-Pathname
  (append-directory Garnet-Binary-Pathname "kr"))
(defvar Garnet-Gworld-Src
  (append-directory Garnet-Src-Pathname "gworld"))
(defvar Garnet-Gworld-Pathname
  (append-directory Garnet-Binary-Pathname "gworld"))
(defvar Garnet-Gem-Src
  (append-directory Garnet-Src-Pathname "gem"))
(defvar Garnet-Gem-Pathname
  (append-directory Garnet-Binary-Pathname "gem"))
(defvar Garnet-Opal-Src
  (append-directory Garnet-Src-Pathname "opal"))
(defvar Garnet-Opal-Pathname
  (append-directory Garnet-Binary-Pathname "opal"))
(defvar Garnet-Truetype-Src
  (append-directory Garnet-Src-Pathname "truetype"))
(defvar Garnet-Truetype-Pathname
  (append-directory Garnet-Binary-Pathname "truetype"))
(defvar Garnet-Inter-Src
  (append-directory Garnet-Src-Pathname "inter"))
(defvar Garnet-Inter-Pathname
  (append-directory Garnet-Binary-Pathname "inter"))
(defvar Garnet-Gesture-Src
  (append-directory Garnet-Src-Pathname "gesture"))
(defvar Garnet-Gesture-Pathname
  (append-directory Garnet-Binary-Pathname "gesture"))
(defvar Garnet-Aggregadgets-Src
  (append-directory Garnet-Src-Pathname "aggregadgets"))
(defvar Garnet-Aggregadgets-Pathname
  (append-directory Garnet-Binary-Pathname "aggregadgets"))
(defvar Garnet-PS-Src
  (append-directory Garnet-Src-Pathname "ps"))
(defvar Garnet-PS-Pathname
  (append-directory Garnet-Binary-Pathname "ps"))
(defvar Garnet-Gadgets-Src
  (append-directory Garnet-Src-Pathname "gadgets"))
(defvar Garnet-Gadgets-Pathname
  (append-directory Garnet-Binary-Pathname "gadgets"))
(defvar Garnet-Debug-Src
  (append-directory Garnet-Src-Pathname "debug"))
(defvar Garnet-Debug-Pathname
  (append-directory Garnet-Binary-Pathname "debug"))
(defvar Garnet-Demos-Src
  (append-directory Garnet-Src-Pathname "demos"))
(defvar Garnet-Demos-Pathname
  (append-directory Garnet-Binary-Pathname "demos"))
(defvar Garnet-Gilt-Src
  (append-directory Garnet-Src-Pathname "gilt"))
(defvar Garnet-Gilt-Pathname
  (append-directory Garnet-Binary-Pathname "gilt"))
(defvar Garnet-C32-Src
  (append-directory Garnet-Src-Pathname "c32"))
(defvar Garnet-C32-Pathname
  (append-directory Garnet-Binary-Pathname "c32"))
(defvar Garnet-Lapidary-Src
  (append-directory Garnet-Src-Pathname "lapidary"))
(defvar Garnet-Lapidary-Pathname
  (append-directory Garnet-Binary-Pathname "lapidary"))
(defvar Garnet-Contrib-Src
  (append-directory Garnet-Src-Pathname "contrib"))
(defvar Garnet-Contrib-Pathname
  (append-directory Garnet-Binary-Pathname "contrib"))
(defvar Garnet-Protected-Eval-Src
  (append-directory Garnet-Src-Pathname "protected-eval"))
(defvar Garnet-Protected-Eval-Pathname
  (append-directory Garnet-Binary-Pathname "protected-eval"))

(defvar Garnet-Bitmap-Pathname
  (append-directory Garnet-Lib-Pathname "bitmaps"))
(defvar Garnet-Pixmap-Pathname
  (append-directory Garnet-Lib-Pathname "pixmaps"))
(defvar Garnet-Gilt-Bitmap-Pathname
  (append-directory Garnet-Lib-Pathname "gilt"))
(defvar Garnet-C32-Bitmap-Pathname
  (append-directory Garnet-Lib-Pathname "c32"))
(defvar Garnet-DataFile-Pathname
  (append-directory Garnet-Lib-Pathname "data"))
(defvar Garnet-Gesture-Data-Pathname
  (append-directory Garnet-Lib-Pathname "gesture"))


;;;----------------------------------------------------------

;; When compiling, the binaries will be in the same directories as the
;; source files, so make all the path names be the same
;;
;; After compilation is finished, the user should move all the binaries
;; into their own directories, as specified by the pathnames above.
(defvar *Garnet-Going-To-Compile* nil)

;;; Names of loader files.
(defparameter Garnet-Gem-Loader (merge-pathnames "gem-loader" Garnet-Gem-PathName))

(defparameter Garnet-Inter-Loader (merge-pathnames "inter-loader" Garnet-Inter-PathName))
(defparameter Garnet-Multifont-Loader (merge-pathnames "multifont-loader" Garnet-Opal-PathName))
(defparameter Garnet-Gesture-Loader (merge-pathnames "gesture-loader" Garnet-Gesture-PathName))
(defparameter Garnet-PS-Loader (merge-pathnames "ps-loader" Garnet-PS-PathName))
(defparameter Garnet-Aggregadgets-Loader (merge-pathnames "aggregadgets-loader" Garnet-Aggregadgets-PathName))
(defparameter Garnet-Aggregraphs-Loader (merge-pathnames "aggregraphs-loader" Garnet-Aggregadgets-PathName))
(defparameter Garnet-Gadgets-Loader (merge-pathnames "gadgets-loader" Garnet-Gadgets-PathName))
(defparameter Garnet-Debug-Loader (merge-pathnames "debug-loader" Garnet-Debug-PathName))
(defparameter Garnet-Demos-Loader (merge-pathnames "demos-loader" Garnet-Demos-PathName))
(defparameter Garnet-Gilt-Loader (merge-pathnames "gilt-loader" Garnet-Gilt-PathName))
(defparameter Garnet-C32-Loader (merge-pathnames "c32-loader" Garnet-C32-PathName))
(defparameter Garnet-Lapidary-Loader (merge-pathnames "lapidary-loader" Garnet-Lapidary-PathName))
(defparameter garnet-protected-eval-Loader (merge-pathnames "protected-eval-loader" Garnet-Protected-Eval-PathName))


;;;--------------------------------------------------------------------
;; Packages to load and the locations of those packages.

(defparameter Garnet-Load-Alist
;;; Target directories (binarys)
  `(("gg"                 . ,Garnet-Gadgets-PathName)
    ("gadgets"            . ,Garnet-Gadgets-PathName)
    ("utils"              . ,Garnet-Utils-PathName)
    ("kr"                 . ,Garnet-KR-PathName)
    ("gworld"             . ,Garnet-Gworld-Pathname)
    ("gem"                . ,Garnet-Gem-Pathname)
    ("opal"               . ,Garnet-Opal-Pathname)
    ("truetype"           . ,Garnet-Truetype-PathName)
    ("inter"              . ,Garnet-Inter-PathName)
    ("gesture"            . ,Garnet-Gesture-PathName)
    ("gestures"           . ,Garnet-Gesture-PathName)
    ("ps"                 . ,Garnet-PS-PathName)
    ("aggregadgets"       . ,Garnet-Aggregadgets-PathName)
    ("debug"              . ,Garnet-Debug-PathName)
    ("demos"              . ,Garnet-Demos-PathName)
    ("demo"               . ,Garnet-Demos-PathName)
    ("gilt"               . ,Garnet-Gilt-PathName)
    ("c32"                . ,Garnet-C32-PathName)
    ("lapidary"           . ,Garnet-Lapidary-PathName)
    ("contrib"            . ,Garnet-Contrib-PathName)
    ("protected-eval"     . ,Garnet-Protected-Eval-PathName)
;;; Source directories.
    ("utils-src"          . ,Garnet-Utils-Src)
    ("kr-src"             . ,Garnet-KR-Src)
    ("gworld-src"         . ,Garnet-Gworld-Src)
    ("gem-src"            . ,Garnet-Gem-Src)
    ("opal-src"           . ,Garnet-Opal-Src)
    #-(and)
    ("truetype-src"       . ,Garnet-Truetype-Src)
    ("inter-src"          . ,Garnet-Inter-Src)
    ("gesture-src"        . ,Garnet-Gesture-Src)
    ("gestures-src"       . ,Garnet-Gesture-Src)
    ("ps-src"             . ,Garnet-PS-Src)
    ("aggregadgets-src"   . ,Garnet-Aggregadgets-Src)
    ("gadgets-src"        . ,Garnet-Gadgets-Src)
    ("gg-src"             . ,Garnet-Gadgets-Src)
    ("debug-src"          . ,Garnet-Debug-Src)
    ("demos-src"          . ,Garnet-Demos-Src)
    ("demo-src"           . ,Garnet-Demos-Src)
    ("gilt-src"           . ,Garnet-Gilt-Src)
    ("c32-src"            . ,Garnet-C32-Src)
    ("lapidary-src"       . ,Garnet-Lapidary-Src)
    ("contrib-src"        . ,Garnet-Contrib-Src)
    ("protected-eval-src" . ,Garnet-Protected-eval-Src)
    ))


;;; The actual loader code.
;;
(defun Add-Garnet-Load-Prefix (prefix pathname)
  (push (cons prefix pathname) Garnet-Load-Alist))

(defun Garnet-Load (filename)
  "Load a file. If the file is prefixed with a Garnet module name, get
the file from the proper directory in the Garnet source tree.
Otherwise just load the filename as given."
  (let ((pos (position #\: filename)))
    (if pos
        (let* ((module (subseq filename 0 pos))
               (name (subseq filename (1+ pos)))
               (module-src-directory
                (or (cdr (assoc module Garnet-Load-Alist :test #'string=))
                    (error "Module ~S is not a Garnet module" module)))
               (src-pathname (make-pathname :name name
                                            ;; For Windows.
                                            :device (pathname-device module-src-directory)
                                            :directory (pathname-directory
                                                        module-src-directory))))
          (force-output *error-output*)
          (format T "~&Loading ~s~%" src-pathname)
          (force-output)
          (load src-pathname))
        ;; else no module name found; load regular.
        (progn
          (format T "No module name given: Loading ~s~%" filename)
          (load filename)))))


;;; Garnet-Compile.
;; This function will compile your garnet files while keeping the
;; sources and binaries separated.  If you want to just compile one
;; file from Garnet, like the gadget file gauge.lisp, then you could
;; use this function to compile the source file and automatically
;; save the binary file in the proper directory in the binary tree.
;;
;; Example:
;;    (garnet-compile "gadgets:gauge")
;;    Takes the source file from Garnet-Gadgets-Src, compiles it, and
;;    saves the binary file in Garnet-Gadgets-Pathname (the binary
;;    gadgets directory).
;;
(defvar *compiler-extension*
  (pathname-type (compile-file-pathname "foo.lisp")))

;;; RGA  This will lose on Windows XXX
(defun garnet-mkdir-if-needed (dirname)
  "Creates the directory if it does not exist."
  (ensure-directories-exist dirname :verbose t))

(defun Garnet-Compile (filename)
  "Compile a single Garnet file, finding the source in the Garnet
source tree and installing the result in the corresponding directory
in the binary tree.

Example:
    (garnet-compile \"gadgets:gauge\")
    Takes the source file from Garnet-Gadgets-Src, compiles it, and
    saves the binary file in Garnet-Gadgets-Pathname (the binary
    gadgets directory)."

  (let* ((pos (position #\: filename))
         (module (if pos
                     (subseq filename 0 pos)
                     ;; else no colon, abort
                     (error
                      "The filename ~A is not prefixed by a garnet module name. Aborting compile"
                      filename)))
         ;; We want to extract just the name part, without the .lisp if present.
         (filepath (subseq filename (1+ pos)))
         (name (pathname-name filepath))
         (type (pathname-type name))
         (module-src (concatenate 'string module "-src"))
         (module-src-directory
          (or (cdr (assoc module-src Garnet-Load-Alist
                          :test #'string=))
              (cdr (assoc module Garnet-Load-Alist
                          :test #'string=))
              (error "Module named ~S not found in Garnet-Load-Alist"
                     module)))
         (module-bin-directory
          (or (cdr (assoc module Garnet-Load-Alist
                          :test #'string=))
              (error "Module named ~S not found in Garnet-Load-Alist"
                     module)))
         (src-pathname (make-pathname :name name
                                      ;; If no user supplied type, add default.
                                      :type (or type "lisp")
                                      :device (pathname-device module-src-directory)
                                      :directory (pathname-directory module-src-directory)))
         #+cmu
         (err-pathname (make-pathname :name name
                                      :type (or type "err")
                                      :device (pathname-device module-src-directory)
                                      :directory (pathname-directory module-src-directory)))
         (bin-pathname (make-pathname :name name
                                      :type *compiler-extension*
                                      :device (pathname-device module-bin-directory)
                                      :directory (pathname-directory module-bin-directory))))
    (force-output *error-output*)
    (format T "~&Compiling ~s~%" src-pathname)
    (format T "for output to ~s~%" bin-pathname)
    (force-output)
    ;; sds: make sure that bin/foo directory is already there
    (garnet-mkdir-if-needed bin-pathname)
    (let ((*compile-verbose* Garnet-Garnet-Debug)
          (*compile-print* Garnet-Garnet-Debug))
      (compile-file src-pathname))))



;;; ----------------------------------------
;;
;; The real load
;;

(format t "...Loading Garnet ...~%")
(setf *load-verbose* t)


;; Now back to loading Garnet
(format t "****** Check for load-kr-doc-p: ~s~%" load-kr-doc-p)

(if load-kr-doc-p (garnet-load "kr:kr-doc"))


(format T "~%****** NOT Loading Aggregraphs *******
** To load aggregraph programs, execute (load Garnet-Aggregraphs-Loader)~%")


;; RGA added two auxiliary functions for doing file manipulations.
;; Right now they are used to copy the xxx-loader files into the
;; target directories.
;;
;; FMG Rewrote file copy function to use lisp facilities instead of
;; calling out to the shell. Got rid of shell exec function (there is
;; still one in the utils directory).
(defun garnet-copy-files (src-dir bin-dir file-list)
  "Copies a list of files (usually loader files) from source directory
  to binary directory."
  (dolist (file file-list)
    (let ((src (merge-pathnames file src-dir))
          (dest (merge-pathnames file bin-dir)))
      ;; Yes this conses up the wazoo. But it's only used during builds.
      (with-open-file (s src :element-type '(unsigned-byte 8))
        (let ((buffer (make-array (file-length s) :element-type '(unsigned-byte 8))))
          (read-sequence buffer s)
          (with-open-file (d dest
                             :direction :output
                             :if-does-not-exist :create
                             :if-exists :overwrite
                             :element-type '(unsigned-byte 8))
            (write-sequence buffer d)))))))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (setf sb-ext:*muffled-warnings* 'sb-kernel::uninteresting-redefinition))
