;;NOTES
ADD TO ADVANCED FILTERING SELECTION
- for some values, have a <= or >= the selected item.

| INTERVIEW COLS     |        |   |
| Column Name        | Number |   |
|--------------------+--------+---|
| UniversityGroup    |      0 |   |
| InterviewID        |      1 |   |
| ApplicationID      |      2 |   |
| FirstName          |      3 |   |
| LastName           |      4 |   |
| University         |      5 |   |
| Date               |      6 |   |
| Notes              |      7 |   |
| ShortNote          |      8 |   |
| City               |      9 |   |
| State              |     10 |   |
| asp                |     11 |   |
| html               |     12 |   |
| php                |     13 |   |
| cPlusPlus          |     14 |   |
| java               |     15 |   |
| sql                |     16 |   |
| cSharp             |     17 |   |
| dotNet             |     18 |   |
| vb                 |     19 |   |
| attitudeScore      |     20 |   |
| problemSolvingS    |     21 |   |
| collaborationScore |     22 |   |
| communicationScore |     23 |   |
| TestingScore       |     24 |   |
| SoftwareDevScore   |     25 |   |

| EMPLOYEE COLS     |        |
| Column Name       | Number |
|                   |        |
|-------------------+--------+
| EmployeeID        |      0 |
| FirstName         |      1 |
| LastName          |      2 |
| EmailAddress      |      3 |
| CellPhone         |      4 |
| PhoneNumber       |      5 |
| GraduateStatus    |      6 |
| StartDate         |      7 |
| GradDate          |      8 |
| GPA               |      9 |
| Major             |     10 |
| StreetAddress     |     11 |
| StreetAddress2    |     12 |
| City              |     13 |
| State             |     14 |
| ZipCode           |     15 |
| EndDate           |     16 |
| CustomerManager   |     17 |
| MaverickID        |     18 |
| BillableDate      |     19 |
| ShortNote         |     20 |
| Note              |     21 |
| TempAddress       |     22 |
| TempAddress2      |     23 |
| TempCity          |     24 |
| TempState         |     25 |
| TempZipCode       |     26 |
| GradYear          |     27 |
| LastReviewDate    |     28 |
| Birthdate         |     29 |
| WorkEmail         |     30 |
| Watched           |     31 |
| AlarmCode         |     32 |
| ContractsSent     |     33 |
| Parking           |     34 |
| OfficeName        |     35 |
| GradSeason        |     36 |
| UniversityName    |     37 |
| CustomerName      |     38 |
| EmployeeStatus    |     39 |
| CustomerGroupName |     40 |


| APP COLS          |        |
| Column Name       | Number |
|-------------------+--------|
| UniversityGroup   |      0 |
| ApplicationID     |      1 |
| FirstName         |      2 |
| LastName          |      3 |
| StatusR           |      4 |
| EmailAddress      |      5 |
| PhoneNumber       |      6 |
| University        |      7 |
| GradStatus        |      8 |
| TwentyHours       |      9 |
| BusinessHours     |     10 |
| FourtyHours       |     11 |
| StartDate         |     12 |
| GradDate          |     13 |
| date              |     14 |
| DevWork           |     15 |
| DatabaseWork      |     16 |
| asp               |     17 |
| html              |     18 |
| php               |     19 |
| cPlusPlus         |     20 |
| java              |     21 |
| sql               |     22 |
| cSharp            |     23 |
| dotNet            |     24 |
| vb                |     25 |
| Resume            |     26 |
| MajorGPA          |     27 |
| Major             |     28 |
| Interest          |     29 |
| Referral          |     30 |
| TestOrDev         |     31 |
| class1            |     32 |
| class2            |     33 |
| class3            |     34 |
| class4            |     35 |
| class5            |     36 |
| class6            |     37 |
| WorkAuth          |     38 |
| ViewedApplication |     39 |
| Comments          |     40 |
| Note              |     41 |
| City              |     42 |
| State             |     43 |
| StreetAddress     |     44 |
| StreetAddress2    |     45 |
| ZipCode           |     46 |



(- 71 26)
45


find . -name "*.css" -exec grep -nl "css_right" {} \;

(emacs-uptime) Wed Dec  4 10:56:50 2013
"14 days, 22 hours, 35 minutes, 40 seconds"


(defun  ()
  "DOCSTRING"
  (interactive) 
  (let (var1)
    (setq var1 some)
    
    ))

x


                                        ; files not in vc
'(PostEmploymentFormController mavconsulting.jpg )

rgb(46, 110, 158);
All

(global-set-key (kbd "C-c C-e") (hs-hide-block))
(global-set-key (kbd "C-c C-a") (hs-show-block))


;; (defun get-selection-or-unit (unit)
;;   "Return the string and boundary of text selection or UNIT under cursor.

;; If `region-active-p' is true, then the region is the unit.  Else,
;; it depends on the UNIT. See `unit-at-cursor' for detail about
;; UNIT.

;; Returns a vector [text a b], where text is the string and a and b
;; are its boundary.

;; Example usage:
;;  (setq bds (get-selection-or-unit 'line))
;;  (setq inputstr (elt bds 0) p1 (elt bds 1) p2 (elt bds 2)  )"
;;   (interactive)

;;   (let ((p1 (region-beginning)) (p2 (region-end)))
;;     (if (region-active-p)
;;         (vector (buffer-substring-no-properties p1 p2) p1 p2 )
;;       (unit-at-cursor unit) ) ) )

(require 'thingatpt)


(defun privitize ()
  "DOCSTRING"
  (interactive)
  (let (initString beginString finalString bds p1 p2 resultStr)
    (if (region-active-p)
        (setq bds (cons (region-beginning) (region-end) ))
      (setq bds (bounds-of-thing-at-point 'word)))
    (setq p1 (car bds) )
    (setq p2 (cdr bds) )
    (setq initString (thing-at-point 'word))
    (setq beginString (substring initString 0 1))
    (setq finalString (substring initString 1 nil))
    (setq beginString (concat "_" (downcase beginString)))
    (setq resultStr (concat beginString finalString))
    (delete-region p1 p2 ) 
    (insert resultStr)))

_thisIs


(substring "abcd" 0 1)
