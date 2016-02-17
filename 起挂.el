(defun 更新 (l key val)
  (setq l (cons (cons key val)
                (delq (assoc key l) l))))
(defvar 六个爻 '("初爻" "二爻" "三爻" "四爻" "五爻" "上爻"))

(defvar 老阳 "老阳 ———  ->  —  —")
(defvar 老阴 "老阴 —  —  ->  ———")
(defvar 少阳 "少阳 ———      ———")
(defvar 少阴 "少阴 —  —      —  —")

(defvar 地支五行
  '(
    ("子" . "水")
    ("丑" . "土")
    ("寅" . "木")
    ("卯" . "木")
    ("辰" . "土")
    ("巳" . "火")
    ("午" . "火")
    ("未" . "土")
    ("申" . "金")
    ("酉" . "金")
    ("戌" . "土")
    ("亥" . "水")
    ))

(defvar 八卦纳甲
  '(
    ("乾" . ("甲子" "甲寅" "甲辰" "壬午" "壬申" "午戌"))
    ("坤" . ("乙未" "乙巳" "乙卯" "癸丑" "癸亥" "癸酉"))
    ("震" . ("庚子" "庚寅" "庚辰" "庚午" "庚申" "庚戌"))
    ("巽" . ("辛丑" "辛亥" "辛酉" "辛未" "辛巳" "辛卯"))
    ("坎" . ("戊寅" "戊辰" "戊午" "戊申" "戊戌" "戊子"))
    ("离" . ("己卯" "己丑" "己亥" "己酉" "己未" "己巳"))
    ("艮" . ("丙辰" "丙午" "丙申" "丙戌" "丙子" "丙寅"))
    ("兑" . ("丁巳" "丁卯" "丁丑" "丁亥" "丁酉" "丁未"))
    ))

(defun 纳甲地支取五行 (干支)
  (assoc (substring 干支 1) 地支五行))

(defvar 八卦
  `(
    ("乾" . ,(make-list 3 '少阳))
    ("坤" . ,(make-list 3 '少阴))
    ("艮" . (阴爻 阴爻 阳爻))
    ("兑" . (阳爻 阳爻 阴爻))
    ("坎" . (阴爻 阳爻 阴爻))
    ("离" . (阳爻 阴爻 阳爻))
    ("震" . (阳爻 阴爻 阴爻))
    ("巽" . (阴爻 阳爻 阳爻))
    ))

(defvar 八纯卦
  `(
    ("乾" . ,(make-list 6 '少阳))
    ("坤" . ,(make-list 6 '少阴))
    ("艮" . (阴爻 阴爻 阳爻 阴爻 阴爻 阳爻))
    ("兑" . (阳爻 阳爻 阴爻 阳爻 阳爻 阴爻))
    ("坎" . (阴爻 阳爻 阴爻 阴爻 阳爻 阴爻))
    ("离" . (阳爻 阴爻 阳爻 阳爻 阴爻 阳爻))
    ("震" . (阳爻 阴爻 阴爻 阳爻 阴爻 阴爻))
    ("巽" . (阴爻 阳爻 阳爻 阴爻 阳爻 阳爻))
    ))

(defvar 八卦对应五行
  '(
    ("乾" . "金")
    ("兑" . "金")
    ("离" . "火")
    ("震" . "木")
    ("巽" . "木")
    ("坎" . "水")
    ("艮" . "土")
    ("坤" . "土")
    ))

(defvar 五行相生
  '(
    ("水" . "木")
    ("木" . "火")
    ("火" . "土")
    ("土" . "金")
    ("金" . "水")
    ))

(defvar 五行相克
  '(
    ("水" . "火")
    ("木" . "土")
    ("火" . "金")
    ("土" . "水")
    ("金" . "木")
    ))

(defvar 四相 '((1 . 少阳) (2 . 少阴)(3 . 老阳) (0 . 老阴)))

(defvar 卦)

(defun 装卦 ()
  (setq 卦 nil)
  (dolist (n 六个爻)
    (setq 卦 (cons (cons n (cdr (assoc (random 4) 四相)))
		   卦))))

(defun 新buffer显示卦 ()
  (with-current-buffer
      (switch-to-buffer "新卦")
    (dolist (每爻 卦)
      (insert (concat (symbol-value (cdr 每爻)))
	      "\n"))))

(defun 起卦 ()
  (interactive)

  (装卦)

  (新buffer显示卦))
