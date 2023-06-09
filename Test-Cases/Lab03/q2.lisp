(deftest test-filter-ages ()
  (check
    (equalp (let* ((alice (make-person :name "Alice" :age 25))
                  (bob (make-person :name "Bob" :age 30))
                  (charlie (make-person :name "Charlie" :age 20))
                  (david (make-person :name "David" :age 35))
                  (people (vector alice bob charlie david)))
             (filter-ages people 25))
           (vector "Bob" "David"))
    (equalp (let* ((alice (make-person :name "Alice" :age 25))
                  (bob (make-person :name "Bob" :age 30))
                  (charlie (make-person :name "Charlie" :age 20))
                  (david (make-person :name "David" :age 35))
                  (people (vector alice bob charlie david)))
             (filter-ages people 30))
           (vector "David"))
    (equalp (let* ((alice (make-person :name "Alice" :age 25))
                  (bob (make-person :name "Bob" :age 30))
                  (charlie (make-person :name "Charlie" :age 20))
                  (david (make-person :name "David" :age 35))
                  (people (vector alice bob charlie david)))
             (filter-ages people 20))
           (vector "Alice" "Bob" "David"))
    (equalp (let* ((alice (make-person :name "Alice" :age 25))
                  (bob (make-person :name "Bob" :age 30))
                  (charlie (make-person :name "Charlie" :age 20))
                  (david (make-person :name "David" :age 35))
                  (people (vector alice bob charlie david)))
             (filter-ages people 35))
           (vector))))


;; Additional test cases for edge cases

(deftest test-filter-ages-edge-cases ()  
  (check
    (equalp (let* ((empty-people (make-array 0 :element-type 'person)))
              (filter-ages empty-people 25))
            (vector))
    (equalp (let* ((single-person (make-array 1 :element-type 'person :initial-contents (list (make-person :name "Alice" :age 25)))))
              (filter-ages single-person 25))
            (vector))
    (equalp (let* ((single-person (make-array 1 :element-type 'person :initial-contents (list (make-person :name "Alice" :age 25)))))
              (filter-ages single-person 20))
            (vector "Alice"))))

(defun test-q2 ()
  (test-filter-ages)
  (test-filter-ages-edge-cases)
  (fmakunbound 'test-filter-ages)
  (fmakunbound 'test-filter-ages-edge-cases))

(test-q2)
